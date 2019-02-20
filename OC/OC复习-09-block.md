### Block

#### 本质

* 本质上是一个OC对象，封装了函数调用地址和环境

#### 原理

#### 类型

* NSGlobalBlock：没有访问auto变量
* NSStackBlock：访问了auto变量(要想验证需要在MRC环境下)
* NSMallocBlock：NSStackBlock调用copy
