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
* NSStackBlock：访问了auto变量(要想验证需要在MRC环境下)
* NSMallocBlock：NSStackBlock调用copy
