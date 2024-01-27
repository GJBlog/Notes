# 一、常量与变量

1、使用之前必须声明

```swift
let constant = "常量"
var variable = "变量"
```

2、一行声明多个变量和多个变量赋值

```swift
var red, green, blue: Double
var x = 0.0, y = 0.0, z = 0.0
```

3、变量、常量名的命名

* 不能以数字开头
* 如果非要使用Swfit关键字，则需要关键字前后添加反引号(`)
* 如果在使用printf打印输出时不想换行，可以设置terminator参数为""

```swift
let (`let`) = "let关键字"
print("输出", terminator:"")
print("是是是\(XXX)")
```

4、swift注释

* swift中的多行注释可以允许嵌套注释

```swift
/*XXXXXXXXX
XXXXXXXXXXX
/*XXXXXXXXX
*/
XXXXXXXXXXX
*/
```

# 二、整形、浮点型

1、浮点型：Double、Float(优先使用Double)

```swift
Double：精确度至少15位数字
Float ：精确度最多只有6位数字
```

2、整形字面量

* 一个10进制，没有前缀
* 一个2进制，0b为前缀
* 一个8进制，0o为前缀
* 一个16进制，0x为前缀

```swift
let decimalInter        = 17
let binaryInteger       = 0b10001
let octalInteger        = 0c21
let hexadecimalInteger  = 0x11
```

3、整型范围

```swift
Int8    ：-128 ~ 127
UInt8   : 0 ~ 255
```

4、类型别名(Type Aliases)

```swift
typealias AudioSample(新类型名称) = UInt16(源类型名称)
```

5、元祖(Tuple)

* 元祖内部可以是任意类型的值
* 元祖内访问元素下标从0开始
* 定义元祖时，给元祖内部元素命名
* 元祖不适合创建复杂的数据结构，它在临时组织值时非常有用

```swift
//创建元祖
let http404Error = (404, "Not Found")
let http404Error = (statusCode:200, description: "OK")
//分解元祖
let (statusCode, statusMessage) = http404Error
//忽略元祖一部分
let (statusCode, _) = http404Error
//通过下标来访问元祖元素
print("this is \(http404Error.0)")
//通过名字来访问元祖元素
print(http404Error.statusCode)
```

6、可选类型(Optionals)

* 可选常量或者变量如果没有赋值，它们会自动被置为nil
* 表示一个确定的值，用来表示值缺失，任何类型的可选状态都可以被置为nil
* 通过添加!来强制解包
* 在一个if语句中，可以包含多个可选绑定或者多个布尔条件，每一个之间使用,隔开，只要有任意一个可选绑定的值为nil或者任意一个布尔值为false,则整个if条件判断为false,也可以使用嵌套if语句来处理
* nil不能用于非可选的常量和变量,如果代码中有常量和变量需要处理值缺失的情况，请使用可选类型
* ```OC```中,```nil```是一个指向不存在对象的指针，```swift```中，```nil```不是指针，表示一个确定的值，表示值缺失

```swift
// 1、声明一个可选类型变量，该变量会被自动设置为nil
var surveyAnswer: String?

// 2、声明一个可选类型变量，该变量被设置为GJ
var name: String? = "GJ"
print("my name is \(name!)")

// 3、可选绑定
if let constantName = someOptional {
    statements
}

// 4、同时可选绑定多个值
if let firstNumber = Int("400"), let secondNumber = Int("43"), firstNumber < secondNumber && secondNumber < 100 {
    print("陈工")
}else{
    print("失败")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("成功")
        }
    }
}
```
7、隐式解析可选类型(implicitly unwrapped optionals)

* 如果某个变量在第一个被赋值之后，可以确定一个可选类型总会有值，这种类型的可选状态被定义为隐式解析可选类型。在可选的类型的后面问号(?)改为感叹号(!)即可。
* 主要使用在```Swift```的类的构造过程中

```swift
// 声明一个隐式可选类型
let
```

7、错误处理(error handing)

* 通过使用错误处理来处理中程序可能出现的错误
* 一个函数通过在声明时添加throws关键字来抛出错误，同时在调用可能出现错误的函数时，将try关键字放置前

```swift
func canThrowAnError() throws {
    
}
do {
    try canThrowAnError()
    //没有错误信息抛出
} catch {
    有一个错误信息抛出
}
```

* do语句将错误能被传播到更多个catch从句中

```swift
func makeASandwich() throws {
    //…………
}
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outofCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
```

8、断言(Assertions)和先决条件(Preconditions)

* 断言只是在Debug环境中运行检查，先决条件则在Debug和Release环境中运行检查
* 如果编译在unchecked mode(-Ounchecked),先决条件不会被检查,断言和先决条件都是```true```
* 当一个条件可能为假，但是继续执行代码要求条件必须为真的时候，需要使用先决条件。例如使用先决条件来检查是否下标越界，或者来检查是否将一个正确的参数传给函数。
* 如果你使用 unchecked 模式（-Ounchecked）编译代码，先决条件将不会进行检查。编译器假设所有的先决条件总是为 true（真），他将优化你的代码。

```swift
let age = -3
//断言(因为-3不>=0,所以断言失败)
assert(age >= 0, "A person's age can't be less than zero")

//不带信息的断言
assert(age>= 0)

//如果代码已经检查了条件，则使用
assertionFailure(_:file:line:)

//先决条件
precondition(index > 0, "Index must be greater than zero")
//表示先决条件发生失败
preconditionFailure(_:file:line:)
```

9、致命失败(fatalError)

* 即使编译处于unchecked mode(-Ounchecked)时，fatalError仍然会被执行
* 在开发早期，只有方法声明，没有实现,可以使用fatalError(_:file:line:)
* 使用fatalError("Unimplemented")函数作为具体实现，不会被断言和先决条件那样被优化掉，可以确保代码执行到没有实现的方法时，程序会被中断

```swift
//致命失败(fatalError)
fatalError(_:file:line:)
```

