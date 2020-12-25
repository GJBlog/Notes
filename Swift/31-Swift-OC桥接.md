## Swift与OC桥接

#### 在Swift中调用OC的类、方法

* 通过*Swift-iOS工程-Bridging-Header*文件，将OC中文件暴露给Swift中使用即可

#### 在OC中调用Swift的类、方法

* 需要暴露给OC的类最终都要继承自*NSObject*
* 通过Xcode默认生成好的文件,*{targetName-Swift.h}*，在OC中需要使用的地方直接引入即可
* 使用*@objc*修饰需要暴露给OC的成员，在暴露的同时还可以修改暴露出去的符号名
* 使用*@objcMembers*修饰类
  * 代表默认所有成员都会暴露给OC(包括扩展中定义的成员)
  * 最终是否成功暴露，还需要考虑成员自身的访问级别

```swift
@objc(newName)
@objcMembers class Car: NSObject {
  var price: Double
  @objc(name)
  var band: String
  @objc(drive)
  func run() {}
}
```

#### 在 Swift 中调用OC中定义的C语言方法

* 默认可以直接调用
* 如果遇到方法名称与Swift中冲突，则可以使用@_silgen_name(XXX)为C语言函数重命名

```swift
// sum：表示C语言的函数名称
// swift_sum(_ v1: Int32, _ v2: Int32) -> Int32：表示C语言函数签名
@_silgen_name("sum")
func swift_sum(_ v1: Int32, _ v2: Int32) -> Int32
```

### dynamic

* 被@objc dynamic修饰的内容会具有动态性，调用方法会走runtime的流程

```swift
class Dog: NSObject {
  @objc dynamic func test1() {}
  func test2() {}
}
var d = Dog()
//runtime流程
d.test1()
//Swift虚表流程
d.test2()
```

* 在Swift中涉及到KVC、KVO时，需要属性所属的类、监听器最终继承自NSObject，并且用*@objc dynamic*修饰对应的属性

```swift
class Person: NSObject {
   @objc dynamic var age: Int = 0
}
```

