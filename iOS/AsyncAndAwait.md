## Async-await

#### Async Property

* 仅仅只读属性可以被标记为 async
* 必须显式标记出来 get 关键字

```swift
extension UIImage {
      var thunmbnail: UIImage? {
        get async {
            let size = CGSize(width: 40, height: 40)
            return await self.byPreparingThumbnail(ofSize: size)
        }
    }
}
```

* 从swift 5.5 开始， 属性get 也可以抛出异常

#### 使用 await 的场景

* 函数、属性、初始化器、for循环

```swift
```

使用 async-let 可以并行处理异步工作

#### 任务和任务组

#### Task modifier(修饰符)

* task modifier 的任务上下文将和它所修饰的View的声明周期绑定；当被修饰的 View identifier 改变 (比如被其他 View 取代) 或者被从屏幕上移除时时，task 所关联的任务也将被取消；而 onAppear 和 Task.init 所创建的任务，则和 View 的生命周期无关



#### OC =>Swift

1、如果是包含completion关键字，则会自动将其转为async的形式以及原本的swift形式

```objective-c
// OC
+ (void)checkPerform:(NSString *)name completion:(void(^)(NSString *))completion;

// Swift
class func checkPerform(_ name: String) async -> String
```

2、如果不包含completion的关键字，则需要在OC方法声明时指定NS_SWIFT_ASYNC(XX)，才可以

```objective-c
// OC，NS_SWIFT_ASYNC(XX)
// XX：表示第一个参数(从1开始)
+ (void)handleResult:(NSString *)name success:(void(^)(NSString *))success failure:(void(^)(NSError *error))failure  NS_SWIFT_ASYNC(3);

// Swift
class func handleResult(_ name: String, success: @escaping (String) -> Void) async -> Error
```

#### 结构化并发

非结构化并发带来的问题

1、并不能保证函数中任务的执行一定会在函数调用的结束而结束

2、派发回调破坏了并发的黑盒

**定义**

1、即使使用并发操作，也要保证控制流丼的单一入口和单一出口

2、程序可以产生多个控制流来实现并发，但是所有的并发路径在出口时都应该处于完成(或取消)状态，并合并到一起

**条件**

1、需要依赖异步函数，异步函数又必须运行在某个任务的上下文中

2、以任务为基本要素组织的

**目的**

1、主要是将子任务的生命周期控制在任务组的作用域内

##### 当前任务状态

1、使用 withUnsafeCurrentTask：获取和检查当前任务，前提：在任意的异步函数中

##### 任务层级-在任务树上创建叶子节点

有两个方法

**1、任务组(task group)**

在某个异步函数中，通过withTaskGroup为当前任务添加一组结构化的并发子任务

如果使用group时，没有明确await任务组，编译器在检测到结构化并发作用域结束时，会为我们自动添加上await并在等待所有任务结束后再继续控制流

```swift
print("Start")

await withTaskGroup(of: Int.self) { group in
    for i in 0..<3{
        group.addTask {
            await work(i)
        }
    }
    print("Task added")
    for await result in group {
        print("Get result:\(result)")
        break
    }
    print("Task ended")
}
print("End")

private func work(_ value: Int) async -> Int {
    print("Start work\(value)")
    try? await Task.sleep(nanoseconds: UInt64(value) * NSEC_PER_SEC)
    print("Work\(value)done")
    return value
}
```

打印结果

```swift
Start
Task added
Start work1
Start work0
Start work2
Work0done
Get result:0
Task ended
Work1done
Work2done
End
```

* 值捕获

任务组中的每个子任务都拥有返回值

下面做法会导致编译错误

错误信息：Mutation of captured var ‘value’ in concurrently-executing code

```swift
let v: Int = await withTaskGroup(of: Int.self) { group in
	var value = 0
	for i in 0 ..< 3 {
		group.addTask {
      let result = await work(i)
      value += result
			return result
		}
	}
	// 等待所有子任务完成
	await group.waitForAll()
	return value
}
```

