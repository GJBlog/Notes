## 模式匹配

### 模式(Pattern)

> 所谓模式，就是用于匹配的规则，比如Switch的case，捕捉错误的catch，if\guard\while\for语句的条件等

### Swift中的模式

#### 通配符模式(Wildcard Pattern)

* _ 匹配任何值
* _? 匹配非nil值

#### 标识符模式(Identifier Pattern)

#### 值绑定模式(Value-Binding Pattern)

#### 元组模式(Tuple Pattern)

#### 枚举Case模式(Enumeration Case Pattern)

#### 可选模式(Optional Pattern)

#### 类型转换模式(Type-Casting Pattern)

#### 表达式模式(Expression Pattern)

* 可以通过重载运算符，自定义表达式模式的匹配规则

```swift
extension String {
    static func ~= (pattern: (String) -> Bool, value: String) -> Bool {
        pattern(value)
    }
}
```

#### Where

* 为模式匹配增加匹配条件

