## 图层树

### CALayer-概述

* 每一个UIView都有一个CALayer实例的图层属性
* 所关联的CALayer才是真正用来在屏幕上显示和做动画
* 分为：视图层级、图层树、呈现树、渲染树
* 作用：阴影、圆角、颜色边框、3D变换、非矩形范围、透明遮罩、多级非线性动画

### CALayer-使用

* **contents**：理论上可以接受任何值，但是实际中，如果赋值的不是CGImage类型，则该Layer将是空白，更近一步说，要赋值的是**CGImageRef**类型

* **contentGravity**：对应于(UIImageView)UIView中的``conentMode``属性，目的是为了决定内容在图层的边界中如何对齐

* **contentsScale**：定义Backing Image中像素大小和视图大小的比例,如果设置了``contentGravity``则失效，对应于UIView中的``contentScaleFactor``属性

 **maskToBounds**：对应UIView中``clipsToBounds``属性

* **contentsRect**：设置在图层边框里面显示BackingImage的一个子区域，它使用Unit坐标，坐标指定在0到1之间，相对于BackingImage的尺寸

* **contentsCenter**：定义图层中可拉伸区域和一个固定的边框

* **CALayerDelegate**：当视图需要重绘时，CALayer会调用```(void)displayLayer:(CALayer *)layer;```;如果代理没有实现该方法，则CALayer会调用```- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;```方法

### CALayer-几何学

* CALayer中的``frame``,``bounds``,``position`` 分别对应了``UIView``中的``frame``,``bounds``,``center``
 - frame：图层外部坐标，在父图层中占据的位置和大小
 - bounds： 内部坐标，以自己图层的左上角为0,0
 - center/position：代表相对父图层anchorpoint所在的位置;
 - anchorPoint：它决定着CALayer身上的哪个点会在position所指定的位置上。它的x、y取值范围都是0~1，默认值为(0.5, 0.5)默认情况下，CALayer的中点会在position所指定的位置上
 - Z坐标轴：```zPosition```、```anchorPointZ```用于描述在z轴上图层的位置，```zPosition```主要用于改变图层的显示顺序
 - ```- (void)layoutSublayersOfLayer:(CALayer *)layer;``` 当图层的**bounds**被修改或者图层的```-setNeedsLayout```被调用时，该函数会被调用，用于手动重新调整布局子图层的大小

### CALayer-视觉效果

* 边框

    - ```borderWidth``` ,```borderColor```共同定义了图层边的绘制样式,该线被称为storke，沿着图层的Bounds绘制，同时包含图层的角
    - ```borderWidth```是以点为单位的定义边框粗细的浮点数，默认为0
    - ```borderColor```定义了边框的颜色，默认为黑色

* 阴影
    
    - ```shadowOpacity```：必须在0.0（不可见）和1.0（完全不透明）之间的浮点数，只要是一个大于默认值(0)的值，阴影就会显示在任意图层之下
    -  ```shadowColor```：控制着阴影的颜色，类型也是```CGColorRef```,默认黑色
    -  ```shadowOffset```：控制着阴影的方向和距离，类型是```CGSize```，```width```控制着阴影横向的位移，```height```控制着阴影纵向的位移,默认在iOS中是阴影向上，Mac上默认阴影向下
    -  ```shadowRadius```：模糊半径(以点为单位)用于渲染图层的阴影,控制着阴影的模糊度，当值为0时，阴影和视图一样有一个非常确定的边界线。默认值3.0

* 阴影裁剪

    - 阴影通常就是在Layer的边界之外，如果你开启了masksToBounds属性，所有从图层中突出来的内容都会被才剪掉；如果你既想裁切内容又想有阴影效果，你就需要用到两个图层：一个只画阴影的空的外图层，和一个用masksToBounds裁剪内容的内图层

* shadowPath

    - shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形。我们可以通过这个属性独立于图层形状之外指定阴影的形状。

* 图层蒙版

    - ```mask```属性：本身就是个CALayer类型，有和其他图层一样的绘制和布局属性。它类似于一个子图层，相对于父图层（即拥有该属性的图层）布局，但是它却不是一个普通的子图层。不同于那些绘制在父图层中的子图层，mask图层定义了父图层的部分可见区域。
    - CALayer蒙板图层真正厉害的地方在于蒙板图不局限于静态图。任何有图层构成的都可以作为mask属性，这意味着你的蒙板可以通过代码甚至是动画实时生成。

