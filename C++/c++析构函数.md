## 析构函数(Destructor)

> 析构函数(也叫析构器)，在对象销毁的时候自动调用，一般用于完成对象的清理工作

#### 特点

* 函数名以**~**开头，与类同名，无返回值(**void**都不能写)，无参，不可以重载，有且只有一个析构函数

```c++
struct Car {
  int m_price;
};
struct Person {
  int m_age;
  Car *m_car;
  // 构造函数
  Person() {
    m_car = new Car();
  }
  // 析构函数
  ~Person() {
    delete m_car;
  }
};

Person *p = new Person();
```

#### 原则

* 对象内部申请的堆空间，有对象内部回收

#### 注意

* 通过**malloc**分配的对象**free**说的时候不会调用析构函数
* 构造函数、析构函数要声明为**public**吗，才能被外界正常使用