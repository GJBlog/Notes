## 类和结构体

### 1、特点

* 类和结构体共有
    * 定义属性用于存储值
    * 定义方法用于提供功能
    * 定义下标操作用于通过下表语法访问值
    * 定义构造器用于设置初始值
    * 通过扩展以增加默认实现之外的功能
    * 遵循协议以提供某种标准功能

* 类特有
    * 继承，允许一个类继承另一个的特征
    * 类型转换允许在运行时检查和解释一个类实例的类型
    * 析构器允许一个类实例释放任何其所被分配的资源
    * 引用计数允许对一个类的多次引用

### 2、语法

* 通过 struct 关键字引入结构体，通过 class 关键字引入类，并将它们的具体定义放在一对大括号中
* 结构体和类都是用构造器来创建新的实例，构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号，如 Resolution() 或 VideoMode()。通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值
* 使用```.```访问实例的属性
* 所有结构体*默认*都会有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性

```swift
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

* 对于结构体，一旦在定义结构体时自定义了初始化器，那么编译器就不会再帮它自动生成其他初始化器

### 3、结构体和枚举是值类型

* 值类型赋值给var、let或者给函数传参时，是直接将所有内容拷贝一份
* 类型于对文件进行copy、paste操作，产生了全新的文件副本，属于深拷贝(deep copy)
* 仅当有写操作时，才会真正执行拷贝操作
* 结构体内存中如果有成员变量则结构体的地址就是内部第一个成员变量的地址

### 4、类是引用类型(指针类型)

* 引用类型在被赋予到一个var、let或者给函数传参时，是将内存地址拷贝一份
* 类对象在内存中，前8个字节存放指向类型信息，接着8个字节存放类对象的引用计数，接着是相关的成员变量/属性

![WeChat1c5eba92a99fcefd090647ce47511881](/Users/guo/Desktop/WeChat1c5eba92a99fcefd090647ce47511881.png)

### 5、恒等运算符

* 判定两个常量或者变量是否引用同一个类实例
    * 相同(```===```)
    * 不相同(```!==```)

```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."
```

### 6、注意点

* 定义一个新的结构体或者类时，使用 UpperCamelCase 这种方式来命名类型（如这里的 SomeClass 和 SomeStructure）
* 定义属性和方法（如 framerate 和 incrementCount）时，请使用 lowerCamelCase 这种方式来命名
* 标准库定义的集合都对复制进行了优化以降低性能成本。新集合不会立即复制，而是跟原集合共享同一份内存，共享同样的元素。在集合的某个副本要被修改前，才会复制它的元素。而你在代码中看起来就像是立即发生了复制
* 恒等运算符仅仅使用于类的实例之间
* Swift 中引用了某个引用类型实例的常量或变量，与 C 语言中的指针类似

