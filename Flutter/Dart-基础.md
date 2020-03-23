## Dart基础知识

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

常用的属性

```dart
length：长度
reversed：元素反转
isEmpty：是否为空
isNotEmpty：是否为不空
```

常用的方法

```dart
add：增加元素
addAll：拼接数组/集合
indexOf：查找传入元素的下标
remove：删除元素
removeAt：删除传入的下标对应的元素
fillRange：修复某个元素
insert(index, value)：某个位置插入元素
insertAll(index, list)：某个位置插入一部分元素
toList()：转为List类型
join()：List转为字符串类型
split()：字符串转为List
forEach：
map：
where：
any：
```

* indexOf方法:如果查找不到，则返回`-1`

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

### 六、Dart函数/方法

* 普通方法定义

```dart
// 定义语法
返回类型 方法名称(参数1, 参数2...) {
    方法体
    return 返回值;
}
// 返回类型可以省略，参数类型可以省略
```

* 可选参数

```dart
// 可以添加可选参数，则
返回类型 方法名称(参数1, 参数2， [可选参数1， 可选参数2]) {}
// 带默认值的可选参数
返回类型 方法名称(参数1， 参数2，[可选参数1 = 参数值, 可选参数2]) {}
```

* 命名参数

```dart
返回类型 方法名称(参数1， 参数2， {参数名称3：参数值, 参数名称4：参数值}) {}
```

* 方法参数是方法的方法

* 箭头函数

```dart
// 代码块只能有1行
() => { 代码块 }
```

* 匿名方法

```dart
// 没有名字的方法
var func1 = () {};
```

* 自执行方法

```dart
// 在程序启动时自动执行
((){ 代码块 })();
```

* 闭包

```dart
// 函数嵌套函数，并在return中返回函数
```

### 七、Dart类/对象

> Dart中所有的东西都是对象，所有的对象都是继承自object类
>
> Dart是一门使用类和单继承的面向对象语言，所有的对象都是类的实例，并且所有的类都是object类的子类



一个类通常由属性和方法组成

```dart
// 定义一个类
class 类名 {

}
```
