第三方库
1、AFNetworking

2、SDWebImageView
3、ReactiveCocoa
4、AsyncDisplaykit
5、Masonry
6、YY的一系列源码


AFURLSessionManager
子类
AFHTTPSessionMamanger

1、什么是信号？
信号就是一连串的状态

AsyncDisplayeKit
1、主要处理什么问题？
* Layout:文本宽高计算、视图布局计算
* Rendering：文本渲染、图片解码、图形绘制
* UIKit Objects:对象创建、对象调整、对象销毁
2、基本原理
* 针对ASNode的修改和提交，会对其进行封装并提交到一个全局容器中
* ASDK在Runloop中注册了一个observer
* 当Runloop在进入休眠前，ASDK执行该loop内提交的所有任务

AFNetworking的整体结构是怎么样的？
SDWebImage框架是怎么加载图片的？--LRU算法
RAC的信号订阅是什么意思？
ASDK实现原理是怎么样的？

