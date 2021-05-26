## const

#### 定义

* 是常量的意思，被其修改的变量不可修改

如果修饰的是类、结构体(的指针)，其成员也不可以修改

### 特点

* **const**修饰的其实右边的内容

### 代码示例

```c++
int age = 10;
const int *p0 = &age;
int const p1 = &age;
int * const p2 = &age;
const int * const p3 = &age;
int  const * const p4 = &age;
```



