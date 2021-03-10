## 继承

> 所谓继承，就是可以让子类拥有父类的所有成员(变量\函数)

* C++中没有像**Java**、**Objective-C**基类

```c++
struct Person {
	int m_age;
	void run() {
		cout << "Person::run()" << endl;
	}
};

struct Student : Person {
	int m_no;
	void study() {
		cout << "Student::study()" << endl;
	}
};

Student stu;
stu.m_age = 20;
stu.m_no = 1;
```

#### 对象内存布局

* 父类的成员变量在前，子类的成员变量在后