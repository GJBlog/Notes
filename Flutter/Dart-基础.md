## Dart基础知识

### Dart

它是一个强大的脚本类型语言

### 代码入口

所有的dart代码都必须放到main方法中执行

### 一、Dart变量

可以不预先定义变量类型，自动会类型推断,使用```var``` 来定义变量，每一个变量都是对象，未初始化的变量拥有一个默认初始值：`null`

##### 1、Dart的变量命名规则

(1)、变量名称必须由数字、字母、下划线和美元符($)组成
(2)、注意：标识符开头不能是数字
(3)、标识符不能是保留字和关键字
(4)、变量的名字是区分大小写的
(5)、标识符一定要见名知意：

### 二、Dart 常量

* final：可以开始不赋值，只能赋值一次，是惰性初始化，即在运行时第一次使用前才真正初始化，可以通过运行时赋值
* const：需要在解释运行前就要赋值，且赋值后不变，如果修饰类中的变量，则必须添加static关键字且`static const`

### 三、Dart数据类型

* is：类型判断

```dart
var str1 = "123";
if(str1 is String) {
    //....
}
```

##### 1、Numbers：数值类型

* int类型：只能接收整型，长度不超过64位
* double类型：64位双精度浮点数，可以接收浮点型也可以接收整型

```dart
int a = 123;
double b = 123.45;
```

##### 2、Strings：字符串类型

> 是UTF-16编码的字符序列，可以使用单引号或者双引号
>
> 如果使用单引号创建字符串时，如果遇到需要转义的符号时，需要添加`\`，而如果使用双引号创建字符串，则不需要额外添加转义`\`
>
> 在字符串中以`${表达式}`的形式使用表达式，如果表达式是一个标识符，则可以省略`{}`，否则不能省略
>
> 如果表达式的结果是一个对象，则会调用该对象的`toString`方法
>
> 可以使会用三个单引号或者三个双引号创建多行字符串
>
> 在字符串前添加`r`关键字创建`raw`字符串(即不会被任何处理(比如转义之类的)的字符串)
>
> 字符串字面量是一个编译时常量，只要是编译时常量都可以作为字符串字面量的插值表达式

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

```dart
3、单引号和双引号字符串
var s3 = 'It\'s easy to escape the string delimiter.';
var s4 = "It's even easier to use the other delimiter.";
```

```dart
4、是否省略{}
const name = "GJ";
// 可以省略
var s = "$name";
// 不可以省略
var s1 = "${name.toString()}";
```

```dart
5、创建多行字符串
var s1 = '''
你可以像这样创建多行字符串。
''';
var s2 = """这也是一个多行字符串。""";
```

##### 3、Boolean：布尔类型

取值为：true、false

```dart
bool flag1 = true;
bool flag2 = false;
```

##### 4、Lists：集合类型

> 数组由List对象来表示

```dart
// 表示constantList指向的是一个编译时常量List，该list不能修改
var constantList = const [1, 2, 3];
constantList.add(4); // Error
```

```dart
// Collection If
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'
];
// collection for
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
assert(listOfStrings[1] == '#1');
```

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

##### 5、Sets：集合

> 是一组特定元素的无序集合

创建方式

```dart
// 1、通过类型参数方式创建Set
var names = <String>{};
// 2、通过Set类型的变量方式创建Set
Set<String> names = {};
var names = {}; //Error,这样子创建的是Map，不是Set
// 3、通过字面量创建Set
var elements = {"GK", "list"};
```

##### 6、Map：字典类型

> key和value可以是任何类型的对象
>
> 一个Map对象中一个key只能出现一次

```dart
// 1、使用字面量创建Map
var person = {
    "name": value1,
    "age": value2
};
print(person["name"]);
var person2 = new Map();
person2["name"] = "张三";

// 2、通过Map的构造器创建Map
var gifts = Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

// 3、创建Map编译时常量
final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};
```

##### 7、Runes：类型

##### 8、Symnols:类型

### 四、Dart运算符

> `==` 会判断两个对象的内容是否一样，如果两个字符串包含一样的字符编码序列，则表示相等
>
> `+`可以将两个字符串连接为一个

* 算数运算符：+、-、*、/、取整(~/)
* 关系运算符：==、!=、>=、<=、>、<
* 逻辑运算符：&&、||、!
* 条件表达式：if、else、switch、??、三目运算符(A ? B : C)
* 赋值运算符：=、(??=)
* 复合赋值运算符：+=、-=、*=、/=、%=、~/=
* 自增自减运算符：++、--
* 扩展运算符(spread operator)：...
* 可为空扩展运算符(null-aware spread operator)：...

```dart
var s1 = "I"'am'"GJ";
var s2 = "!";
var s3 = s1 + s2;
```

```dart
int a = 12;
// 如果a为空，则把23赋值给a，否则a依然为12
a??=23;
// 如果a为空，则把10赋值给b，否则把a赋值给b
var b = a ?? 10;
```

```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);

