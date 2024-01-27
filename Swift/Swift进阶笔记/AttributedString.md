## AttributeString

从iOS 15开始可以使用

#### 自定义 AttributedStringKey

```swift
//定义
enum OutlineColorAttribute : AttributedStringKey {
    typealias Value = Color // 属性类型
    static let name = "OutlineColor" // 属性名称
}

struct ExtendedColorAtributes: AttributeScope {
    let outlineColor: OutlineColorAttribute
}

extension AttributeDynamicLookup {
    subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<ExtendedColorAtributes, T>) -> T {
        get { self[T.self] }
    }
}
```

```swift
//使用
var attributedString2 = AttributedString("Hello")
attributedString.outlineColor = .red
```

#### 参考资料

1、[比较全面](https://nilcoalescing.com/blog/AttributedStringAttributeScopes/)

2、[还可以](https://fatbobman.com/zh/posts/attributedstring/)