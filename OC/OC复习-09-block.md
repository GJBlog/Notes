### Block

#### 本质

* 本质上是一个OC对象，封装了函数调用地址和环境

#### 内部结构

```objc
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    ....(variables)
}
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
}
struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
}
```


####  变量捕获

* 局部变量：被捕获到block内部
    * auto：自动变量，离开作用域就会销毁，默认的局部变量是auto变量，向block中值传
    * static：静态变量,向block中传递地址
* 全局变量：不会被block捕获，在block中直接访问变量名

#### 类型

* __NSGlobalBlock__：没有访问auto变量
* __NSStackBlock__：访问了auto变量(要想验证需要在MRC环境下)
* __NSMallocBlock__：NSStackBlock调用copy

#### 修改block中变量

* 变量添加static

```objc
static int age = 10;
```

* 修改变量为全局变量

```objc
 int age = 10;
```

* 变量添加__block,不能修饰全局变量和静态变量

```objc
__block int age = 20;
```

#### 解决循环引用

在ARC中

* 使用**__weak**

```objc
__weak GJPerson *person;
```

* 使用**__unsafe_unretained**

```objc
__unsafe_unretained GJPerson *person;
```

* 使用**__block**

```objc
__block GJPerson *person;
```

在MRC中

