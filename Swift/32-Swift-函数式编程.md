## 函数式编程

> Funtional Programming 简称FP，是一种编程范式，也就是如何编写程序的方法论
>
> 主要思想：把计算过程尽量分解成一系列复用函数的调用

#### 高阶函数(Higher-Order Function)

* 至少满足下列一个条件的函数
  * 接受一个或者多个函数作为输入(map、fliter、reduce等)
  * 返回一个函数

#### 柯里化(Currying)

> 将一个接收多参数的函数变换位一系列只接受单个参数的函数

#### 函子(Functor)

> 像Array、Optional这样支持map运算的类型被称为函子(Functor)

```swift
// Array<Element>
public func map<T>(_ transform: (Element) -> T) -> Array<T>
```

```swift
// Optional<Wrapped>
public func map<U>(_ transform: (wrapped) -> U) -> Optional<U>
```

#### 适用函子

> 对于任意一个函子，如果能支持一下运算，该函子就是一个适用函子

```swift
func pure<A>(_ value: A) -> F<A>
func <**><A,B>(fn: F<(A) -> B>, value: F<A>) -> F<B>
```

