### C++成员访问权限

---

#### 成员访问权限、继承方式有三种

* public：公共的，任何地方都可以访问(struct默认)
* protected:子类内部、当前类内部可以访问
* private:私有的，只有当前类内部可以访问(class默认)

#### 子类内部访问父类成员的权限，是以下2项权限中最小的那个

* 成员本身的访问权限
* 上一级父类的继承方式

#### 注意点

* 开发中用的最多的继承方式是public，这样能保留父类原来的成员访问权限
* 访问权限不影响对象的内存布局

