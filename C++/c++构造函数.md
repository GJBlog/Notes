## 构造函数(Constructor)

> 构造函数(也叫构造器)，在对象创建的时候自动调用，一般用于完成对象的初始化工作

#### 特点

* 1、函数与类同名，无返回值(Void都不能写)，可以有参数，可以重载，可以有多个构造函数
* 2、一旦定义了构造函数，必须使用其中一个自定义的构造函数来初始化对象

#### 构造函数调用

```c++
struct Person {
  int m_age;
  Person() {
    cout << "Person()" << endl;
  }
  Person(int age) {
    cout << "Person(int age)" << endl;
  }
};
```

#### 默认情况下，成员变量的初始化

```c++
struct Person {
  int m_age;
};
//TODO
```

* 如果自定义了构造函数，除了全局区，其他内存空间的成员变量默认都不会被初始化，需要开发人员手动初始化

#### 成员变量的初始化

* 对象初始化

```c++
Person() {
  memset(this, 0, sizeof(Person));
}
```

#### 注意

* 通过**malloc**分配的对象不会调用构造函数
* 在某些特定情况下，编译器才会为类生成空的无参的构造函数