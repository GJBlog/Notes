## 条件编译

#### 操作系统

```swift
// macOS、iOS、tvOS、watchOS、Linux、Android、Windows、FreeBSD
#if os(macOS) || os(iOS)
#endif
```

#### CPU架构

```swift
// i386、x86_64、arm、arm64
#if arch（x86_64)
#endif
```

#### Swift版本
```swift
#if swift(<5.1) && swift(>=3)
print("this is swift 4")
#endif
```

#### 模拟器
```swift
#if targetEnvironment(simulator)
print("this is simulator")
#endif
```

#### 可导入某模块
```swift
#if canImport(Foundation)
print("this is can Foudation")
#endif
```

#### 自定义标记

```swift
// 第一种方式
在BuildSettings中Active Comilation Conditions里面设置，DEBUG+ 空格 + 自定义标记名称
// 第二种方式
在BuildSettings中Other swift Flags里面设置，-D + 空格 + 自定义标记名称
```

