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

##### 当前任务状态

1、使用 withUnsafeCurrentTask：获取和检查当前任务，前提：在任意的异步函数中

##### 任务层级-在任务树上创建叶子节点

有两个方法

**1、任务组(task group)**

在某个异步函数中，通过withTaskGroup为当前任务添加一组结构化的并发子任务



**2、异步绑定 (async let)**



