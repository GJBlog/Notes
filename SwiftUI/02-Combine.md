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

**delay**：简单将所有事件按照一定事件延后

**debounce**：设置一个计时器，在事件第一次到来时，计时器启动。在计时器有效期间，每次接收到新值，则将计时器时间重置。当且仅当计时窗口中没有新的值到来时，最后一次事件的值才会被当作新的事件发送出去。

**Empty**：是一个简单的发布者，只在被订阅时候发布一个完成事件,不会输出任何的ouput值
只能用于表示某个事件已经发生

**Just**：表示单一的值，在被订阅后，值会被发送出去，紧接着是finished
**Sequence**：接收一个数组，也可以是一个Range,，被订阅时，元素被逐个发送出来

**Scan**：一边进行重复操作，一边将每一步中间状态发送出去的场景十分普遍
**flapMap**:的变形闭包中需要返回一个Publisher

**removeDuplicates**：移除重复的事件值，经常用来减少非常消耗资源的操作

**Fail**：在订阅时发送一个错误事件

如果 Publisher 在出错时发送的是 SampleError，但订阅方声明只接受 MyError 时，就算实际上 Publisher 只发出 Output 值而从不会发出 Failure 值，我们也无法使用这个 Subscriber 去接收一个类型不符的 Publisher 的事件

**mapError**：将publisher的Failure转换其他Failure类型
**tryMap**：将处理数据时发生的错误转变为标志事件流失败的结束事件

除了 tryMap 以外，Combine 中还有很多类似的以 try 开头的 Operator，比如 tryScan，tryFilter，tryReduce 等等。当你有需求在数据转换或者处理时，将事件流以错误进行终止，都可以使用对应操作的 try 版本来进行抛出，并在订阅者一侧接收到对应的错误事件

**replaceError**：会把错误替换成一个给定的值，并且立即发送 finish事件

**catch**：接受一个新的publisher, 当上游 Publisher 发生错误时，catch 操作会使用新的 Publisher 来把原来的 Publisher 替换掉

#### 操作符熔合：
将操作符的作用时机提前到创建publisher时的方式，被称为操作符熔合

**zip**压缩：
它会把两个 (或多个) Publisher 事件序列中在同一 index 位置上的值进行合并，也就是说，Publisher1 中的第一个事件和 Publisher2 中的第一个事件结对合并，Publisher1 中的第二个事件和 Publisher2 中的第二个事件合并，以此类推
在时序语义上更接近于：当...且...

**combineLatest**
与zip相反，语义接近于"当...或..."

当Publisher1 发布值，或者 Publisher2 发布值时，将两个值合并，作为新的事件发布出去。
不论是哪个输入 Publisher，只要发生了新的事件，combineLatest 就把新发生的事件值和另一个 Publisher 中当前的最新值合并

**Future**：用于订阅操作和值的发布是异步行为，不在同一时间发生，提供一个方式可以让我们创建一个接受未来事件的publisher
注意点：只能提供一次性的Publisher，
对于Promise，只有两个选择，要么发送一个值并让Publisher正常结束，或者发送一个错误，适用于必然产生事件结果，且至多只会产生一个结果的场景

**subject**：
如果你的异步 API 有可能不发送任何一个值，而是可能发布两个或更多的值的话，你会需要一个更加一般性的 Publisher 类型来把指令式程序转换为响应式程序，这个类型就是 Subject

**Timer Publishe**r：使用时，注意需要手动调用connect() 方法，它才会开始发送事件

Subject
1、sink
2、assign：将 Publisher 的输出值通过 key path 绑定到一个对象的属性上去

#### Cancellable、AnyCancellable

1、**Cancelable**：是一个抽象协议，需要再何时的时候主动调用cancel() 方法来完结，如果我们在没有调用cancel()的情况下就将connect 的返回值忽略或者释放掉，那么就会永远无法取消掉，会一直存在，并造成内存泄漏

2、**AnyCancellable**：是一个class，它会在自己的deinit 中帮我们调用cancel()，自动释放资源

可以将Cancellable作为参数传递给AnyCancelable的初始化方法，将Cancellable 包装成一个可以自动取消的对象

#### 注意

@publisher：需要内部生成并持有存储，只能针对定义在class 里的变量添加@published