* 拉伸过滤

    - 当图片需要显示不同的大小的时候，有一种叫做拉伸过滤的算法就起到作用了。它作用于原图的像素上并根据需要生成新的像素显示在屏幕上。重绘图片并没有统一的通用算法，这取决于需要拉伸的内容，放大或是缩小的需求等这些因素。CALayer为此提供了三种拉伸过滤方法，它们是：

        * kCAFilterLinear(默认值)：采用双线性滤波算法，通过对多个像素取样最终生成新的值，但是缺点是放大倍数比较大时，图片就会模糊不清

        * kCAFilterNearest：最近过滤算法就是取样最近的单像素点而不管其他的颜色。这样做非常快，也不会使图片模糊。但是，最明显的效果就是，会使得压缩图片更糟，图片放大之后也显得块状或是马赛克严重。

        
        * kCAFilterTrilinear：三线性滤波算法算法存储了多个大小情况下的图片（也叫多重贴图），并三维取样，同时结合大图和小图的存储进而�得到最后的结果。该算法好处是在于算法能够从一系列已经接近于最终大小的图片中得到想要的结果，也就是说不要对很多像素同步取样。这不仅提高了性能，也避免了小概率因舍入错误引起的取样失灵的问题

        
    - ```minificationFilter```：缩小图片属性
    - ```magnificationFilter```：放大图片属性

    * 组透明

        - 视图的透明度会产生混合叠加效果，当你显示一个50%透明度的图层时，图层的每个像素都会一半显示自己的颜色，另一半显示图层下面的颜色。这是正常的透明度的表现。但是如果图层包含一个同样显示50%透明的子图层时，你所看到的视图，50%来自子视图，25%来了图层本身的颜色，另外的25%则来自背景色。

        - 理想状况下，当你设置了一个图层的透明度，你希望它包含的整个图层树像一个整体一样的透明效果。你可以通过如下设置：
            - 设置在iOS7及以后的版本中，默认```UIViewGroupOpacity```值为YES,在iOS6及以前的版本中，默认```UIViewGroupOpacity```值为NO

            - 设置CALayer的一个叫做```shouldRasterize```属性,为了启用shouldRasterize属性，我们设置了图层的rasterizationScale属性。默认情况下，所有图层拉伸都是1.0， 所以如果你使用了shouldRasterize属性，你就要确保你设置了rasterizationScale属性去匹配屏幕，以防止出现Retina屏幕像素化的问题。

        
### CALayer-变换

* 仿射变换
* 混合变换
* 剪切变换
* 3D变换
* 透视投影
* 灭点
* 背面
* 扁平化图层
* 固体对象
* 点击事件

### CAShapeLayer

* 是一个通过矢量图形而不是Bitmap来绘制的图层子类,你指定诸如颜色和线宽等属性，用CGPath来定义想要绘制的图形，最后CAShapeLayer就自动渲染出来了。当然，你也可以用Core Graphics直接向原始的CALyer的内容中绘制一个路径，相比之下，使用CAShapeLayer有以下一些优点:
    * **渲染快速**：CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
    * **高效使用内存**：一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存
    * **不会被图层边界剪裁掉**：一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉
    * **不会出现像素化**：当你把CAShapeLayer放大，或是用3D透视变换将其离相机更近时，它不像一个有寄宿图的普通图层一样变得像素化
* 创建CGPath

### CATextLayer

* 是CALayer的子类。它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。重点是比UILabel的渲染快很多

### CATransformLayer

### 隐藏动画

#### 事务

* 动画执行的时间取决于当前事务的设置，动画类型取决于图层行为。
* 事务实际上是Core Animation用来包含一系列属性动画集合的机制，任何用指定事务去改变可以做动画的图层属性都不会立刻发生变化，而是当事务一旦提交的时候开始用一个动画过渡到新值。
* 任何可以做动画的图层属性都会被添加到栈顶的事务，通过+setAnimationDuration:方法设置当前事务的动画时间，或者通过+animationDuration方法来获取时长值（默认0.25秒）

#### 图层行为

* 把改变属性时CAlayer自动应用的动画称为行为
* **隐式动画如何实现**：

    * 当CALayer的属性被修改时，它会调用actionForKey：方法，传递属性的名称。
    * 图层首先检测它是否有委托，并且是否实现CALayerDelegate协议指定的actionForLayer:forKey方法。如果有，直接调用并返回结果。
    * 如果没有委托，或者委托没有实现actionForLayer:forKey方法，图层接着检查包含属性名称对应行为映射的actions字典
    * 如果actions字典没有包含对应的属性，那么图层接着在它的style字典接着搜索属性名。
    * 最后，如果在style里面也找不到对应的行为，那么图层将会直接调用定义了每个属性的标准行为的-defaultActionForKey:方法。

```obj
    if (存在代理 && 实现actionForLayer:forKey) {
        return 结果；
    } else if(actions中是否包含对应的属性) {
        return 结果；
    } else if(actions中没有包含对应的属性) {
        return 结果；
    } else if(style字段中包含对应的属性) {
        return 结果；
    } else {
        return defaultActionForKey()
    }
```

