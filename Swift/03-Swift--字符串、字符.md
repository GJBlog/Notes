# 三、字符串和字符(Strings and Characters)

1、字符串字面量(String Literals)

```swift
let something = "some string"
```

2、多行字符串字面量(Multiline String Literals)

```swift
let quotation = """
the White Rabbit put on his spectacles
till you come to ……
"""
```

3、在多行字符串字面量中通过在行尾添加\来取消换行符,且不可以在最后一行添加\

```swift
let some = """
the White Rabbit put on his spectacles.  "Where shall I begin\
please your Majesty
""" 
```

4、字符串字面量的特殊字符

* 转义字符：\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)、
* Unicode标量：\u{n}，n为任意一到八为十六进制数且可用的Unicode位码。

5、不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符

6、Unicode标量

* 表示方式：

```swift
let test = "\u{XX}"
```

7、字符串的修改和访问(Accessing and Modifying a string)

* 字符串索引(String indices)
    - startIndex：访问String的第一个Character的索引
    - endIndex：访问String的最后一个Character的后一个位置的索引
    - 在空串的情况下，startIndex和endIndex是相等的

```swift
let greenting = "Guten Tag!"
greenting[greenting.startIndex]
greenting[greenting.endIndex]
```

* 但凡遵循Collection协议的类型中都可以使用startIndex 和 endIndex 属性或者 index(before:) 、index(after:) 和 index(_:offsetBy:)，在(String、Array、Dictionary、Set)
* 但凡遵循RangeReplaceableCollection 协议的类型中都可以使用insert(_:at:)、insert(contentsOf:at:)、remove(at:) 和 removeSubrange(_:)，在(String、Array、Dictionary、Set)

8、子字符串(Substrings)

* 与String的区别是在于性能优化上，SubString可以重用原String的内存空间
* SubString不适合长期存储
* String与SubString都遵循StringProtocol协议
* 获取字符串前缀：hasPrefix()
* 获取字符串后缀：hasSuffix()

9、字符串Unicode表示形式

* UTF-8 ：编码字符串为8位的代码单元
* UTF-16：编码字符串为16位的代码单元
* UTF-32：编码字符串为32为的代码单元
* 可以通过便历String的unicodeScalars属性来访问它的Unicode标量

