数据结构 + 计算机网络 + 计算机操作系统

推导大O阶：
1．用常数1取代运行时间中的所有加法常数。
2．在修改后的运行次数函数中，只保留最高阶项。
3．如果最高阶项存在且不是1，则去除与这个项相乘的常数。

+load
1、先调用类的+load方法(
a、先编译的先调用，
b、如果存在父类，先调用父类的+load,再调用子类的+load)
2、在调用Category+load方法(
1、先编译，先调用)


数组元素 = data + cur(next)(游标)



[super message]
1、消息接收者仍然是子类对象
2、从父类开始查找方法的实现

objc_msgSuper(__rw_objc_super{消息接收者, 消息接收者的父类}, @selector(message));


NSProxy

局部变量分配在栈空间
栈空间分配，从高地址到低地址
栈空间分配问题

Runloop下的所有模式

UITrackingRunLoopMode,
GSEventReceiveRunLoopMode,
kCFRunLoopDefaultMode,
kCFRunLoopCommonModes

控制线程生命周期(线程保活)
解决NSTimer在滑动卡顿


并发队列：同时执行
串行队列：按照顺序一个一个执行
主队列  ：是一种特殊的串行队列，在主线程执行

dispatch_sync、dispatch_async 用来控制是否要开启新的线程
queue：队列的性质，决定了任务的执行方式（并发、串行）

只要是sync,无论是什么队列一定不会开启新线程，且串行执行任务
如果是async,在并发队列中，会开启新线程，且并发执行
如果是async,在串行队列中，会开启新线程，且串行执行
如果是async,在主队列中，不会开启新线程，且串行执行，在主线程中执行

dispatch_async：立马在当前线程同步执行任务
dispatch_sync：不要求立马在当前线程同步执行任务


线程同步技术：
1、加锁(
OSSpinLock:自旋锁
OS_unfair_lock
pthread_mutex
dispatch_semaphore
dispatch_queue(DISPATCH_QUEUE_SERIAL)
NSLock 对 pthread_mutex的封装
NSRecursiveLock 对 pthread_mutex的封装
NSCondition
NSConditionLock
@synchronized
)

时间片轮转调度算法(进程、线程)

dispatch_semaphore:

你理解的多线程

iOS读写安全
多读单写


堆区
栈区
常量区
代码区
全局区

低	
|	保留
|	代码段：编译之后的代码
|	数据段：
		字符串常量
		已初始化数据：已初始化的全局变量、静态变量
		未初始化数据：未初始化的全局变量、静态变量
|	堆：通过alloc、malloc、calloc等动态分配的空间，越来越大
|	栈：函数调用开销，越来越小
|	内核区
高


浅拷贝：指针拷贝，未产生新对象
深拷贝：内容拷贝，产生新对象

ARC：LLVM编译器 + Runtime系统相互协作的一个结果

电信天翼宽带密码：r7x2wzck


Mac OS 从OS 10.8开始正式废除 garbage collector (垃圾收集器)

什么是响应者链条？
1>响应者链条是由多个响应者对象(能够处理事件的对象)连接起来的链条
2>利用响应者链条能让多个控件处理同一个触摸事件
3>如果当前这个View是控制器的view,那么控制器就是上一个响应者
4>如果当前的这个View不是控制器的view，那么父控件就是上一个响应者

View的完整显示过程：
1>view.layer会准备一个Layer Graphics Context(图层类型的上线文)
2>调用view.layer.delegate(view本身)的drawLayer:context方法，并传入刚刚准备好的图层类型上下文
3>view的drawLayer:context方法内部又会调用view的drawRect:context方法
4>view就可以在drawLayer:context方法中实现绘图代码，所有东西最终都绘制到view.layer上面
5>系统再将view.layer的内容拷贝到屏幕上，于是完成了view的显示

