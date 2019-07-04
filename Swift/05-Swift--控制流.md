# 五、控制流(Control Flow)

### 1、For-In 循环(For-In Loops)

* 遍历集合中的所有元素
* 遍历某一个范围的所有值
* 遍历每一个元素可以是元祖类型
* 有间隔的遍历集合

```swift
for index in 1...5 {
    // ...
}
for (index, value) in numbers {
    // ...
}
for _ in numbers {
    // ...
}
let minuteInterval = 5
// 开区间
for tickMark in stride(from: 0, to: minutes, by:minuteInterval) {
    // ...
}
// 闭区间
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // ...
}
```

### 2、While 循环 (While Loops / Repeat-While Loops)

* 适合使用在第一次迭代前，迭代次数未知的条件下
    * while 循环，每次在循环开始时计算条件是否符合
    * Repeat-While 循环，每次在循环结束时计算条件是否符合，会先执行一次循环代码块，然后再重复循环直到条件为false

```swift
while condition {
    
}

repeat {
    
} while condition
```

### 3、If

* 仅仅包含一个条件，当该条件为true时，才执行。

### 4、Switch

* 将某个值与若干个相同类型的case模式做匹配，当某一个case与某个值匹配成功时，switch会执行该case对应的代码。
* 可以使用默认分支来涵盖其他所有没有对应的值
* 默认分支必须在switch语句的最后面
* 一旦值匹配到某一个case后，程序会结束switch的语句，不会继续执行下一个case分支。不需要显式使用break


#### 隐式贯穿

* 当匹配的 case 分支中的代码执行完毕后，程序会终止 switch 语句，而不会继续执行下一个 case 分支
* 虽然Swift中break不是必须的，但是后依然可以在每个case分支中的代码执行完毕前使用break跳出
* 如果想显式贯穿case分支，请使用```fallthrough```
* 每个case必须包含至少一条语句
* 一个case中可以通过"," 连接多个匹配项

#### 区间匹配、元祖

* case 匹配项可以是一个区间、元祖

#### 值绑定

* case 匹配项中可以值绑定(Value Bindings):将匹配的值声明为临时常量或变量，并且在case分支体内使用

#### where

* case 分支的模式可以使用where来判断额外的条件

```swift
switch some Value to consider {
case Value1:
    respond to value 1
case Value2:
    respond to Value 2
case Value3, Value4:
    respond to Value 3
case 12..<100:
    respond to Value 5
case (XX,XX):
    respond to Value 6
case (let x, 0):
    respond to Value x
case let (x, y) where x == -y:
    respond to Value x + y
defalut:
    otherwise, do something else
}
```

### 5、控制转移语句

#### 1、Continue、Break、Fallthrough、Labeled Statements

* continue: 让当前的循环体立刻停止本地循环，重新开始下次循环
* break: 立刻结束整个控制流的执行。在循环语句中，用于提前结束循环语句。在Switch中用于匹配或忽略每一个或多个分支
* Fallthrough：在switch中可以贯穿到下一个case分支中。该关键字不会检查它下一个将会落入执行的case匹配条件。
* Labeled Statements：显式指明break、continues 语句想要终止的是哪一个循环体或者条件语句,标记一个循环体或者条件语句。
* guard(Early Exit)：当条件为true时，执行guard语句后的代码，每一个guar语句总是有一个else句，如果条件不为真则执行else从句。在else从句中必须转移控制已退出guard语句出现的代码段。控制转移语句比如：return、break、continue、throw，或者调用一个不返回的方法或者函数，例如fatalError()

```swift
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}

label name: while condition { statements }
break label name
continues label name

guard let name = person["name"] else {
    return
}
```

### 6、检测API可用性

* 检测该代码中调用的API是否可用
* * 是必须要有的，用于指定在所有其他平台中，如果版本号高于你的设备指定的最低版本，if 语句的代码块将会运行。

```swift
// 在 iOS 中使用iOS10的API,在 mac OS中使用mac OS 10.12的API
// iOS：平台名称
// 10：版本号
if #available(iOS 10, macOS 10.12, *) {
    //API可用，语句将执行
} else {
    //API不可用，语句将不执行
}
```

