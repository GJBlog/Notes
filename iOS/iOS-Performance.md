## 性能

### Xcode Instruments

### dtrace（dynamic tracing 动态跟踪）

* 被视为外部和内部测量设备类的组合，拥有内核支持和完整脚本跟踪设施

### 字符串

```objc
NSString字面量是由 NSCFConstantString使用8位字符存储表示
NSCFString(基于CoreFoundation的CFString)类使用16位的Unicode字符内部存储
```

### 对象

* 使用KVC比使用原子操作(atomic)的存取器慢得多，例如：

```objc
//使用该调用方式不仅比等效的直接发送消息[aTester attribute]更冗长，而且更容易出错，因为编译器无法检查传递给valueForKey的字符串是否有效，同时效率变为原来的5%
[aTester valueForKey:"attribute"]
//使用该方式是其直接消息发送速度的2倍，比valueForKey:快10倍
[aTester performSelector:@selector(attribute)]
```

* OC中对象的创建是非常昂贵的，最好使用静态对象和粗粒度的实体，通过发送消息交换信息，大多数情况下最好使用标量/基本参数