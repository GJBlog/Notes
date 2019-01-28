# c++03-String类型

#### 1、使用

* 需要先导入头文件 

```c++
#include <string>
```

#### 2、字符串拼接

* 两个字符串变量可以通过+拼接，或者一个字符串变量 + 字符串常量

```c++
string s1 = "Hello";
string s2 = "world";
s1 + s2;
s1 + "world"
```

* 接收用户输入内容

```c++
getline(cin, 保存的字符串变量)
```

* 注意点：

    - 不允许两个字符串常量通过 + 连接
    - 格式

    ```c++
    string s1 = "hello" + "world" ❌
    ```