将代码通过addTask 添加到任务组时，必须认识到：这些代码有可能以并发方式同时运行。编译器可以检测到这里我们在一个明显的并发上下文中改变了某个共享状态。不加限制地从并发环境中访问某个值是危险操作，可能造成崩溃。得益于结构化并发，现在编译器可以理解任务上下文的区别，在静态检查时就发现这一点，从而从根本上避免了这里的内存风险

即使只读取var value的值，也是不被允许的

* 任务组逃逸

虽然Swift 编译器没有阻止将 withTaskGroup 闭包中的group被外部持有并再作用范围之外使用，但是在闭包外使用的话，将完全破坏结构化并发的假设

**不足**：

a、每次想要使用withTaskGroup时，都需要遵守同样的模板，创建任务组，定义和添加子任务，使用await等待完成等，都是模板代码

b、对于所有子任务，它们的返回值也必须是同样的类型，灵活性下降

使用

**2、异步绑定 (async let)**

除了任务组以外，这是另一种创建结构化并发子任务的方式。为了简化上面结构化并发的使用而诞生

上面 withTaskGroup 的等价写法

```swift
func useAsyncLet() async {
    print("Start")
    async let v0 = work(0)
    async let v1 = work(1)
    async let v2 = work(2)
    print("Task added")

    let result = await v0 + v1 + v2
    print("Task ended")
    print("End.Result:\(result)")
}
```

* 隐式取消

如果没有await，swift 并发会在被绑定的常量离开作用域时，隐式地将绑定的子任务取消掉，然后进行await

#### 结构化并发的组合

通过嵌套使用 withTaskGroup 或者 async let，可以在一般人能够轻易理解的范围内，灵活地构建出这种多层级的并发任务

```swift
// 第一层任务组
await withTaskGroup(of: Int.self) { group in
    group.addTask {
        // 第二层任务组
        await withTaskGroup(of: Int.self) { innerGroup in
            innerGroup.addTask {
                await work(0)
            }
            innerGroup.addTask {
                await work(2)
            }
            return await innerGroup.reduce(0) {
                result, value in
                result + value
            }
        }
    }
    group.addTask {
        await work(1)
    }
}
print("End")
```

#### 非结构化任务

创建任务的方式

* Task.init - 创建非结构化的任务根节点，从当前任务中继承运行环境：比如 actor 隔离域，优先级、本地值(是指：仅存在于当前任务上下文中的，有外界注入的值)

* Task.detached - 创建非结构化的任务根节点，不从当前任务中继承优先级和本地值等运行环境，完全新的游离任务环境

创建任务时，可以得到一个具体的Task值，充当了任务的标识。从Task.init 或者 Task.detached 的闭包中返回的值，将作为整个Task 运行结束后的值

使用Task.value 这个异步只读属性，可以获取到整个Task的返回值

#### 任务取消

在遇到任务取消时，如果想要进行处理并提前结束任务，大致有两类选择：

**1、提前返回空置或者部分值**



**2、通过抛出错误并汇报给父层级任务，让当前任务异常结束**

约定错误和自定义错误

```swift
// 标准库内的一个特殊错误类型
CancellationError
// 在需要插件取消状态并抛出错误时可以直接调用如何方法
Task.checkCancellation()
```

设计并发系统时应该遵守的规范

1、尽可能块地对任务取消作出响应，避免额外的非必要工作

2、并迅速通过抛出来完成任务，将结构化并发的控制权交回给调用者

**3、取消的清理工作**

在结构化并发中，**defer**会等到子任务await全部完成后再调用

在使用defer时，只有在异步操作返回或者抛出时，才会被触发，如果我们使用 checkCancellation 在每次 await 时检查取消的话，实际上抛出错误的时机会比任务被取消的时机要晚一些：在异步函数执行暂停期间的取消，并不会立即导致抛出，只有在下一次调用 checkCancellation 进行检查时，才进行抛出并触发 defer 进行资源清理。

