# Dart基础知识

### Dart

它是一个强大的脚本类型语言

### 代码入口

所有的dart代码都必须放到main方法中执行

### 一、Dart变量

可以不预先定义变量类型，自动会类型推断,使用```var``` 来定义变量

##### 1、Dart的变量命名规则

(1)、变量名称必须由数字、字母、下划线和美元符($)组成
(2)、注意：标识符开头不能是数字
(3)、标识符不能是保留字和关键字
(4)、变量的名字是区分大小写的
(5)、标识符一定要见名知意：

### 二、Dart 常量

 final：可以开始不赋值，只能赋值一次，是惰性初始化，即在运行时第一次使用前才真正初始化
 const：需要在解释运行前就要赋值，且赋值后不变

### 三、Dart数据类型

* is：类型判断

```dart
var str1 = "123";
if(str1 is String) {
    //....
}
```

##### 1、Number：数值类型

* int类型：只能接收整型
* double类型：可以接收浮点型也可以接收整型

```dart
int a = 123;
double b = 123.45;
```

##### 2、String：字符串类型

```dart
1、定义字符串的方式
var str1 = "123";
var str2 = '345';
String str3 = 'this is string';
String str4 = '''this is a str1'''
```
```dart
2、字符串拼接
Sting str1 = '你好';
String str2 = 'Hello';
String str3 = "$str1 $str2";
String str4 = str1 + str2;
```

##### 3、Boolean：布尔类型

取值为：true、false

```dart
bool flag1 = true;
bool flag2 = false;
```

##### 4、List：集合类型

```dart
var list1 = ['aaa', 'bbb', 'ccc'];
var list2 = new List();
// 指定List元素类型
var list3 = new List<String>();
```

##### 5、Map：字典类型

```dart
var person = {
    "name": value1,
    "age": value2
};
print(person["name"]);
var person2 = new Map();
person2["name"] = "张三";
```

##### 6、Runes：类型



##### 7、Symnols:类型


### 四、Dart运算符

* 算数运算符：+、-、*、/、取整(~/)
* 关系运算符：==、!=、>=、<=、>、<
* 逻辑运算符：&&、||、!
* 条件表达式：if、else、switch、??、三目运算符(A ? B : C)
* 赋值运算符：=、(??=)
* 复合赋值运算符：+=、-=、*=、/=、%=、~/=
* 自增自减运算符：++、--

```dart
int a = 12;
// 如果a为空，则把23赋值给a，否则a依然为12
a??=23;
// 如果a为空，则把10赋值给b，否则把a赋值给b
var b = a ?? 10;
```

### 五、类型转换

* Number与String类型之间的转换

```dart
// Number => String：toString()
var num1 = 123;
var str = num1.toString();
// String => Number：XXX.parse()
String str1 = "123";
var myNumber = int.parse(str1);
```

* 其他类型转换成Booleans类型

```dart
// isEmpty：判断当前字符串为空
var str1 = 'XXX';
// isNaN：当 0 / 0时，num的值为NaN
var num = 0 / 0;
```

### 五、Dart循环语句

* for循环

```dart
for(int i = 0; i < 10; i++) {
    //...
}
```

* while循环

```dart
while(表达式/循环条件) {
    //...
}
```

* do while循环

```dart
do {
    //...
} while(表达式/循环条件);
```