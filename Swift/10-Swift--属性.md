# 属性

## 1、存储属性

* 就是存储在特定类或结构体实例里的一个常量或变量

* 延时加载存储属性：是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延时加载存储属性


```swift
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```
* 在创建类或者结构体的实例时，必须为所有的存储属性设置一个合适的初始值
  * 可以在初始化器里为存储属性设置一个初始值
  * 可以分配一个默认的属性值作为属性定义的一部分

## 2、计算属性

* 可以在类、结构体和枚举中定义
* 不直接存储值，而是提供一个```getter```和一个可选的```setter```，来简接获取和设置其他属性或者变量的值
* 如果计算属性的setter没有定义表示新值的参数名，则可以使用默认名称newValue
* 如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果
* 只有 getter 没有 setter 的计算属性叫只读计算属性
* 对于只读计算属性而言，在声明时可以省略掉get关键字和花括号

```swift
var center: Point {
    // 默认Getter方法
    get {
        let centerX = origin.x + (size.width * 0.5)
        let centerY = origin.y + (size.height * 0.5)
        return Point(x: centerX, y: centerY)
    }
    // 默认Setter方法
    set(newCenter) {
        origin.x = newCenter.x - size.width * 0.5
        origin.y = newCenter.y - size.height * 0.5
    }
}

var center: Point {
    // 简化Getter方法
    get {
        let centerX = origin.x + (size.width * 0.5)
        let centerY = origin.y + (size.height * 0.5)
        return Point(x: centerX, y: centerY)
    }
    // 简化Setter方法
    set {
        origin.x = newCenter.x - size.width * 0.5
        origin.y = newCenter.y - size.height * 0.5
    }
}
```

## 3、属性观察器

* 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外
* 可以为非Lazy的var存储属性设置属性观察器
* 可以在子类中通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器
* 不必为非重写的计算属性添加属性观察器，因为可以直接通过它的 setter 监控和响应值的变化
* 属性观察器种类
    * willSet 在新的值被设置之前调用，会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示
    * didSet 在新的值被设置之后调用，会将旧的属性值作为参数传入，可以为该参数指定一个名称或者使用默认参数名 oldValue。如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
```

## 4、全局变量和局部变量

* 全局变量是在函数、方法、闭包或任何类型之外定义的变量
* 局部变量是在函数、方法或闭包内部定义的变量
* 在全局或局部范围内都可以定义计算型变量、为存储型变量定义观察器
* 全局的常量或者变量都是延迟计算的，而且全局的常量或变量不需要标记 lazy 修饰符
* 同样可以应用属性观察器和计算属性的功功能

## 5、类型属性

* 为类型本省定义属性，无论创建多少个类型的实例，这些属性都是只有唯一一份
* 类型属性用于定义某个类型所有实例共享的数据
* 存储型类型属性可以是常量或变量
* 计算型类型属性跟实例的计算型属性一样只能定义成变量属性
* 使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父类的实现进行重写
* 类型属性是通过类型本身来访问
* 类型属性必须设定初始值，默认是lazy，会在第一次使用的时候才初始化

```swift
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
```

## 6、inout

* 本质：就是引用传递(地址传递)
* 如果实参有物理内存地址，且没有设置属性观察期，那么会直接将实参的内存地址传入函数(实参进行引用传递)
* 如果实参是计算属性或者设置了属性观察器，采取了Copy In Copy out的做法
  * 调用该函数时，先复制实参的值，产生副本[get]
  * 将副本的内存地址传入函数(副本进行引用传递)，在函数内部可以修改副本的值
  * 函数返回后，再将副本的值覆盖实参的值[set]

## 7、注意点

* 存储属性只能用于类和结构体
* 对于值类型，当值类型的实例被声明为常量时，它的所有属性也就成了常量
* 对于引用类型，当引用类型的实例被声明为常量时，依然可以修改该实例的可变属性
* 必须将延时加载属性声明成变量，因为属性的初始值可能在实例构造完成后才能得到，常量属性无法声明成延时加载
* 延时加载主要用于当属性的值依赖一些外部因素且这些外部因素只有在构造过程结束之后才会知道的时候，或者当获得属性的值因为需要复杂或者大量的计算，而需要采用需要的时候再计算的方式
* 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次
* 属性没有对应的实例变量
* 必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的
* 在父类初始化方法调用之后，在子类构造器中给父类的属性赋值时，会调用父类属性的 willSet 和 didSet 观察器。而在父类初始化方法调用之前，给子类的属性赋值时不会调用子类属性的观察器
* 跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值
* 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符
* 枚举类型中可以定义类型属性(存储类型属性、计算类型属性)


