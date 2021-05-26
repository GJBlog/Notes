## 静态成员(Static)

#### 定义

* 被**static**修饰的成员变量\函数，被称为静态成员
* 可以通过对象（对象.静态成员）、对象指针(对象指针->静态成员)、类访问(类名::静态成员)

#### 静态成员变量

* 存储在数据段(全局区，类似于全局变量)，整个程序运行过程中只有一份内存
* 对比全局变量，它可以设定访问权限(**public**、**protected**、**private**)，达到局部共享的目的
* 必须初始化，必须在类外边初始化，初始化时不能带**static**，如果类的声明和实现分离(在实现.cpp中初始化)

#### 静态成员函数

* 内部不能使用**this**指针(**this**指针只能在非静态成员函数内部)
* 不能是虚函数(虚函数只能是**非静态**成员函数)
* 内部不能访问**非静态**成员\函数，只能访问静态成员变量\函数
* **非静态**成员函数内部可以访问**静态**成员变量\函数
* 构造函数、析构函数不能是静态

* 当声明和实现分离时，实现部分不能带**static**

#### 实例

```c++
class Car {
  int m_price;
  static int ms_count;
public:
  static int getCount() {
    return ms_count;
  }
  Car(int price = 0) : m_price(price) {
    ms_count++;
  }
  ~Car() {
    ms_count--;
  }
};
int Car::ms_count = 0;
```

#### 应用-单例模式

```c++
class Rocket {
private:
  	Rocket() {}
	  ~Rocket() {}
	  static Rocket *ms_rocket;
public:
  	static Rocket *sharedRocket() {
      if (ms_rocket == NULL) {
        ms_rocket = new Rocket();
      }
      return ms_rocket;
    }
  	static void deleteRocket() {
    	if (ms_rocket != NULL) {
        delete ms_rocket;
        ms_rocket = NULL;
      }
  	}
};
```





