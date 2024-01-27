## Swift-错误

### 自定义错误

* 在Swift中可以通过Error协议自定义运行时的错误信息
* 函数内部通过throw抛出自定义Error，可能会抛出Error的函数必须加上throws声明

```swift
enum SomeError: Error {
  case outOfMemory
}
func divide(_ num1: Int, _ num2: Int) throws -> Int {
  throw SomeError.outofMemory
}
```

* 需要使用try调用可能会抛出Error的函数
* 可以使用do-catch捕捉Error

```swift
func test() {
  do {
  	try XXXX  
  } catch let error.... {
	}
}
```

* 抛出Error后，try下一句直到作用域结束的代码都将停止运行

### do

* 除了跟 catch 配合使用捕捉错误外，还可以实现局部作用域

```swift
do {
  print("do 。。。。")
}
```

### 处理Error

* 处理的2种方式
  * 通过do-catch捕捉Error
  * 不捕捉Error，在当前函数增加throws声明，Error将自动抛给上层函数

### try? 、try?

* 可以使用try?或者try!调用可能抛出Error的函数，这样就不用去处理Error

### rethrows

* 函数本身不会抛出错误，但调用闭包参数抛出错误，那么它会将错误往上抛

### defer

* 用来定义以任何方式(抛错误、return等)离开代码前必须要执行的代码
* defer语句的执行顺序与定义顺序相反

```swift
func fn1() { print("fn1") }
func fn2() { print("fn2") }
func test() {
  defer {fn1()}
  defer {fn2()}
}
test()
// fn2
// fn1
```

