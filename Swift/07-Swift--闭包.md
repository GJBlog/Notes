# 闭包(Closure)

## 1、定义

* 是自包含的函数代码块，在代码中可以被传递和使用
* 一个函数和它所捕获的变量\常量环境组合起来，称为闭包
* 闭包可以捕获和存储其所在上下文中任意常量和变量的引用，被称为包裹常量和变量
* 闭包有如下三种形式
    * 全局函数是一个有名字但不会捕获任何值的闭包
    * 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    * 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
* 闭包的语法优化
    * 利用上下文推断参数和返回值类型
    * 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
    * 参数名称缩写
    * 尾随闭包语法

## 2、闭包表达式

* 参数可以是```in-out```参数，但不能设定默认值
* 参数可以是可变参数、元祖
* 闭包的函数体部分由关键字```in```引入,表示闭包的参数和返回值类型定义完成，闭包函数体即将开始
* 通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总能推断出闭包的参数和返回值类型
* 单行表达式闭包可以通过省略```return```关键字来隐式返回单行表达式的结果
* 通过String类型定义了运算符的实现，可以简单的传递一个大于号，Swift可以自动推断到系统自带字符串函数实现

```swift
// 表达式一般形式
{ (parameters) -> return type in
    statements
}
// 原始方式
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
// 根据是上下文推断类型
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
// 单行表达式闭包的隐式返回 
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

## 2、尾随闭包

* 如果需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换为尾随闭包的形式很有用
* 尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签
* 如果闭包表达式是函数或方法的唯一参数，则在使用尾随闭包时，可以把```()```省略

```swift
// 未使用尾随闭包
func someFunctionThat(closure: () -> Void) {
    // ...
}
// 使用尾随闭包语法
func someFunctionThatAtClosure() {
    // ...
}
// 使用尾随闭包
let reversedNames = names.sorted() { $0 > $1 }
// 使用尾随闭包
let reversedNames = names.sorted { $0 > $1 }
```

## 3、值捕获

* 闭包可以在其被定义的上下文中捕获常量或变量，即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
* 可以捕获值的闭包最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```

## 4、闭包是引用类型

* 无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用
* 如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包

## 5、逃逸闭包

* 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，则称该闭包从函数中逃逸
* 当你定义接收闭包作为参数的函数时，在参数名之前标注```@escaping```，指明该闭包是允许逃逸的
* 将一个闭包标记为```@escaping```意味着在闭包中必须显式引用```self```

## 6、Autoclosures(自动闭包)

* 是一种自动创建的闭包，用于包装传递给函数作为参数的表达式
* 这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值
* 这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包

```swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
// 非使用自动闭包
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
// 此时 customer 参数需要传递的是没有参数且返回值是String类型的函数
serve(customer: { customersInLine.remove(at: 0) } )

// 使用自动闭包，意味着
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
// 此时可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用
serve(customer: customersInLine.remove(at: 0))
```

## 7、注意点

* 如果在闭包表达式中使用参数名称缩写，可以在闭包定义中省略参数列表，对应参数名称缩写的类型会通过函数类型进行推断，```in```关键字同样可以被省略
* 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝
* Swift会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量
* 如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用
* 闭包和函数都是引用类型


