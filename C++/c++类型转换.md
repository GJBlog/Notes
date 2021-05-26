## 类型转换

#### C语言风格的类型转换符

* (type)expression
* type(expression)

#### C++中有四个类型转换符

分别是：**static_cast**、**dynamic_cast**、**reinterpret_cast**、**const_cast**

使用格式：**xx_cast<type>(expression)**

#### const_cast

* 一般用于去除**const**属性,将**const**转换成非**const**

```c++
class Person {
  int m_age;
};
const Person *p1 = new Person();
p1->m_age = 10;

Person *p2 = const<Person *>(p1);
p2->m_age = 20;
```

#### dynamic_cast

* 一般用于多天类型的转换，有运行时安全检测

```c++
class Person {
  virtual void run() {}
}
class Stuent: public Person {};
class Car {};
```

```c++
Person *p1 = new Person();
Person *p2 = new Person();

Student *stu1 = dynamic_cast<Student *>(p1);
Student *stu2 = dynamic_cast<Student *>(p2);
Car *car = dynamic_cast<Car *>(p1);
```

#### static_cast

* 对比**dynamic_cast**，缺少运行时安全检测
* 不能交叉转换(不是同一个类型/继承体系的，无法转换)
* 常用于基本数据类型的转换，非const转成const
* 适用范围更多(多数情况下，默认的隐式转换就等价于使用**static_cast**)

```c++
Person *p1 = new Person();
Person *p2 = new Person();
Student *stu1 = static_cast<Student *>(p1);
Student *stu2 = static_cast<Student *>(p2);
Car *car = static_cast<Student *>(p1);
```

#### reinterpret_cast

* 属于比较底层的强制转换，没有任何类型检查和格式转换，仅仅是简单的二进制数据拷贝
* 可以交叉转换
* 可以将指针和整数互相转换