var list;
var list2 = [0, ...?list];
assert(list2.length == 1);
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

> 函数的返回类型可以省略
>
> 如果函数体内只包含一个表达式，可以使用简写语法

```dart
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

```dart
isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

```dart
// 语法 => 表达式 是 { return 表达式; } 的简写， => 有时也称之为胖箭头语法
// 仅仅只能是表达式不能是语句
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

* 普通方法定义

```dart
// 定义语法
返回类型 方法名称(参数1, 参数2...) {
    方法体
    return 返回值;
}
// 返回类型可以省略，参数类型可以省略
```

* 可选参数分为如下两种

可选位置参数

  ```dart
  // 可以添加可选参数，则
  返回类型 方法名称(参数1, 参数2， [可选参数1， 可选参数2]) {}
  // 带默认值的可选参数
  返回类型 方法名称(参数1， 参数2，[可选参数1 = 参数值, 可选参数2]) 	{}
  ```

可选命名参数

```dart
// 定义时
返回类型 方法名称(参数1， 参数2， {参数名称3：参数值, 参数名称4：参数值}) {}
void buildThree(int num, {String name, int range}) {
}
// 调用时
buildThree(10, name: "XXx", range: 10);
```

* 默认参数值

> 可以用 `=` 为函数的命名和位置参数定义默认值，默认值必须为编译时常量，没有指定默认值的情况下默认值为 `null`

* 匿名方法

```dart
// 没有名字的方法
var func1 = () {};
// 形式
([[类型] 参数[, …]]) {
  函数体;
};
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

* 一个类通常由属性和方法组成

```dart
// 定义一个类
class 类名 {

}
```

##### 构造函数

> 命名方式分为：类名和类名.标识符两种

```dart
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
```

* 默认构造方法，在实例化一个类时调用，且只能写一个

```dart
class Person {
  // 构造方法(1)
  Person(String name, int age) {
    print("!!!");
  }
  // 构造方法(2)
  Person(this.name);
}
```

* 命名构造函数，可以写多个

```dart
Person.now() {
  print("当前是命名构造函数-now");
}
```

* 常量构造函数

> 使用常量构造函数，在构造函数名之前加const关键字，来创建编译时常量
>
> 如果类生成的对象都是不会变的，那么可以在生成这些对象时就将其变为编译时常量。你可以在类的构造函数前加上 `const` 关键字并确保所有实例变量均为 `final` 来实现该功能

```dart
// 定义类
class Person {
  final String name;
  const Person(this.name);
}
// 初始化类
const r1 =  Person("lisi");
const r2 =  Person("lisi");
// 可以得到两个相同的对象
print(identical(r1, r2));
```

* 工厂构造函数



### 八、抽取单独类为一个模块

> 单独抽取到一个文件中，且在另外的文件中使用时，只需通过`import`引入即可

### 九、私有方法、私有属性

> Dart 中没有访问修饰符，如果想把方法或者属性设置为私有，则需要
>
> 1、先将当前类抽取到一个文件中
>
> 2、将文件中的类中的属性或者方法添加`_`前缀即可

```dart
class Animal {
  // 私有属性
  String _name;
  int age;
  Animal() {
    print("默认构造函数-${_name}, ${age}");
  }
  Animal.setInfo(String name, int age) {
    this._name = name;
    this.age = age;
    print("命名构造函数-${this._name}, ${this.age}");
  }
  // 私有方法
  void _printInfo() {
    print("内容是-${this._name}, ${this.age}");
  }
  @override
  String toString() {
    return "name = ${this._name}, age = ${this.age}";
  }
}
```

### 10、类中的getter、setter 修饰符

```dart
class Animal {
  String _name;
  int age;
  Animal() {
    print("默认构造函数-${_name}, ${age}");
  }
  Animal.setInfo(String name, int age) {
    this._name = name;
    this.age = age;
    print("命名构造函数-${this._name}, ${this.age}");
    _printInfo();
  }
  void _printInfo() {
    print("内容是-${this._name}, ${this.age}");
  }
  // getter
  String get getInfo {
    return "你好,00:30!";
  }
  // setter
  set newName(String value) {
    this._name = value;
  }
  @override
  String toString() {
    return "name = ${this._name}, age = ${this.age}";
  }
}
```

```dar
Animal an = new Animal();
print("${an.getInfo}");
an.newName = "wangwu";
```

### 11、类中的初始化列表

> 可以在构造函数运行之前初始化实例变量

```dart
class Rect {
  int height;
  int age;
  int area;
  Rect(): height = 30, age = 40 {}
  Rect(this.height, this.age): area = height * age, XXX;
}
```

### 12、类中的静态成员

> 使用`static`关键字来实现类级别的变量和函数
>
> 静态方法不能访问非静态成员，非静态方法可以访问静态成员
>
> 通过类名.调用

