# 下标

## 1、特点

* 适用于定义在类、结构体、枚举中，是访问集合、列表、序列中元素的快捷方式
* 用于使用下标的索引来设置和获取值，省去了调用对应的存取方法
* 一个类型可以定义多个下标，通过不同索引类型进行重载

## 2、语法

### 实例下标

* 所谓的实力下标是指在特定类型的一个实例上调用的下标，这种下标的类型被称为实例下标
* 允许通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取
* 定义下标使用```subscript```关键字，指定一个或者多个输入参数和返回类型
* 可以通过```getter```和```setter```来设定下标为只读和读写
* 如果不指定```setter```，默认是```newValue```参数名称
* 如果是只读下标，可以省略```get```关键字
* 下标可以接收任意数量、任意类型的入参，返回值也是可以是任意类型，包括可变参数，并且可以提供默认参数数值，但是不能使用输入输出参数
* 在定义多个下标时，是通过不同的入参数量和类型进行区分，自动调用合适的下标代码

```swift
subscript(index: Int) -> Int {
    get {
        // 返回一个适当的Int类型的值
    }
    set（newValue) {
        // 执行适当的赋值操作
    }

subscript(index: Int) -> Int {
    // 返回一个适当的Int类型的值
}
```

### 类型下标

* 所谓类型下标是指在某一个类型本身上调用的下标，这种下标的类型被称为类型下标
* 通过在```subscript```关键字之前写下```static```关键字的方式来表示一个类型下标
* 如果是类，使用```class```关键字来允许子类重写父类中对那个下标的实现

```swift
static subscript

//例子
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
```

## 3、注意点

* 能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性
* 通过在方法名称上添加```@discardableResult```,可以忽略返回值，不产生编译警告

