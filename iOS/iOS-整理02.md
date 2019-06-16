面试题总结

Runloop
自动释放池什么时候释放？
//1、在Runloop睡眠之前释放
2、KCFRunLoopEntry; 创建一个自动释放池
3、KCFRunLoopBeforeWaiting;销毁自动释放池，创建一个新的自动释放池
4、KCFRunloopExit;销毁自动释放池

什么是runloop？
1、从字面意思看：运行循环、跑圈
2、其实它内部就是do-while循环，在循环内部不断处理各种任务(比如：Source、Timer、Observer)
3、一个线程对应一个Runloop,主线程的Runloop默认已经启动，子线程的Runloop需要手动启动(调用Run方法)
4、Runloop只能选择一个Mode启动，如果当前Mode中没有任何Source(Sources0、Sources1)、Timer,那么就直接退出Runloop

你在开发过程中怎么使用Runloop？
1、开启一个常驻线程(线程保活，让一个子线程不进入消亡状态，等待其他线程发来消息，处理其他事件)
>1、在子线程中开启一个定时器
>2、在子线程中进行一些长期监控
2、可以控制定时器在哪种模式下运行
3、可以让某些事件(行为、任务)在特定模式下运行
4、可以添加Observer监听Runloop的状态，比如监听点击事情的处理(在所有点击事件之前做一些事情)

如何实现一个框架提供别人使用，需要考虑什么？
1、提供给外界的接口功能是否实用，够用
2、别人使用我的框架时，能不能根据类名、方法名就猜出接口的具体作用
3、别人调用接口时，提供的的参数够不够用，调用起来是否简单
4、别人使用我的框架时，要不要在导入依赖其他的框架


1、UI事件传递机制是怎么实现的？你对其中运用到的设计模式是怎么理解的？
答：责任链模式

"bytes=1-100"

结论：

1、position是layer中的anchorPoint在superLayer中的位置坐标。 
2、互不影响原则：单独修改position与anchorPoint中任何一个属性都不影响另一个属性。 
3、frame、position与anchorPoint有以下关系：

frame.origin.x = position.x - anchorPoint.x * bounds.size.width；  
frame.origin.y = position.y - anchorPoint.y * bounds.size.height；  

触摸事件的处理
1、判断触摸点在谁身上，调用所有UI控件的：- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
2、pointInside返回YES的控件就是触摸点所在UI控件
3、由触摸点所在的UI控件选出处理事件的UI控件，调用： - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event


链接：http://pan.baidu.com/s/1hseQ95y 密码：fqg6
解压密码：www.mukedaba.com

u1ku.taobao.com

CocoaLumberjack


1秒钟刷新 60FPS = 60 次
1000 ms = 60 次
16.7ms = 1次
在一次帧数更新的时间范围内没有完成CPU + GPU共同完成下一帧画面的合成

滑动优化方案
1、CPU：子线程：(对象创建、调整、销毁)、预排版（布局计算、文本计算)、预渲染(文本等异步绘制、图片编解码)
2、GPU：纹理渲染、视图混合
UIView绘制原理
[UIView setNeedDisplay]-> [view.layer setNeedsDisplay] -> [CALayer display] -> layer.delete

异步绘制
1、[layer.delegate displayer]
1>代理负责生成对应的bitmap
2、设置该bitmap作为layer.contents属性的值

在屏渲染：On-Screen Rendering 	当前屏幕渲染，指的是GPU的渲染操作是在当前用于显示的屏幕缓冲区中进行
离屏渲染：Off-Screen Rendering	离屏渲染，指的是GPU在当前屏幕缓冲区以外新开辟一个缓冲区进行渲染操作
如何触发离屏渲染
1、圆角(需要和maskToBounds一起使用时)
2、图层蒙版
3、阴影
4、光栅化
为何要避免
1、在触发离屏渲染时，会增加GPU的工作量，增加GPU的工作量很可能会导致CPU+GPU的工作总耗时加起来超过16.7ms,那么就有可能造成UI的卡段和掉帧

UIView和CALayer之间的关系
1、UIView专门负责事件传递、事件响应
2、CALayer专门负责UI视图的显示工作
3、用到了单一职责原则

分类特点
1、在运行时才会添加到当前类中
2、可以为系统添加分类
扩展特点
1、编译时就添加到当前类中
2、只以声明的形式存在，多数情况下寄生于宿主类的.m中
3、不能为系统类添加扩展

关联对象的本质
1、关联对象由 AssociationsManager 管理并在 AssociationsHashMap 存储
2、所有对象的关联内容都在同一个全局容器中

AssociationsManager
AssociationsHashMap
ObjectAssociationMap
ObjectAssociation


ObjcAssociation：是将具体的value、policy 包装称为 ObjcAssociation 类型
ObjectAssociationMap <(void *)， (ObjcAssociation)>
AssociationsHashMap  <地址(obj), ObjectAssociationMap>
AssociationsManager： AssociationsHashMap

KVO： Key-Value-Observing,俗称键值监听
1、KVO是OC对观察者设计模式的一种实现
2、Apple使用isa混写(isa-swizzling)来实现KVO

KVC：Key-Value-Coding
1>调用setValue:forKey:原理
1、先会按照setKey:方法寻找，如果没有会找_setKey:方法，如果找直接赋值结束
2、调用accessInstanceVariablesDirectly方法，默认返回YES,如果返回NO，则报错，setValueForUndefinedKey:
3、如果返回YES，会按照_key，_isKey,key, isKey找成员变量
2>调用valueForKe:原理
1、

automaticallyNotifiesObserversForKey


属性关键字：
1、原子性：
atomic：赋值、获取线程安全，加锁

ARC是LLVM编译器和Runtime系统相互协作的结果



