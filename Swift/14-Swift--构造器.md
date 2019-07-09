# 构造器(Initialization)

## 1、特点

* 适用于使用类、结构体、枚举类型的实例之前的准备过程
* 必须为所有存储型属性赋初值
* 为存储型属性分配默认值或者在构造器中为设置初始值时，它们的值是被直接设置的，不会触发任何属性观察者

## 2、构造器

* 构造器在创建某个特定类型的新实例时被调用
* 可以在构造器中为存储型属性设置初始值，也可以在属性声明时设置默认值

```swift
init(paramater) {
   // 
}
```
## 3、自定义构造过程

* 可以通过输入形参和可选属性类型来自定义构造过程，也可以在构造过程中分配常量属性
* 在调用构造器时，主要通过构造器中形参命名和类型来确定应该被调用的构造器
* 如果在定义构造器时没有提供实参标签，Swift 会为构造器的每个形参自动生成一个实参标签
* 如果不希望构造器的某个形参使用参数标签，可以使用下划线(_)来替代显式的实参标签
* 如果自定义的类型有一个逻辑是允许值为空的存储型属性，需要将其声明为可选类型，可选类型的属性将自动初始化为nil
* 对于常量属性而言，只要在构造过程结束时它设置成确定的值，一旦被赋值，将不可修改

```swift
 init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
```

## 4、默认构造器(Default Initializers)

* 当结构体、类的所有属性都有默认值，同时没有提供任何自定义构造器，Swift会自动为类、结构体提供一个默认构造器，默认构造器会简单创建一个所有属性都是设置为默认值的实例
* 特别的，对于结构体而言，如果本身没有提供自定义构造器，还会**自动获得一个逐一成员构造器**，即使结构体中存储型属性没有默认值
* 当调用逐一成员构造器时，可以省略任何一个有默认值的属性，对于被省略的属性，构造器会使用默认值

```swift
struct Size {
    var width = 0.0, height = 0.0
}
let zeroByTwo = Size(height: 2.0)
let twoByTwo = Size(width: 2.0, height: 2.0)
```

## 5、值类型构造器代理(Initializer Delegation for Value Types)

* 构造器通过调用其他构造器来完成实例的部分构造过程，被称为构造器代理。
* 在值类型中，你可以使用self.init在自定义的构造器中引用相同类型的其他构造器，并且，只能在构造器内部调用self.init
* 一旦为值类型定义了一个自定义的构造器，则无法访问到默认构造器(如果是结构体，还将无法访问到逐一成员构造器)

```swift
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
```

## 6、类的继承与构造

* 类中的所有存储型属性包括所有继承自父类的属性都必须在构造过程中完成设置初始值
* 分类：
    * 指定构造器(最主要)，通常一个类有一个指定构造器，每一个类必须至少拥有一个指定的构造器
    
    ```swift
    init(paramaters) {
        //...
    }
    ```
    
    * 便利构造器(次要的、辅助型的)，可以定义便利构造器来调用同一个类中的指定构造器，只有在必要的时候才为类提供遍历构造器
    
    ```swift
    convenivence init(paramaters) {
        //...
    }
    ```
    
#### 类构造器调用(代理)规则

* 指定构造器必须调用其直接父类的指定构造器
* 便利构造器必须调用同类中定义的其他构造器(默认构造器、指定构造器、便利构造器)
* 便利构造器最后必须要调用指定构造器

简称：指定构造器总是向上代理，便利构造器总是横向代理

#### 类的构造过程

##### 构造的两个阶段

* 1、类中的每个存储型属性赋一个初始值，只要每个存储型属性的初始值被赋值后，就进入第二阶段
* 2、给每个类一次机会，在新实例使用前进一步自定义他们的存储型属性

##### 类的构造过程中编译器检查

* 1、必须让当前类中所有存储型属性都初始化完成，才能调用父类的构造器

* 2、如果存在继承的属性，则当前类的指定构造器必须先调用父类的构造器，然后再为继承的属性设置新值，不然新值会被父类的构造器覆盖