```dart
class Person {
  static String name = "张三";
  int age = 20;
  static void show() {
    // 静态方法中访问静态成员，不要加this
    // 静态方法中无法访问非静态成员/非静态方法
    print(name);
  }
  void printInfo() {
    // 非静态方法中访问静态方法，不要加this，
    // 非静态方法中访问静态成员推荐添加this
    show();
    printf(this.age);
  }
}
```

### 13、对象操作符

```dart
?		：条件运算符
as	：类型转换
is	：类型判断
..	：级联操作(连缀)
```

```dart
p1.name = "李四";
p1.age = 40;
p1.printInfo();
等价于
p1..name = "李四"
  ..age = 50
  ..printInfo();
```

### 14、类的继承

> 1、子类使用extends关键词来继承父类
>
> 2、子类会继承父类里面可见的属性和方法，但是不会继承构造函数
>
> 3、子类能复写父类的方法 getter和setter

```dart
// 重写父类方法，@override可写可不写，建议在覆写父类方法的时候加上
@override
void printInfo() {
	// .... 
}
// 在子类中调用父类的方法，通过super关键字关键字
void work() {
  super.run();
}
```

### 15、抽象类

> 主要用于定义标准，子类可以继承抽象类，也可以实现抽象类接口

* 抽象类通过abstract关键字定义
* 抽象方法不能用abstract声明，Dart中没有方法体的方法被称为抽象方法
* 如果子类继承抽象类，就必须得实现里面的抽象方法
* 如果把抽象类当做接口实现的话，就必须得实现抽象类里面定义的所有属性和方法
* 抽象类不能被实例化，只有继承它的子类可以

### 16、接口

> 定义接口时没有interface关键字，而是普通类或抽象类都可以作为接口被实现
>
> 在实现的时候同样使用implements关键字实现
>
> 如果实现的类是普通类，那么普通类和抽象中的属性和方法都需要全部覆写一遍
>
> 一般使用定义抽象类来实现类似java中的接口方式

extends抽象类和implements的区别

1、如果要复用抽象类里面的方法，并且要用抽象方法约束自身类的话，我们就用extends继承抽象类

2、如果只是把抽象类当做标准的话，我们就用implements实现抽象类

```dart
// 一个类实现多个接口
abstract A {}
abstract B {}
class C implements A, B {}
```

### 17、mixins

> 中文的意思是混入，在类中混入其他方法
>
> 可以使用`mixins`实现类似多继承的功能
>
> 使用`with`关键字来实现`mixins`

* 作为`mixins`的类只能是继承自`object`，不能继承其他类
* 作为`mixins`的类不能有构造函数
* 一个类可以`mixins`多个`mixins`类
* `mixins`绝不是继承，也不是接口，而是一种全新的特性
* `minxins`的类型就是其超类的子类型

```dart
class A {
  void printA(){}
}
class B {
  void printB() {}
}
class C with A, B {}
```

### 18、泛型

> 分为泛型方法、类、接口

```dart
// 泛型方法
void setByKey(String key, T value) {
  print("当前数据是key:${key}, value是：${value}");
}
// 泛型类
class PrintClass<T> {
  List<T> list = new List();
  void add(T value) {
    this.list.add(value);
  }
  void printInfo() {
    for (var item in list) {
      print(item);
    }
  }
}
// 泛型接口
abstract class Cache<T> {
  getByKey(String key);
  void setByKey(String key, T value);
}
```

### 19、async、await

> 只有async方法才能使用await关键字调用方法
>
> 如果调用别的async方法必须使用await关键字

```dart
async：是让方法变成异步
await：是等待异步方法执行完成
```

### 20、库

> dart中主要有三种库
>
> 1、自定义库
>
> 2、系统内置库
>
> 3、通过`pub`包管理引入的第三方库

```dart
// 自定义库
import 'lib/xxx.dart';
// 系统内置库
import 'dart:match';
// 通过`pub`包管理引入的第三方库，有如下两种：
// 第一种方式，只导入需要的部分，使用show关键字，表示只引用foo
import 'package: lib1/lib1.dart' show foo;
// 第二种方式，隐藏不需要的部分，使用hide关键字，隐藏不需要foo
import 'package: lib2/lib2.dart' hide foo;
```

* 如果是通过`pub`包管理引入的第三方库的话，需要先在项目路径下创建pubspect.yaml文件，在该文件中配置要依赖的库

```dart
name: my_app
dependencies:
  http: ^0.12.0+4
```

* 可以通过`as`关键字可以对引入的库重命名

```dart
import 'package: lib1/lib1.dart' as XXX
```

* 延时加载(懒加载)，在需要的时候再进行加载，使用```deferred as`关键字指定

```dart
import 'papckage:deferred/hello.dart' deferred as hello;
// 使用时
greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
```

