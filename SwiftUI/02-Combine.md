01-Combine框架

### 介绍

> 非常适合用来配合声明式的SwiftUI，创建出稳定和单向的数据流动

异步编程的本质

* 响应未来发生的事件流

响应式异步编程的抽象和特点

* 异步操作在合适的时机发布事件(事件带有数据)
* 使用一个或者多个操作来处理这些事件以及内部的数据
* 在末端，会有一个订阅者来消化处理后的事件和数据，并进一步驱动程序的其他部分(UI界面)的运行

过程

* 事件(及其对应的数据)被发布(Publisher) ---> 操作(事件和数据)变形(IOperator) --> 被订阅者使用(Subscriber)



两种编程方式：1、指令式；2、声明式

如果说指令式是教会计算机怎么做，那么声明式就是告诉计算机要做什么

指令式编程是描述过程，期望程序执行以得到想要的结果

声明式编程则是描述结果，让计算机为我们考虑和自组织出具体过程，最后得到被描述的结果

FRP

Publisher

Subscriber

Operator

#### Publisher

> 事件发布



##### SubScripber

> 事件接收

系统提供的有

1、sink

使用

```swift
let buttonClicked: AnyPublisher<Void, Never>
buttonClicked
.scan(0) { value, _ in value + 1 }
.map { String($0) }
.sink { print("Button pressed count: \($0)") }
```

定义

```swift
public func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
```

```swift
public func sink(receiveCompletion: @escaping ((Subscribers.Completion<Self.Failure>) -> Void), receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
```

2、assign

要求

只有class类型的实例的属性才能被绑定，ObservableObject 接口正好满足

使用

```swift
class Foo {
    var bar: String = ""
}
let foo = Foo()
let buttonClicked: AnyPublisher<Void, Never>
buttonClicked
    .scan(0) { value, _ in value + 1 }
    .map { String($0) }
    .assign(to: \.bar, on: foo)
```

定义

```swift
public func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable
```

#### Subject

本身也是一个Publisher，外部调用这可以通过send方法来主动地发布Ouput值、failure事件或者finish事件，它可以将传统的指令式异步API里的事件和信号转化到响应式的世界中去

##### 两种常见的 Subject 类

* PassthroughSubject

不会对接受的值进行保留，订阅开始后，它将监听并响应接下来的事件

```swift
let publisher = PassthroughSubject<Int, Never>()
print("开始订阅")
let call = publisher.sink { complete in
    print(complete)
} receiveValue: { value in
    print(value)
}
publisher.send(1)
publisher.send(2)
publisher.send(completion: .finished)

// 打印
开始订阅
1
2
finished
```

```swift
let publisher = PassthroughSubject<Int, Never>()
print("开始订阅")
publisher.send(1)
let call = publisher.sink { complete in
    print(complete)
} receiveValue: { value in
    print(value)
}
publisher.send(2)
publisher.send(completion: .finished)

// 打印
开始订阅
2
finished
```



注意点：使用时，一定要添加sink的返回值，否则订阅会自动取消，不会执行

* CurrentValueSubject

与上面PassthroughSubject不同，它会包装和持有1个值，并在设置该值时发送事件并保留新的值。在订阅发生的瞬间，CurrentValueSubject 会把当前保存的值发送给订阅者

```swift
let publisher = CurrentValueSubject<Int, Never>(0)
print("开始订阅")
let call = publisher.sink { complete in
    print(complete)
} receiveValue: { value in
    print(value)
}
publisher.value = 1
publisher.value = 2
publisher.send(completion: .finished)

// 打印
开始订阅
0
1
2
finished
```

开始订阅后，publisher 里当前存储的 0 被立即发送给了 receiveValue，接下来对 publisher.value 的每次设置也都触发了订阅者的响应。

#### Scheduler

> 解决的问题：什么地方、什么时候来发布事件和执行代码

Combine 里提供了 receive(on:options:) 来让下游在指定的线程中接收事件。比如，对于后台线程的网络请求返回，可以通过这样的方式在 main runloop 中进行处理

RunLoop 就是一个实现了 Scheduler 协议的类型，它知道要如何执行后续的订阅任务

```swift
URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.baidu.com")!)
    .compactMap { String(data: $0.data, encoding: .utf8) }
    .receive(on: RunLoop.main)
    .sink { _ in

    } receiveValue: {
        print($0)
    }
```

Scheduler 的另一个重要工作是为事件的发布指定和规划时间，改变事件链的传递时间，比如加入延迟或者等待空闲时再进行传递，这些延时也是由 Scheduler 负责调度的

常见的两种操作是delay、debounce

delay：简单将所有事件按照一定事件延后

debounce：设置一个计时器，在事件第一次到来时，计时器启动。在计时器有效期间，每次接收到新值，则将计时器时间重置。当且仅当计时窗口中没有新的值到来时，最后一次事件的值才会被当作新的事件发送出去。
