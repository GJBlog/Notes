### Key-Path Expression

> 该表达式引用类型的属性或者下标



我们可以为**一个函数创建一个等效的实现**，该函数`(Root) -> Value`预期的键路径为`\Root.Value`。在Swift 5.2中，我们甚至不需要自己做转换。根据这项提议，该功能被内置到Swift中，结果，一个键路径表达式`\Root.value`可以在允许使用`(Root) -> valu`e函数的地方使用。同样，**键路径表明它可以做的不仅仅是访问一个值。在这种情况下，它甚至取代了一个函数调用。**



[针对\.self 写法的解释](https://www.hackingwithswift.com/books/ios-swiftui/why-does-self-work-for-foreach)

[探索Swift中KeyPath的使用](https://juejin.cn/post/7093702462233640973)