如果遇到如下情况

* 需要在取消发生的时刻，**立即**作出响应
* 在某些情况下，无法通过checkCancellation抛出错误时

可以考虑使用**withTaskCancellationHandler**

#### Actor

对比 Class  类型

| 类型  | 不同点                                                       | 相同点                                                       |
| ----- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Class | 不支持保护内部状态                                           | 拥有初始化方法、普通方法、属性、下标、被扩展并满足协议、支持泛型 |
| Actor | 1、保护其中的内部状态(或者说存储系统)让自身免受数据竞争的困扰，包括对属性的直接访问能允许发生在self里 | 拥有初始化方法、普通方法、属性、下标、被扩展并满足协议、支持泛型 |

从 actor 外部持有对这个actor的引用，并对某个具有 actor 隔离特性的声明的访问，叫做跨actor调用，且这个调用只能在异步方法中可以使用

```swift
actor Room {
    let roomNumber = "101"
    var visitorCount: Int = 0
    
    init() {}
    
    func visit() -> Int {
        visitorCount += 1
        return visitorCount
    }
}
```

虽然 Room.visit 并没有被标记为 async 函数，但是编译期间 Swift 会对 actor Room 进行隔离检查，它会决定哪些调用是跨 actor 隔离域的调用。因为 actor 要保证隔离状态不被意外改变，因此对于这些调用，必须等待到合适的时间才能处理。编译器会应用上面的规则，要求调用方引入潜在暂停点 **await**。

```swift
func bar() async {
    let room = Room()
    let visitCount = await room.visit()
    print(visitCount)
    print(await room.visitorCount)
}
```



隔离域

* 某个隔离局中的声明，可以无缝访问相同隔离域中的其他成员

* 某个隔离域外的声明，不论它位于传统的非隔离中，还是位于其他 actor 的隔离域中，都无法直接访问这个隔离域的成员。只有通过异步消息的方法，才能跨越隔离域进行访问

#### Actor 协议

所有的actor类型都隐式地遵守Actor协议

当需要让actor去遵守非actor协议时，默认会报错

```swift
protocol Popular {
    var popular: Bool { get }
}
```

```swift
extension Room: Popular {
    var popular: Bool {
        return visitorCount > 0
    }
}
```

**Error：**Actor-isolated property 'popular' cannot be used to satisfy nonisolated protocol requirement

Room.pipular 和 Popular.popular 产生了隔离域上的冲突，解决方案有两种：

**1、**让Popular 在某个隔离域中，通过让 PopularActor 作为Actor 协议的细分存在，例如

```swift
protocol PopularActor: Actor {
    var popular: Bool { get }
}
```

```swift
extension Room: PopularActor {
    var popular: Bool {
        return visitorCount > 0
    }
}
```

当Room实现PopularActor时，其中的popularActor也将作为隔离域中的一部分存在，于是 Room 将可以在同一个隔离域中访问到

**2**、定义异步协议方法

将涉及到的成员设计为异步方法或者属性

```swift
protocol PopularAsync {
    var popular: Bool  { get async }
}
```
让 Room 实现 PopularAsync
```swift
extension Room: PopularAsync {
    var popular: Bool {
        get async {
            visitorCount > 0
        }
    }
}
```

使用时

```swift
let room = Room()
await print("is popular?\(room.popular)")
// 或者
print("is popular?\(await room.popular)")
```

如果需要一个既能被class 或者 struct 这样的"传统"类型满足，“又能以安全的方式工作在 actor 里的协议，可以考虑将协议的成员声明为异步成员(例如 PopularAsync 中的popular )

```swift

class RoomClass: PopularAsync {
    var popular: Bool { return false }
}
```

即便在 protocol 中被声明为了 get async，普通类型还是可以用同步函数来实现协议的异步定义

