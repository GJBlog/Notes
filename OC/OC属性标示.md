## 总结OC中关于属性的编译器标识符

目前相关的标识符一共有如下几种


#### 属性

* 表示修饰的属性或者参数可以为空

```objective-c
// 写法一
@property (nonatomic, strong, nullable) NSString *name;
```
```objective-c
// 写法二
@property (nonatomic, strong) NSString *_Nullable name2;
```
```objective-c
// 写法三
@property (nonatomic, copy) NSString *__nullable name3;
```

* 表示修饰的属性或者参数不能为空

```objective-c
// 写法一
@property (nonatomic, copy, nonnull) NSString *name4;
```
```objective-c
// 写法二
@property (nonatomic, copy) NSString * _Nonnull name5;
```
```objective-c

```

#### 方法

* 表示方法参数可以为空

```objective-c
// 写法一
- (nullable NSString *)runWithName1:(nullable NSString *)name;
```

```objective-c
// 写法二
- (NSString * __nullable)runWithName2:(NSString * __nullable)name;
```

```objective-c
// 写法三
- (NSString * _Nullable)runWithName3:(NSString * _Nullable)name;
```

* 表示方法参数不可以为空

```objective-c
// 写法一
- (nonnull NSString *)runWithName4:(nonnull NSString *)name;
```
```objective-c
// 写法二
- (NSString * __nonnull)runWithName5:(NSString * __nonnull)name;
```
```objective-c
// 写法三
- (NSString * _Nonnull)runWithName6:(NSString * _Nonnull)name;
```

#### Nonnull区域设置(Audited Regions)

> Apple提供了设置部分区域的宏定义，用于设置某些区域中都是nonnull特性，该宏定义在**NSObjCRuntime.h**头文件中

```objective-c
// 定义开始
NS_ASSUME_NONNULL_BEGIN
// 编写需要被设置为nonnull的属性和方法
//定义结束
NS_ASSUME_NONNULL_END
```

在使用该宏定义时，需要遵循以下规则

> 1.`typedef`定义的类型的`nullability`特性通常依赖于上下文，即使是在`Audited Regions`中，也不能假定它为`nonnull`。
>  2.复杂的指针类型(如`id *`)必须显示去指定是`nonnull`还是`nullable`。例如，指定一个指向nullable对象的nonnull指针，可以使用`”__nullable id * __nonnull”`。
>  3.我们经常使用的`NSError **`通常是被假定为一个指向`nullable NSError`对象的`nullable`指针。

#### null_resettable

> 用于表示：被修饰的属性get方法不能返回空，set可以设置空，通常可以重写get方法

```objective-c
@property (nonatomic, strong, null_resettable) NSString *name7;
```

#### null_unspecified

> 表示不确定是否为空

```objective-c
// 写法一
@property (nonatomic, strong, null_unspecified) NSString *name8;
```

```objective-c
// 写法二
@property (nonatomic, strong) NSString * __null_unspecified name9;
```

```objective-c
// 写法三
@property (nonatomic, strong) NSString * _Null_unspecified name10;
```

#### 注意点

* 以上标识符在属性中仅仅只能用来修饰对象类型

#### 参考来源

[apple](https://developer.apple.com/swift/blog/?id=25)

[简书](https://www.jianshu.com/p/1f672a441052)

[nshipster](https://nshipster.com/swift-1.2/)