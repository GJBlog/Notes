## 泛型(Generics)

> 可以将类型参数化，提高代码复用率，减少代码量

### 关联类型(Associated Type)

* 作用：给协议中用到的类型定义一个占位名称
* 协议可以拥有多个关联类型

```
protocol Stackable {
	associatedType Element // 关联类型
	mutating func push(_ element: Element)
	mutating func pop() -> Element
	func top() -> Element
	func size() -> Int
}
```

### 泛型类型约束

```
protocol Runnable {}
class Person {}
func swapValues<T: Person & Runnable>(_ a: inout T, b: inout T) {
	(a, b) = (b, a)
}
```

```
protocol Stackable {
	associatedtype Element: Equatable
}
class Stack<E: Equatable>: Stackable {}
```

* 如果协议中存在关联类型associatedtype，则在返回协议类型时，会报错，因为此时编译器并不知道协议中的关联类型是什么，解决方式
* 第一种，使用泛型

```
func get<T: Runnable>(_ type: Int) -> T {
	if type == 0 {
		return Person() as! T
	}
	return Car() as! T
}
```

* 第二种，使用some关键字声明一个不透明类型(Opaque Type)，但是some限制只能返回一种类型

```
func get(_ type: Int) -> some Runnable {
	return Car()
}    
```

### Some

* 除了用于在返回值类型上，一般还可以用在属性类型上

```
protocol Runnable {
    associatedtype Speed
}

class Dog: Runnable {
    typealias Speed = Double
}
class Person {
    var pet: some Runnable {
        return Dog()
    }
}
```



  

  

  