# C 语言

### 基础点

1、原码

* 最高位：作为符号位，用0表示"正"，用1表示"负"
* 其余位：作为数值位，表示绝对值的大小(所以原码又称为带符号的绝对值)

2、反码

* 正数的反码：和原码一样
* 负数的反码：原码保持符号位不变，数值位按位取反(0变1，1变0)，得到反码

3、补码

* 正数的补码：和原码一样
* 负数的补码：反码的末位加1，得到补码

4、大小端模式

* 决定了**多字节数据的字节存储顺序**
* 大端模式(Big-endian)：高低低高，**高字节**放在低地址，**低字节**放在高地址
* 小端模式(little-endian)：高高低低，低字节放在低地址，高字节放在高地址
* X86架构是**小端**模式

### 语法注意点

```c
if (10 > 6) 
	int a = 5;
// 编译报错：因为作用域不明确
```

```c
int a = 5;
switch (a) 
{
  case 10:
     printf("A\n");
  case 5:
     printf("B\n");
     break;
  default:
     printf("B\n");
     break;
}
// 如果case后面没有break，就会执行后面所有case中的语句，直到遇到break为止
```

```c
int a = 5;
int b = 10;
switch (a) 
{
  case 10:
    {
      printf("A\n");
      int sum = a + b;
     }
  case 5:
     printf("B\n");
     break;
  default:
     printf("B\n");
     break;
}
// 编译报错，sun定义的作用域不明确
// 解决方案：如果要在case后面定义新的变量，必须用大括号{}包住
```
**关于return的注意点**

```c
// 如果不明确声明返回值类型，默认就是int类型
test2() 
{
  return 0;
}
```

```c
// 就算明确声明了返回值类型，也可以不返回任何值
int test() 
{
  printf("XXXX");
} 
```

#### 函数

* 默认情况下，不允许有函数的名称一样 
* 函数不能嵌套定义
* 函数不能重复定义，但是可以重复声明

#### include 作用

* 拷贝右边文件的所有内容到#include所在的位置（位置可以是相对路径或者绝对路径）
* 自定义的文件使用""引入，系统自带的文件使用<>引入

```c
#include <stdio.h>
int main() 
{
  printf("哈哈哈\n");
  #include "相对路径"
  #include "绝对路径"
 	return 0; 
}
```

long：扩充int类型的取值范围，属于类型说明符，用于修饰 int 

long long int 等价于 long long，8个字节

long int 等价于 long，8个字节

short int 等价于 short 2个字节

signed == signed int，最高位要当做符号位，取值范围：-2的31次方 ~ 2的31次方 - 1

unsigned == unsigned int，最高位不要当做符号位，取值范围：0 ~ 2的32次方 - 1

#### 按位异或 ^

1、相同数值进行异或，结果肯定是0，比如 9 ^ 9

2、可以交换 9 ^ 5 ^ 6 = 9 ^ 6 ^ 5

3、任何数值跟0进行异或，结果还是原来的数值

4、a ^ b ^ a = a ^ a ^ b = 0 ^ b = b

5、应用

```c
a = 10, b = 11;
a = a ^ b;
b = a ^ b;
a = a ^ b;
a = 11, b = 10;
```

#### 左移

**a << n**：将a的**所有二进制位**向左移动1位，等价于 a * 2的n次方

#### 右移

a >> n：将a的所有二进制位向右移动1为，等价于a / 2 的n次方

最高位符号位不动，中间空缺的位置使用符号位的值来补齐

 ####  数组

* 如果想在定义数组的同时进行初始化，数组元素个数必须是常量，或者不写

```c
int count = 5;
❌
int ages[count] = {10, 11, 12};
✅
int ages[count];
```

* 数组作为函数参数，可以省略元素个数

```c
void change(int args[]) 
{
	......  
}
```

* 数组作为函数参数，传递是整个数组的地址，修改函数形参数组元素的值，会影响到外面的实参数组

#### 字符串

初始化形式

```c
✅
char name1[8] = "it";
char name2[8] = {'i', 't', '\0'};
char name3[8] = {'i', 't', 0};
char name4[8] = {'i', 't'};
// 不算是一个字符串(只能说是一个字符数组)
❌
char name5[] = {'i', 't'};
```

#### strlen 函数

* 计算字符串的长度
* 计算的是字符数，并不是字数
* 计算的字符不包括\0
* 从某个地址开始数字符的个数，直到遇到\0为止

