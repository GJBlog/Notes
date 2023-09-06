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





