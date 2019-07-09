# 扩展(Extensions)

## 1、特点

* 适用于现有的类、结构体、枚举、协议，为其添加新功能
* 不需要访问被扩展类型源代码就可以完成扩展的能力
* 扩展是没有名字的

## 2、扩展语法

* 使用```extension```关键字声明
* 扩充现有类型，添加一个或多个协议。具体协议名称的写法跟类和结构体一样
* 可以使用在现有范型类型上
* 可以使用扩展给泛型类型有条件的添加功能

```swift
extension SomeType {
  // 在这里给 SomeType 添加新的功能
}
extension SomeType: SomeProtocol, AnotherProtocol {
    // 扩展新功能
}
```

## 3、计算型属性

* 扩展可以给现有类型添加计算型实例属性和计算型类属性

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
```

## 4、构造器

* 可以给现有的类型添加新的构造器，可以把自定义类型作为参数来供其他类型的构造器使用或者在类型的原始实现上添加额外的构造选项
* 可以给一个类添加新的便利构造器，但是它们不能给类添加新的指定构造器或者析构器。指定构造器和析构器必须始终由类的原始实现提供
* 如果使用扩展给一个值类型添加构造器只是用于给所有存储属性提供默认值，并且没有定义任何自定义构造器，那么可以在该值类型扩展的构造器中使用默认构造器和成员构造器
* 如果把构造器写到了值类型的原始实现中，那就不属于在扩展中添加构造器
* 如果你使用扩展给另一个模块中定义的结构体添加构造器，那么新的构造器直到定义模块中使用一个构造器之前，不能访问 self

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
```

## 5、方法

* 可以给现有类型添加新的实例方法和类方法
* 添加的实例方法同样也可以修改（或 mutating（改变））实例本身

```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
     mutating func square() {
        self = self * self
    }
}
```

## 6、下标

## 7、嵌套类型

* 可以给现有的类，结构体，还有枚举添加新的嵌套类型

```swift

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
```

## 8、注意点

* 扩展可以给一个类型添加新的功能，但是不能重写已经存在的功能
* 对于一个现有类型，如果定义了一个扩展来添加新功能，那么这个类型的所有实例都可以使用这个新功能，包括那些在扩展定义之前就存在的实例
* 扩展可以添加新的计算属性，但是它们不能添加存储属性，或向现有的属性添加属性观察者
* 如果通过扩展提供一个新的构造器，那么有责任确保每个通过该构造器创建的实例都是初始化完整的



