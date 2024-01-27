## 协议(Protocol)

### 特点

规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西
**类**、**结构体**、**枚举**都可以遵守协议，实现协议的具体内容

### 语法

```swift
// 定义一个协议
protocol 协议名称 {
    // 协议的定义内容
}
// 某个类遵守协议
class SomeClassA: SomeSuperClass(父类), 协议名称1, 协议名称2 {
    // 协议的定义内容
}
// 某个结构体遵守协议
struct SomeStructA: 协议名称1, 协议名称2 {
    // 协议的定义内容
}
// 某个枚举遵守协议
enum SomeEnumA: 协议名称1, 协议名称2 {
    // 协议的定义内容
}
```

#### 属性

> 1、可以要求遵循协议的类型提供特定名称、类型的实例属性或者类型属性
> 2、协议不指定该属性是存储属性还是计算属性，只指定属性名称、类型、是可读还是可读可写
>
> 3、协议中定义属性时类型必须是`var`
>
> 4、如果协议要求属性是可读可写，那么属性不能是常量属性或者只读的计算属性
> 5、如果协议只要求属性是可读，那么属性不仅是可读还可以是可写的
>
> 6、实现协议时的属性权限要不小于协议中定义的属性权限

在协议中定义类型属性时，总是使用**static**关键字为前缀，当然，类类型遵守协议时，既可以使用**static**，也可以使用**class**作为前缀

```swift
protocol SomeProtocol {
    var a: Int { get set }
    var b: Int { get }
}
```

#### static、class

> 为了保证通用，协议中必须使用`static`定义类型方法、类型属性、类型下标

#### mutating

> 1、只有将协议中的实例方法标记为`mutating`才允许在结构体、枚举的具体实现中修改自身内存
>
> 2、类在实现方法中不需要添加`mutating`，枚举、结构体中才需要添加`mutating`

#### init

> 协议中定义初始化器`init`，如果是非`final`类实现时必须加上`requeired`
>
> 如果从协议实现的初始化器，更好是重写了父类的指定初始化器，那么这个初始化器必须同时加上`required`、`override`
>
> 协议中定义的`init?` `init!`，可以使用`init`、`init?`、`init!`去实现
>
> 协议中定义的init，可以使用`init`、`init!`去实现

```swift
protocol Drawable{
	init(x: Int, y: Int)
}
class Point: Drawable {
  required init(x: Int, y: Int) {}
}
final class Size: Drawable {
	init(x: Int, y: Int) {}
}
```

```swift
protocol Livable {
    init(age: Int)
}

class Person {
    init(age: Int) {}
}

class Student: Person, Livable {
    required override init(age: Int) {
        super.init(age: age)
    }
}
```

```swift
protocol Livabel {
  init()
  init?(age: Int)
  init!(no: Int)
}
class Person {
  required init() {
    // required init!() {}
  }
  required init?(age: Int) {
    // required init!(age: Int) {}
    // required init(age: Int) {}
  }
  required init!(no: Int) {}
	  // required init?(no: Int) {}
  	// required init(no: Int) {}
}
```

#### 协议继承

> 协议可以继承一个或多个协议
>
> 多个被继承的协议间用逗号分隔

```swift
protocol Runnable {}

protocol Livable: Runnable {}
```

#### 协议组合

> 协议组合中最多接受1个类类型

```swift
protocol Runnable {}
protocol Livable {}
class Person {}

func fn1(obj: Livable & Runnable) {}
func fn2(obj: Person & Livable & Runnable) {}
```

#### 只能被Class遵守的协议方式

```swift
protocol Runnable: AnyObject {}
protocol Runnable: class {}
// 被@objc修饰的协议还可以暴露给OC去遵守实现
@objc protocol Runnable {}
```

