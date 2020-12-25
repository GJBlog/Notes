## 内存管理

> 跟OC一样，都是采用引用计数的ARC内存管理方案(针对堆空间)

#### Swift的ARC三种引用

* 强引用(Strong reference)：默认情况下，引用都是强引用
* 弱引用(weak reference)：通过weak定义弱引用
  * 必须是可选类型的var，因为实例销毁后，ARC会自动将弱引用置为nil
  * ARC自动给弱引用设置nil时，不会触发属性观察器
* 无主引用(unowned reference)：
  * 不会产生强引用，实例销毁后仍然存储着实例的内存地址(类似OC中的unsafe_unretained)
  * 试图在实例销毁后访问无主引用，会产生运行时错误(野指针)
    * fatal error:Attemp。。。。

### 循环引用(Reference Cycle)

* Weak、unowned都能解决循环引用的问题，unowed要比weak少一些性能消耗

  * 在生命周期中可能会变为nil的使用weak

  * 初始化赋值后再也不会变为nil的使用owned

    

### 闭包的循环引用

* 闭包表达式默认会对用到的外层对象产生额外的强引用(对外层对象进行retain操作)

* 如果想在定义闭包属性的同时引用self，这个闭包必须是lazy的(因为在实例初始化完毕之后才能引用self)

  * 左边的闭包fn内部如果用到了实例成员(属性、方法)
  * 编译器会强制要求明确写出self

  ```swift
  class Person {
    lazy var fn: (() -> ())? = {
      self.run()
    }
    func run() { print("run") }
  	deinit { print("deinit") }
  }
  ```

  

* 如果lazy属性是闭包调用的结果，那么不哈用考虑循环引用的问题(因为闭包调用后，闭包的生命周期就结束了)

 ```swift
class Person {
  var age: Int = 0
  lazy var getAge: Int = {
    self.age或者age
  }()
  deinit { print("deinit")  }
}
 ```

### @escaping

* 非逃逸闭包、逃逸闭包，一般都是当做参数传递给函数
* 非逃逸闭包：闭包调用发生在函数结束前，闭包调用在函数作用域内
* 逃逸闭包：闭包有可能在函数结束后调用，闭包调用逃离了函数的作用域，需要通过@escaping声明

* 逃逸闭包不可以捕获inout参数

### 内存访问冲突

* 满足如下条件，说明重叠访问结构体的属性是安全的
  * 只访问实例存储属性，不是计算属性或者类属性
  * 结构体是局部变量，而非全局变量
  * 结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获

### 指针

#### swift中也有专门的指针类型，都被定义为Unsafe，常见的有以下4种类型

* 第一种

  ```swift
UnsafePointer<Pointee> 类似于 const Pointee *
  ```

* 第二种

```swift
UnsafeMutablePointer<Pointee> 类似于 Pointee *
```

* 第三种

```swift
UnsafeRawPointer 类似于 const void *
```

* 第四种

```swift
UnsafeMutableRawPointer 类似于 void *
```

#### 获取指向某个变量的指针

```swift
var age = 10
let ptr1 = withUnsafePointer(to: &age) { $0 }
let ptr2 = withUnsafeMutablePointer(to: &age) { $0 }
```

### 获取指向堆空间实例的指针

```swift
class Person {}
var person = Person()
var ptr = withUnsafePointer(to: &person) { UnsafeRawPointer($0) }
var heapPtr = UnsafeRawPointer(bitPattern: ptr.load(as: Uint.self))
print(heapPtr!)
```

#### 创建指针

#### 指针之间的转换

```swift
// 从RawPointer -> 泛型Pointer
let ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
let newPtr = ptr.assumingMemoryBound(to: Int.self)
```

```swift
// 强制转换
// unsafeBitCast是忽略数据类型的强制转换，不会因为数据类型的变化而改变原来的内存数据(类似于c++ reinterpret_cast)
let ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
print(unsafeBitCast(ptr, to: UnsafePointer<Int>.self).pointee)
```

```swift
class Person {}
let person = Person()

// 获取一个对象的堆空间地址(第一种方法)
let ptr = unsafeBitCast(person, to: UnsafeRawPointer.self)
// 获取一个对象的堆空间地址(第二种方法)
let address = unsafeBitCast(person, to: UInt.self)
let ptr = UnsafeRawPointer(bitPattern: address)
```