### 显式动画

#### 属性动画

* CABasicAnimation
* CAKeyframeAnimation

#### 动画组

* CAAnimationGroup

#### 过度

* CATransition
* 对图层树的动画
    * 动画过程中不仅仅会涉及到图层的属性，而且是整个图层树的改变，需要手动在层级关系中添加或者移除图层。要确保

#### 动画代理(CAAnimationDelegate)


### 图层时间





#### CAMediaTiming协议

* 该协议定义了在一段动画内用来控制逝去时间的属性的集合

#### 属性

* repeatDuration：让动画重复一个指定的时间，而不是指定的次数，设置 INFINITY 可以让动画无限循环播放
* autoreverses：在每次间隔交替循环过程中自动回放
* repeatCount：设置 INFINITY 也可以让动画无限循环播放，但是不能同时指定 repeatDuration 和 repeatCount，可能会相互冲突
* beginTime：指定动画开始之前的延迟时间。延迟指从动画添加到可见图层的那一刻开始测量，默认为0，表示动画会立刻执行



##  第十章 Easing(缓冲)

### CAMedia TimingFunction

#### CAAnimation

```objc
// 线性的计时函数且是CAAnimation的timingFunction属性为nil的默认函数
kCAMediaTimingFunctionLinear 
// 开始慢慢加速然后突然停止的过程
kCAMediaTimingFunctionEaseIn
// 开始全速，然后慢慢减速到停止的过程
kCAMediaTimingFunctionEaseOut 
// 开始慢慢加速然后再慢慢减速的过程(UIView中是默认，CAMediaTimingFunction中不是)
kCAMediaTimingFunctionEaseInEaseOut
// 跟kCAMediaTimingFunctionEaseInEaseOut类似，但是加速跟减速的过程都稍微有些慢
kCAMediaTimingFunctionDefault
// 创建CAMediaTimingFunction
CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
```
#### UIView

```objc
// 默认值
UIViewAnimationOptionCurveEaseInOut 
UIViewAnimationOptionCurveEaseIn 
UIViewAnimationOptionCurveEaseOut 
UIViewAnimationOptionCurveLinear
```

##  第十一章 Timer-Based Animation(基于定时器的动画)





### 注意点

* 当图层显示在屏幕上时，CALayer并不会自动重回它的内容，它把重绘的任务交给开发者
* 使用CALayerDelegate绘制BackingImage图时不会对超出边界的内容提供绘制支持
* 当调用图层的```-hitTest:```方法时，测算的顺序严格依赖图层树当中图层的顺序,虽然```zPosition```可以改变屏幕上图层的顺序，但不能改变触摸事件被处理的顺序
* 边框并不会考虑寄宿图或子图层的形状,即使图层的子图层超过了边界，或者是寄宿图在透明区域有一个透明蒙板，边框仍然会沿着图层的边界绘制出来
* 对于大图来说，双线性滤波和三线性滤波表现得更出色
* 对于没有斜线的小图来说，最近过滤算法要好很多，线性过滤保留了形状，最近过滤则保留了像素的差异。
* 当然了，当```shouldRasterize```和```UIViewGroupOpacity```一起的时候，性能问题就出现了 !
 






1、位图图形上线文：允许你去画RGB颜色、CMYK颜色、灰阶到位图中，位图是像素的矩形阵列(或光栅)，每个像素表示图形中的一个点。位图图像也被称为采样图片
2、PDF图形上线文：允许你去创建一个PDF文件，在PDF文件中，你的绘图会被保存为一系列的指令。PDF跟位图的不同点：
(1)、跟位图不同，PDF文件可能包含多个页面
(2)、当你在不同的设备上从PDF文件中绘制页面时，生成的图像将根据该设备的显示特性进行优化。
(3)、PDF本身跟分辨路没有关系，在不牺牲图像细节的前提下，可以无限地增加或减少文件的大小。但是位图的用户感知的质量跟位图的显示分辨路有关
3、窗口图形上线文：是一个用户绘制到窗口的图形上下文，因为Quartz2D是一个图形引擎，而不是一个窗口管理系统，所以你可以使用任何其中一个应用程序框架来获取窗口的图形上下文。
4、图层上下文：是用另一种图形上下文来关联离屏渲染的目的，当绘制图层到图形上下文时，可以获得好的性能而被设计，对于离屏绘制，图层上下文被位图图形上下文是更好的选择
5、当你想在Mac上打印时，可以发送内容到由printing framework管理的PostScript图形上下文中


iOS中绘制上下文到View中步骤：
1、先创建UIView，实现drawRect:

100				100			0
position.x = frameX + w * archPointX;
100				0			1
position.y = frameY + h * archPointY;


使用drawRect有什么影响？

