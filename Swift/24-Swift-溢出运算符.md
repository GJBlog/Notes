## 运算符(Operator)

### 溢出运算符(Overflow Operator)
* 算数运算符出现溢出时会抛出运行时错误
* 使用溢出运算符(&+、&-、&*)来支持溢出运算

```
// UInt8的范围：0~255
var min = UInt8.min	// 0
print(min &- 1)			// 255
```

### 运算符重载(Opeartor Overload)

```swift
struct Point {
    var x = 0, y = 0
    // 重载+(二元)
    static func + (p1: Self, p2: Self) -> Self {
        Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
    // 重载-(二元)
    static func - (p1: Point, p2: Point) -> Point {
        Point(x: p1.x - p2.x, y: p1.y - p2.y)
    }
    // 重载-(一元)
    static prefix func - (p1: Point) -> Point {
        Point(x: -p1.x, y: -p1.y)
    }
    static func += (p1: inout Point, p2: Point) {
        p1 = p1 + p2
    }
    static prefix func ++ (p: inout Point) ->Point {
        p += Point(x: 1, y: 1)
        return p
    }
    static postfix func ++ (p: inout Point) -> Point {
        let tmp = p
        p += Point(x: 1, y: 1)
        return tmp
    }
}
```