* 3、便利构造器必须先调用其它构造器，然后再设置任意属性，不然便利构造器赋予的新值将被该类的指定构造器所覆盖

* 4、构造器在给所有存储性属性赋初始值之前，不能调用任何实例方法、不能读取任何实例属性的值、不能引用self作为一个值

#### 构造器的继承与重写

* 在子类中，要重写父类的指定构造器时，必须在定义子类构造器时添加```override```修饰符，即使重写的是系统自动提供的默认构造器，也需要添加该修饰符
* 如果在子类中实现一个和父类便利构造器相匹配的子类构造器时，因为子类不能直接调用父类的便利构造器，所以严格意义上来讲，你的子类并未对一个父类构造器提供重写,子类中“重写”一个父类便利构造器时不需要添加```override```修饰符

#### 构造器的自动继承

* 默认情况下，子类不会继承父类的构造器，但是在如下特定情况中父类的构造器是可以被子类自动继承的，前提是已经为子类中引入的所有新属性都提供了默认值

    * 规则1：如果子类中没有定义任何指定构造器，它会自动继承父类所有的指定构造器

    * 规则2：如果子类中提供了所有父类指定构造器的实现，不管是通过规则1继承的还是自定义的实现，它都将自动继承父类所有的便利构造器

## 7、可失败构造器

* 如果一个类、结构体、枚举的对象，在构造的过程中有可能失败，则可以为其定义一个可失败构造器
* 可以添加一个或多个可失败构造器
* 该构造器会创建一个自身类型的可选类型的对象，通过return nil 来表明可失败构造器在何种情况下表示失败
* 可失败构造器也可以调用其他的非可失败构造器
* 可失败构造器会**创建**一个类型为自身类型的可选类型的对象

```swift
// 结构体
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
// someCreature 的类型是 Animal? 而不是 Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

// 枚举
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
```

##### 构造失败的传递

* 类、结构体、枚举的可失败构造器可以横向调用到它们自己其他的可失败构造器
* 类的可失败构造器也能向上调用父类的可失败构造器
* 无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，整个构造过程将立即终止，接下来的任何构造代码不会再被执行

```swift
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
```

##### 重写可失败构造器

* 可以在子类中重写父类的可失败构造器，或者在子类中的非可失败构造器重写父类的可失败构造器
* 当使用子类的非可失败构造器重写父类的可失败构造器时，向上调用父类的可失败构造器的唯一方式是对父类的可失败构造器的返回值做强制解包

```swift
class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
    
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
```

##### init!可失败构造器

* 该可失败构造器会构建一个对应类型的隐式解包可选类型的对象
* 可以在init?中调用init!,或者init!中调用init?,或者重写也可以，或者init调用init!
* init!仅仅只是在init?获得

```swift
init?中可以调用\重写init!
init!中可以调用\重写init?
init调用init!,一旦init!失败，会触发一个断言
```

## 8、必要构造器

* 表示该类的所有子类都必须实现该构造器
* 子类重写父类的必要构造器时，必须在子类的构造器前添加required修饰符，表示该构造器要求也应用与集成链后面的子类，此时不需要添加override
* 如果子类继承的构造器能满足必要构造器的要求，则无需在子类中显式提供必要构造器的实现

```swift
class SomeClass {
    required init() {
        //构造器的实现代码
    }
}

class SomeSubClass: SomeClass {
    required init() {
        //构造器的实现代码
    }
}
```

## 注意

* 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改，在子类中不能修改
* 如果希望默认构造器、逐一成员构造器以及自己自定义的构造器都能用来创建实例，可以将自定义的构造器写到扩展(extension)中，而不是写在值类型的原始定义中
* 当重写一个父类的指定构造器，即使是为了子类中实现便利构造器，也总是需要添加```override```修饰符
* 如果子类的构造器没有在阶段 2 过程中做自定义操作，并且父类有一个无参数的自定义构造器。你可以在所有父类的存储属性赋值之后省略 super.init() 的调用
* 如果子类将父类的指定构造器实现为便利构造器，也是满足规则2的
* 可失败构造器的参数名和参数类型不能与非可失败构造器的参数名、参数类型相同



