## 断言(Assert)

### 1、特点

* 默认情况下只会在Debug模式下生效，Release模式下会忽略

* 增加```Swift Flags```修改断言的默认行为

```swift
-assert-config Release：强制关闭断言
-assert-config Debug：前置开启断言
```



## Fatal Error

* 无法被do-catch捕捉
* 使用fatalError，就不需要写return
* 在某些不得不实现，但不希望别人调用的方法，可以考虑内部使用fatalError函数

```swift
class Person {
  required init() {}
}
class Student: Person {
  required init() { fatalError("don't call Student.init")}
  init(score: Int) {}
}
```

