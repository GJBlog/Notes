# 枚举(Enumeration)

## 1、定义

* 为一组相关的值定义了一个共同的类型
* 不必给每个枚举成员提供一个值，如果要给枚举成员提供一个值(原始值)，则该值的类型可以是字符串、字符、整型值或浮点数
* 枚举成员可以指定任意类型的关联值存储到枚举成员中，类似于C中的联合体(unions)，可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值

## 2、枚举语法

### 定义枚举类型

```swift
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 多个成员值可以出现在同一行上，用逗号隔开
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 使用Switch语句匹配枚举值
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

```

### 枚举成员的遍历

* 令枚举遵循```CaseIterable```协议，使用协议中的```allCases```属性，用于表示一个包含枚举所有成员的集合

```swift
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases {
    print(beverage)
}
```

### 关联值

* 可以为枚举成员设置一个常量或者变量，并在赋值之后查看这个值。把其他类型的值和成员值一起存储起来会很有用。这额外信息称为关联值，每次在代码中使用该枚举成员时可以修改该关联值
* 可以定义Swift枚举来存储任意类型的关联值，并且每个成员的关联值类型都可以不相同
* 如果一个枚举成员的所有关联值都被提取为常量或变量，可以统一只在成员名称前标注一个```let```或```var```

```swift
// 定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 upc，另一个成员值是具有 String 类型关联值的 qrCode
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 使用关联值
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// 统一定义关联值为常量或变量
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
```

### 原始值

* 作为关联值的替代选择，枚举成员可以被默认值(称为原始值)预填充,且原始值的类型必须相同
* 原始值可以是字符串、字符、或者任意整型值或浮点值，每个原始值在枚举声明中必须是唯一的
* 在使用原始值为整数、字符串类型的枚举时，不需要显式为每一个枚举成员设置原始值，Siwft会自动赋值
* 如果使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为0
* 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
* 如果定义了原始值类型，那么会自动获得```枚举类型(rawValue: XX)```初始化方法,``XX``为原始值类型的参数，返回值是枚举成员或者nil，即返回可选类型

```swift
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// 原始值为整数类型
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 原始值为字符串
enum CompassPoint: String {
    case north, south, east, west
}
// 使用rawValue访问原始值
let earthsOrder = Planet.earth.rawValue
// 通过原始值初始化枚举实例
let possiblePlanet = Planet(rawValue: 7)
```

### 递归枚举

* 也是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值
* 使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归

```swift
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 打印“18”
```

## 3、注意点

* Swift的枚举成员在被创建时不会被赋予一个默认的整型值
* 当枚举变量的类型被已知时，再次为其赋值可以省略枚举类型名
* 原始值是在定义枚举时被预填充的值，对于一个特定的枚举成员，它的原始值始终不变
* 关联值是创建一个基于枚举成员的常量或者变量时才设置的值，枚举成员的关联值是可以变化
* 原始值构造器是一个可失败构造器，因为并不是每一个原始值都有与之对应的枚举成员