```c
#include <string.h>
char name[] = "itcast";
char name2[] = {'0', '6'};
int size = strlen(name2);
printf("%d\n", size);
// 输出：8,因为一直输出到name最后的\0为止
```

#### 指针

// 指向函数的指针

```c
void test() {}
// 左侧void：指针p指向的函数没有返回值
// 右侧()：指针p指向的函数没有形参
// 定义指向函数的指针
void (*p)() = test;
// 直接调用
test();
// 指针间接调用1
p();
// 指针间接调用2
(*p)();
```

#### 结构体 

* 这种赋值操作只能在结构体初始化时进行

```c
// 定义结构体类型
struct Person 
{		// 3个变量称为结构体的成员或者属性
		int age;
    double height;
    char *name;  
};
// 定义Person结构体变量p，并赋值
// ✅
struct Person p = {20, 1.55, "rose"};
struct Person p2 = {.height = 1.88, .name = "jim", .age = 30};
struct Person p3;
// ❌
p3 = {30, 1.55, "jake"};
```

* 分配存储空间时，是按顺序一次分配内部的所有成员
* 补齐算法(对齐算法)

结构体所占用的存储空间必须是最大成员字节数的倍数

```c
Struct Student 
{
  int  age; // 4个字节
  char *names; // 8个字节
};
struct Student stu;
sizeof(stu); // 16个字节
```

* 定义结构体变量的三种方式

1、先定义类型，再定义变量(分开定义)

```c 
struct Student
{
	int age;
};
struct Studrnt stu;
```

2、定义类型的同时定义变量

```c
struct Studrnt
{
  int age;
} stu;
struct Studrnt stu2;
```

3、定义类型的同时定义变量(省略了类型名称)

```c
struct 
{
  int age
} stu;
```

* 指向结构体的指针

```c
struct Person 
{
  int no;
  int age;
};
// 结构体变量
struct Student stu = {1, 20};
struct Student *p;
p = &Stu;

// 访问结构体成员的三种方法
// 第一种
stu.age
// 第二种
(*p).age
// 第三种
p->age
```

#### 预处理指令

* 宏定义

```c
// 定义形式
#define 宏名称 值
#define COUNT 4
// 中间部分是COUNT的有效作用域
// 表示宏定义的作用域截止
#undef COUNT  
```

```c
#define COUNT 10
int a  = COUNT;
#undef COUNT
// 此时COUNT已经无法在访问，因为作用域已经截止
int b = COUNT;
```

#### static和extern 区别

对函数的作用：

extern：声明和定义一个外部函数，外部函数能被本文件和其他文件访问

1> 默认情况下所有的函数都是外部函数

2> 不允许有同名的外部函数

static：声明和定义一个内部函数，内部函数只能被本文件访问，其他文件不能访问

1> 允许不同文件中有同名的内部函数

```c
// 完整地声明一个外部函数
extern void test();
// 默认情况下，所有的函数都是外部函数，所以可以省略extern
void test();
// 完整地定义一个外部函数
// 默认情况下，所有的函数都是外部函数，所以可以省略extern
extern void test()
{
  ...code...
}
```

```c
// 声明一个内部函数
static void test2();
// 定义一个内部函数
static void test2()
{
	....code....
} 
```

对变量的作用

* static：定义一个内部变量
* extern：声明一个外部变量

全局变量分为2种

* 外部变量：定义的变量能被本文件和其他文件访问

1> 默认情况下，所有的全局变量**都是**外部变量

2> 不同文件中的同名外部变量，都代表着同一个变量

* 内部变量：定义的变量**只能**被本文件访问，不能被其他文件访问

1> 不同文件中的同名内部变量，互不影响

```c
// 声明一个外部变量
extern int a;
int main()
{
  // 声明一个外部变量
  extern int a;
   a = 20;
}
// 定义一个外部变量
int a;
```

**static** 对局部变量作用

1> 延长**局部变量**的生命周期：程序结束的时候，局部变量才会被销毁

2> 并没有改变**局部变量**的作用域

3> 所有的test函数都共享着一个变量b

4> 使用场合：如果某个函数的调用频率特别高、这个函数内部的变量值是固定不变的

```c
void test()
{
  int a = 0;
  a++;
  
  static int b = 0;
  b++
}
```