Static的作用：
1、修改局部变量：
1>让局部变量只初始化一次
2>局部变量在程序中只有一份内存
3>并不会改变局部变量的作用域，仅仅改变了局部变量的生命周期(直到程序结束，这个局部变量才会被销毁)

2、修改全局变量
1>全局变量的作用域仅仅限于当前文件

单独的线程通信方式：
1、NsPort
2、NSMessagePort
3、NsMachPort


runtime名称：
OC是一门动态性比较强的编程语言，允许很多操作推迟到程序运行时再进行
OC的动态性就是由Runtime来支撑和实现的，Runtime是一套C语言的Api，封装很多动态性相关的函数
平时编写的OC代码，底层都是转换成了RuntimeApi进行调用


runtime作用
1、关联对象，给分类添加属性
2、遍历类的所有成员变量(访问私有成员变量，字典转模型，自动归档解档)
3、交换方法
4、利用消息转发机制解决方法找不到的异常问题


MVP
VIPER
CDD


//co    variant  ：协变的、协商的 ===> 泛型中小类型到泛型中的大类型
//contravariant  ：逆变的、反变的 ===> 泛型中大类型到泛型中的小类型

自动释放池的实现：
1、自动释放池是以栈的形式实现：当你创建一个新的自动释放池时，它将添加到栈顶，当一个对象收到发送autorelease消息时，它会被添加到当前线程的处于栈顶的自动释放池中，当自动释放池被回收时，它们从栈中被删除，并且会给池子里面所有的对象都会做一次release操作

数据库的事务
1、并发数据库的访问
2、系统错误恢复
什么是事务：1、被看做是一个单元的一系列SQL语句集合
特性
1、必须是原子工作单元
2、一致性
3、隔离性
4、持久性
事务隔离的实现-锁
1、共享锁
2、更新所
3、独占锁



网络：结点 + 链路
主机host：连接在互联网上的计算机
apranet
ISP：Internet Service Provider：因特网服务提供者(商)
NAP：网络接入点
RFC：Request For Comments,请求评论

报文(message)是网络中交换与传输的数据单元，即站点一次性要发送的数据块。报文包含了将要发送的完整的数据信息，其长短很不一致，长度不限且可变。

OSI(RM):开放系统互联基本参考模型：Open Systems Interconnection Reference Model
7层体系机构
应用层
表示层
会话层
运输层
网络层
数据链路层
物理层

TCP/IP的4层体系结构
应用层
运输层
网际层
网络接口层

5层协议体系结构
应用层：HTTP
运输层(传输层)：TCP、UDP，传送的协议数据单元叫做报文段
网络层(网际层)：IP协议，协议数据单元：IP数据报/数据报/分组/包
数据链路层：传输单元：帧,帧= 帧首部 + 帧数据部分(长度上限(又被称为最大传送单元MTU)) + 帧尾部
物理层：传输数据比特流，一般是串行传输，逐个比特按照时间顺序传输


网络互相连接的中间设备：
1、物理层使用的中间设备：转发器
2、数据链路层的中间设备：网桥或桥接器
3、网络层的中间设备：路由器
4、在网络层以上使用的中间设备叫网关


TCP：TCP报文段
特点：面向连接、提供可靠交付服务、提供全双工通信、面向字节流
每一条TCP连接都有两个端点，该端点就叫套接字(插口)Socket
一个Socket = IP : 端口号
例如：192.1.3.4：80 就是一个套接字

可靠传输的原理
1、停止等待协议：
(1)、停止等待就是每发送完一个分组就停止发送，等待对方的确认，在收到确认后在发送下一个分组


UDP：UDP用户数据报
特点是：无连接、尽最大努力交付、面向报文、无拥塞控制、支持一对一、一对多、多对一、多对多的交互通信、首部开销小(只有8个字节)



1、HTTP底层是通过socket建立连接通信管道，实现数据传输
2、HTTP是一个TCP的传输协议(方式)，它是一个可靠、安全的协议