#### nonisolated

想要对 Actor 类型满足一个同步协议，需要明确将协议的要求声明放到隔离域外，才可以，可以使用 **nonisloated**关键字

```swift
extension Room: CustomStringConvertible {
    nonisolated var description: String {
        return "\(roomNumber)"
    }
}
```

当然了，这样子在隔离域外的成员description 是不能同步访问隔离域内的内容的，有一个例外，在同一个模块内，用let声明的存储变量(roomNumber)可以，在不同的模块中，如果想要访问let的变量时，需要加上 await 关键字

#### isolated

* 在 actor 中的声明，默认处于 actor 的隔离域中
* 在 actor 中的声明，如果加上 nonisolated，那么它将被置于隔离域外
* 在 actor 外的声明，默认处于 actor 隔离域外


除此之外，对于actor之外的声明，如果想让它处于某个隔离域中，可以使用**isolated**关键字来修饰

```swift
func reportRoom(room: isolated Room) {
    print("Room:\(room.visitorCount)")
}
```

**切换隔离域**

如果我们在某个 actor 中声明了接受 isolated 参数的方法，即使它只接受一个这种参数，其隔离域依然存在冲突：方法本身在 actor 中，“原则上”应该是按照 self 进行 actor 隔离的，但同时它又被声明了参数隔离，被明确表示需要被隔离在参数的域中。此时，Swift 将选择尊重更明确的表述，也就是使用参数定义的隔离域来运行代码

```swift
extension Room {
  func baz1(_ another: Room) async {
      print(self.visitorCount)
      print(await another.visitorCount)
  }
}
```

```swift
extension Room {
	func baz2(_ another: isolated Room) async {
        print(await visitorCount)
        print(another.visitorCount)
    }
}
```

#### 全局actor

针对需要保护的状态存在于actor外部，或者代码不可能汇集到单一的actor实例中时，需要一种作用域更加宽广的隔离手段

为此，我们可以声明全局actor，通常被作为属性包装使用，可以被任意地添加到某个属性或者方法前，对属性或者方法进行标注，把它限定在该全局actor的隔离域中

**MainActor**就是一个全局actor

#### 自定义全局actor

需要自定义全局的几种情况

* 若干个若干个可以成组的状态：它们散落在各个类型里，但是需要以串行的方式避免写入时的数据竞争

* 存在需要被某个 actor 隔离的全局变量，此时单纯的 actor 类型无法做到将其纳入隔离域
* 需要隔离的状态是跨越模块的：提供隔离域的人希望某些由其他开发者生成的状态被纳入该隔离域以保证执行时的安全。开发者在编译自己的模块时，可以向外部提供一个全局 actor，这样别人就能使用定义在模块内部的隔离域了

#### Sendable

是一个协议，用于表示该类型可以安全地在不同并发域之间传递

**Swift 并发在设计针对跨越并发域的数据安全时，需要处理三件事**

1、对于那些跨越并发域时可能不受保护的可变状态，编译器则应该给出错误，以保证数据安全

2、Swift 的并发设计，是鼓励使用值类型的。但是有些情况下引用类型确实可以带来更优秀的性能。对于 1 中的限制，应该为资深程序员留有余地，让他们可以可以自由设计 API，同时保证数据安全和性能

3、Swift 5.5 之前已经存在大量的代码，如果强制开始 1 的话，可能会造成大量的编译错误。我们需要平滑和渐进式的迁移过程

##### 值类型

* 所有的基本类型都是默认满足sendable
* 使用所有值类型构造的struct也是自动满足 sendable

##### class 类型

* 必须是 final，不允许继承
* 所有成员必须都是 sendable 的
* 所有的成员都必须使用let声明为不变量
* Class 类型就算满足sendable协议，也**需要显式**为它添加上 sendable

##### actor 类型

* 所有的actor类型都满足sendable的要求
* 编译器会自动为其添加 sendable
