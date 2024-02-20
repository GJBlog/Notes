## Swift-并发

#### 定义异步方法

为了表明函数或方法是异步的，可以在其参数后面的声明中写入 `async` 关键字，类似于使用 `throws` 标记抛出函数。如果函数或方法返回一个值，在返回箭头( `->` )之前写 `async`

对于既异步又抛出的函数或方法，在 `throws` 之前写 `async`

```swift
func listPhotos(inGallery name: String) async throws -> [String] {
    let result = // ... some asynchronous networking code ...
    return result
}
```

#### 调用异步方法

只有如下地方可以调用异步函数或方法

* Code in the body of an asynchronous function, method, or property.

异步函数、方法或属性体中的代码

* Code in the static `main()` method of a structure, class, or enumeration that’s marked with `@main`.

标记为 `@main` 的结构体、类或枚举的静态 `main()` 方法中的代码。

* Code in an unstructured child task, as shown in [Unstructured Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency#Unstructured-Concurrency) below

非结构化子任务中的代码，如下面的非结构化并发中所示。

#### 执行流程

调用异步方法时，执行将暂停，直到该方法返回。在调用前面写 `await` 来标记可能的暂停点。这就像在调用抛出函数时写 `try` ，以标记在出现错误时可能对程序流进行的更改。在异步方法内部，只有在调用另一个异步方法时才挂起执行流程——挂起从来不是隐式的或抢占式的——这意味着每个可能的挂起点都用 `await` 标记。标记代码中所有可能的挂起点有助于使并发代码更容易阅读和理解

#### 模拟并发工作时间

 `Task.sleep(for:tolerance:clock:)` 此方法将当前任务挂起至少给定的时间。用来模拟等待网络耗时情况

```swift
// 定义
func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}
// 调用
let photos = try await listPhotos(inGallery: "A Rainy Weekend")
```

#### Asynchronous Sequences(异步序列)

遍历时，一次等待集合的一个元素，对应的协议是：AsyncSequence

```swift
let handle = FileHandle.standardInput
for try await line in handle.bytes.lines {
    print(line)
}
```

#### 并行调用异步函数

1、一次只运行一段代码，逐个调用，调用方等待该代码完成后，再继续运行下一行代码

```swift
let firstPhoto = await downloadPhoto(named: photoNames[0])
let secondPhoto = await downloadPhoto(named: photoNames[1])
let thirdPhoto = await downloadPhoto(named: photoNames[2])

let photos = [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```

**最大问题：**虽然是异步方式，并且允许在下载过程中进行其他工作，但是一次只运行一个对downloadPhoto的调用

**改进**：调用异步代码并让它与周围代码并行运行，**在定义常量时在 `let` 前面写 `async` ，然后在每次使用常量时写 `await`** 

```swift
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
```

让同时多个异步代码可以同时执行

#### Task and Task Groups (任务和任务组)

任务是作为程序的一部分异步运行的工作单元，所有异步代码都是作为某个任务的一部分运行，创建多个任务时，Swift可以让它们同时运行

**Async - let** ：语法会隐式创建子任务，用于明确知道需要运行哪些任务场景

**TaskGroup**：创建任务组，显式添加子任务，更好控制优先级和任务取消，允许创建动态数量的任务

同一个任务组中，每个任务都有相同的父任务，每个任务可以拥有子任务，由于任务和任务组之间存在显式关系，因此这种方法称为结构化并发。**具有如下特点：**

* 在**父任务**中，不能忘记等待它的**子任务**完成
* 当在**子任务**上设置更高的优先级时，**父任务**的优先级将自动升级
* 当**父任务**被取消时，它的每个**子任务**也会自动取消
* 任务本地值有效且自动地传播到**子任务**

使用任务组，有两个方法：``withTaskGroup``、``withThrowingTaskGroup(支持抛出异常)``

```swift
await withTaskGroup(of: Data.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTask {
            return await downloadPhoto(named: name)
        }
    }
    for await photo in group {
        show(photo)
    }
}
```
如果需要再任务组有返回结果，则可以这样子
```swift
let photos = await withTaskGroup(of: Data.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTask {
            return await downloadPhoto(named: name)
        }
    }
    var results: [Data] = []
    // 循环等待下一个子任务完成，将该任务的结果附加到结果数组中，然后继续等待，直到所有子任务都完成
	   for await photo in group {
        results.append(photo)
     }
     return results
}
```

#### Task Cancellation(任务取消)

遇到如下场景，则会任务取消

* 抛出类似CancellationError的错误
* 返回nil或者空集合
* 返回部分完成的工作

当需要检查**任务是否被取消**时，可以通过如下两种方法

```swift
// 第一种(会抛出错误)
Task.checkCancellation()
// 第二种(属性)
Task.isCancelled 
```

```swift
let photos = await withTaskGroup(of: Optional<Data>.self) { group in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
		// addTaskUnlessCancelled：避免在取消后开始新的工作	
        group.addTaskUnlessCancelled {
            guard isCancelled == false else { return nil }
            return await downloadPhoto(named: name)
        }
    }
    var results: [Data] = []
    for await photo in group {
        if let photo { results.append(photo) }
    }
    return results
}
```

使用```Task.withTaskCancellationHandler(operation:onCancel:)` ``处理需要立即通知取消的工作

```swift
let task = await Task.withTaskCancellationHandler {
    // ...
} onCancel: {
    print("Canceled!")
}


// ... some time later...
task.cancel()  // Prints "Canceled!"
```

#### Unstructured Concurrency(非结构化并发)

比对上面的结构化并发，非结构化任务不存在父任务

创建**在当前Actor上运行的**非结构化任务

```swift
Task.init(priority:operation:) 
```

创建**不在当前Actor上运行**的非结构化任务(分离任务)

```swift
Task.detached(priority:operation:) 
```

#### Actor(演员)

引用类型

用于安全的在并并发代码之间共享信息，类中引用类型和值类型的比较同样适用于actor，定义 actor

```swift
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int


    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}
```

特点：具有外部可以访问属性，但是只有内部可以修改属性

#### 可发送协议

声明符合**Sendable**协议，将类型标记为可发送的，该协议没有任何代码要求，一般来说，一个类型有三种可发送的方式

* 值类型,其可变状态由其他可发送数据组成，例如，具有可发送的存储属性的结构体或者具有可发送的关联值的枚举
* 类型没有任何可变状态，例如只有只读属性的结构体或者类
* 类型具有确保其可变状态安全的代码，例如标记**@MainActor**，或者在特定线程或队列上序列化对其属性的访问的类

总是可发送的类型，例如结构体只有可发送的属性，枚举只具有可发送的关联值

```swift
struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}
```

如果需要显式将类型标记为**不可发送**，覆盖对Sendable协议的隐式一致性，使用扩展

```swift
struct FileDescriptor {
    let rawValue: CInt
}

@available(*, unavailable)
extension FileDescriptor: Sendable {}
```



#### 参考资料

[官方文档](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/#Calling-Asynchronous-Functions-in-Parallel)

