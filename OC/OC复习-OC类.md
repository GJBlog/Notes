## OC复习-OC类

### 代码

```objc
// 将OC代码转为C/C++源码
xcrun -sdk iphones clang -arch arm64 -rewrite-objc -framework UIKit

// 获得NSObject实例对象的成员变量所占用的大小：8字节
class_getInstanceSize([NSObject class]);

// 获取指针所指向内存的大小：16字节
NSObject *objc = [[NSObject alloc] init];
malloc_size((__bridge const void *)objc);

// 获取类的类对象
NSObject *obj1 = [[NSObject alloc] init];
NSObject *obj2 = [[NSObject alloc] init];
Class objClass1 = [obj1 class];
Class objClass2 = [obj2 class];
Class objClass3 = object_getClass(obj1);
Class objClass4 = object_getClass(obj2);
Class objClass5 = [NSObject class];

// 获取类的元类对象
objClass5：类对象
Class objMetaClass = object_getClass(objClass5);

// 判断是否是元类对象
objMetaClass：元类对象
class_isMetaClass(objMetaClass)
```

### 相关知识点

* 1个16进制数 = 4个二进制数

* 2个16进制数 = 8个二进制数 = 1个字节

* 1个字节 = 8个二进制数

* b: 1字节

* h: 2字节

* w: 4字节

* g: 8字节

* 内存对齐：结构体的大小必须是最大成员大小的倍数

* 内存大小端：
  
    * 大端模式：1、数据的高字节保存在内存的低地址中，2、数据的低字节保存在内存的高地址中
    * 小端模式：1、数据的高字节保存在内存的高地址中，2、数据的低字节保存在内存的低地址中
    * 在X86和一般的OS中(windows,FreeBSD,Linux)使用小端模式
    * Mac OSX 是大端模式, iOS 是小端模式

* OC 三种对象
  
    * instanced对象(实例对象)
        * isa指针
        * 成员变量
    * class对象(类对象),一个类的类对象在内存中只有一份
        * isa指针
        * superclass指针
        * 类的属性信息(property)
        * 类的对象方法信息(instanceMethod)
        * 类的协议信息(protocol)
        * 类的成员信息(描述信息)(ivar)
    * meta-class对象(元类对象)一个类的元类对象内存中只有一份
        * isa指针
        * superclass指针
        * 类的类方法信息
    
    查看Class是否为元类对象meta-class
    
    ```objective-c
    BOOL isMetaClass = class_isMetaClass(NSObject class)
    ```
    
    ```objective-c
    Class objc_getClass(const char *aClassName)
    // 1、传入的字符串类名
    // 2、返回对应的类对象
      
    Class _Nullable object_getClass(id _Nullable obj) 
    /*
    1、传入的obj可能是instance对象、class对象、metaclass对象
    2、返回值
    a) 如果是instance对象，返回class对象 
    b) 如果是class对象，返回meta-class对象
    c) 如果是meta-class对象，返回NSObject(基类)的 meta-class对象
    */
    - (Class)class、+ (Class)class
    /*
    返回的就是类对象
    */
    - (Class)class {
        return object_getClass(self);
    }
    
    Class object_getClass(id obj)
    {
        if (obj) return obj->getIsa();
        else return Nil;
    }
    
    + (Class)class {
        return self;
    }
    ```
    
    

### 面试题

#### 一个NSObject对象占用多少内存?

* 系统分配了16个字节给NSObject对象(通过```malloc_size```函数获得,且获得的是时机系统分配多少内存)
* 但是NSObject对象内部只是用了8个字节的空间(64位环境下，通过```class_getInstanceSize```函数获得,且获得的是至少需要多少内存)



