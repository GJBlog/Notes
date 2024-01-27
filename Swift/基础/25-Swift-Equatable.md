## 可相等协议(Equatable)、可比较协议(Comparable)、自定义运算符(Custom Operator)

### Equatable

> 要得知两个实例是否等价，一般做法是遵守Equatable协议，重载 == 运算符
>
> 与此同时，等价于重载了 != 运算符

```swift
struct Point: Equatable {
    var x = 0, y = 0
}
```

* Swift为以下类型提供默认的 Equatable 实现
  * 没有关联类型的枚举
  * 只拥有遵守 Equatable 协议关联类型的枚举
  * 只拥有遵守 Equatable 协议存储属性的结构体

### Comparable

> 要想比较2个实例的大小，一般方式：
>
> * 遵守Comparable协议
> * 重载相应运算符

### 自定义运算符(Custom Opertaor)

> 可以自定义新的运算符：在全局作用域使用operator进行声明

```swift
precedencegroup GJPlusMinusPrecedence {
    // 结合性
    associativity: left
    // 比谁优先级高
    higherThan: AdditionPrecedence
    // 比谁优先级低
    lowerThan: MultiplicationPrecedence
    // 在可选链操作中有用跟XX一样的优先级
    assignment: true
}

infix operator +-: GJPlusMinusPrecedence

struct Point {
    var x = 0, y = 0
    static func +- (p1: Point, p2: Point) -> Point {
        return Point(x: p1.x + p2.x, y: p1.y - p2.y)
    }
}
```





