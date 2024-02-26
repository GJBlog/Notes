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

