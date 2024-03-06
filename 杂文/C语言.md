## C 语言

#### 语法注意点

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

