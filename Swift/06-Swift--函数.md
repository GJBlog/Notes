# 函数(Functions)

1、函数定义

* 定义一个函数的时候可以定义函数的多个参数和某种类型的返回值
* 函数的实参必须与函数参数列表里参数的顺序一致

2、函数参数与返回值

* 无参数函数

```swift
func sayHelloWorld() -> String {
    return "Hello, World"
}
```

* 多参数函数

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    return "Hello"
}
```

* 无返回值函数

```swift
// 因为该函数是无返回值，所以函数的定义中没有返回箭头和返回类型
func greeting(person: String) {
    print("Hello, \(person)")
}
// 等价写法
func greeting(person: String) -> () {
}
// 等价写法
func greeting(person: String) -> Void {
}
```

* 多重返回值函数

```swift
// 使用元祖类型作为返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    .....
    return (currentMin, currentMax)
}
```

* 可选元祖返回类型

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

* 隐式返回的函数

```swift
// 如果函数的整个函数体是一个单行表达式，函数可以隐式的返回整个表达式
func greeting(for person: String) -> String {
    "Hello" + person + "!"
}
```

3、函数参数标签和参数名称

* 每个函数参数都有一个参数标签(argument label)和参数名称(parameter name)
    * 参数标签：在调用函数的时候使用，在调用时会将函数的参数标签写在对应的参数前面
    * 参数名称：在函数的实现中使用。默认情况下，函数参数使用参数名称作为参数标签
    * 所有参数都必须是唯一的，多个参数可以拥有同样的参数标签，但是一个唯一的参数标签让代码根据可读性
* 指定参数标签

```swift
// argumentLabel：参数标签
// parameterName：参数名称
// 可以通过下划线(_)来忽略参数标签
func someFunction(argumentLabel parameterName: Int, _ age: Int) {

}
```
* 参数默认值(Default Value)

```swift
func someFunction(parameter1: Int, parameter2: Int = 12) {
}
someFunction(parameter1: 3, parameter2: 20)
someFunction(parameter1: 3)
```

* 可变参数

```swift
// 在变量类型名后面添加...来定义可变参数
// 可变参数可以接受0个或多个值
// 可变参数在函数体重变为此类型的数组
// 一个函数最多只能拥有一个可变参数
func arithmeticMean(_ numbers: Double...) {
    for item in numbers {
        print("item的value：\(item)")
    }
}
```

* 输入输出参数(In-Out-Parameters)

```swift
// 定义输入输出参数，在参数前加inout关键字
// 当传入的参数被作为输入输出参数时，需要在参数名前加&符
// 输入输出参数不能有默认值，且可变参数不能被用inout标记
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
```

* 函数类型

```swift
// 函数都有种特定的函数类型,函数类型有函数的参数类型和返回值类型组成
// 函数类型：(Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
// 函数类型：() -> Void
func printHelloWorld() {
    print("hello, world")
}
```

* 嵌套函数

```swift
// 把函数定义在别的函数体中，称为嵌套函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    return backward ? stepBackward :stepForward
}
```


4、注意点

* 函数返回值可以被忽略，但是定了有返回值的函数必须返回一个值，不然在编译期间报错
* 元祖类型的成员不需要在元祖从函数中返回时命名，因为元祖名称已经在函数返回类型中指定

