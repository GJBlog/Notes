# 方法

## 1、实例方法(Instance Methods)

* 类、结构体、枚举都可以定义实例方法
* 语法跟函数完全一致
* 实例方法要写在它所属的类型的前后大括号之间。
* 实例方法能够隐式访问它所属类型的所有的其他实例方法和属性

```swift
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
```

### self属性

* 类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例
* 不论何时，只要在一个方法中使用一个已知的属性或者方法名称，如果你没有明确地写 self，Swift 假定你是指当前实例的属性或者方法

```swift
func increment() {
    self.count += 1
}
```

### 实例方法中修改值类型

* 默认情况下，值类型(结构体、枚举)的属性不能在它的实例方法中被修改
* 如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，可以通过为这个方法选择可变（mutating）行为，然后就可以从其方法内部改变它的属性
* 方法还可以给它隐含的 self 属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。

```swift
// 在方法内部修改值类型
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
// 给self赋值
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
```

## 2、类型方法

* 类、结构体、枚举都可以定义类型方法
* 定义在类型本身上调用的方法为类型方法
* 在方法的 func 关键字之前加上关键字 static，来指定类型方法
* 类还可以用关键字 class 来指定，从而允许子类重写父类该方法的实现
* 在类型方法的方法体（body）中，self 属性指向这个类型本身，而不是类型的某个实例
* 一般来说，在类型方法的方法体中，任何未限定的方法和属性名称，可以被本类中其他的类型方法和类型属性引用
* 一个类型方法可以直接通过类型方法的名称调用本类中的其它类型方法，而无需在方法名称前面加上类型名称
* 在结构体和枚举中，也能够直接通过类型属性的名称访问本类中的类型属性，而不需要前面加上类型名称

```swift
class SomeClass {
    @discardableResult
    class func someTypeMethod() {
        // 在这里实现类型方法
    }
}
SomeClass.someTypeMethod()
```

## 3、注意点

* 能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性
* 通过在方法名称上添加```@discardableResult```,可以忽略返回值，不产生编译警告

