## CSS属性-定位

### 标准流(Normal Flow)

* 默认情况下，元素都是安好normal flow (标准流、常规流、正常流、文档流[document flow])进行定位

  * 从上到下，从左到右顺序摆放好
  * 互相之间不存在层叠现象

![image-20220322002938654](/Users/guo/Notes/HTML/HTML5+CSS3/images/定位_标准流_01.png)

* 在标准流中，可以使用 margin、padding 对元素进行定位
  * 其中margin还可以设置负数
* 比较明显的缺点
  * 设置一个元素的margin或者padding，通常会影响到标准流中其他元素的定位效果
  * 不便于实现元素层叠的效果

### CSS属性-position

* 利用position可以对元素进行定位，常用的取值有4个
  * static：静态定位
  * relative：相对定位
  * absolute：绝对定位
  * fixed：固定定位

#### relative定位

* 元素按照 normal flow 布局
* 可以通过left、right、top、bottom进行定位
  * 定位参数对象是**元素自己原来的位置**
* left、right、top、bottom 用来设置元素的具体位置，对元素的作用如下图所示

![image-20220322003829464](/Users/guo/Notes/HTML/HTML5+CSS3/images/定位_relative_01.png)

* **应用场景**
  * 在不影响其他元素位置的前提下，对当前元素位置进行微调

**让一个元素进行相对定位的步骤**

1、设置position：relative;

2、相对定位的参数对象：元素自己原来的位置

3、通过left、right、top、bottom 对元素进行精准的定位

4、进行相对定位的元素还在标准流当中(原来占据的空间还在)

#### static 定位

position属性的默认值

元素按照normal flow布局

left、right、top、bottom 没有任何作用

#### fixed 固定定位

* 元素脱离normal flow (脱离标准流、脱标)
* 可以通过left、right、top、bottom 进行定位
  * 定位参照对象是视口(viewport)

* 当画布滚动时，固定不动

##### 画布和视口

* 视口(ViewPort)
  *  文档的可视区域
  * 如右图红框所示
* 画布(Canvas)
  * 用于渲染文档的区域
  * 文档内容好处视口范围，可以通过滚动查看
  * 如还有图黑框所示
* 宽高对比
  * 画布>=视口

![image-20220322004648758](/Users/guo/Notes/HTML/HTML5+CSS3/images/定位_画布视口_01.png)

#### 脱标元素的特点

* 可以随意设置宽高
* 宽高默认由内容决定
* 不再受标准流的约束
  * 不再严格按照从上到下、从左到右排布
  * 不再严格区分块级、行内级，块级、行内级的很多特性都会消失
* 不再给父元素汇报宽度数据
* 脱标元素内部默认还是按照标准流布局

#### absolute 绝对定位

* 元素脱离normal flow (脱离标准流、脱标)
* 可以通过left、right、top、bottom 进行定位
  * 定位参照对象是最邻近的定位祖先元素
  * 如果找不到这样的祖先元素，参照对象是视口
* 定位元素(positioned element)
  * position值不为static的元素
  * 也就是position值为relative、absolute、fixed的元素

##### 绝对定位技巧

![image-20220323014314497](/Users/guo/Notes/HTML/HTML5+CSS3/images/定位_绝对定位元素.png)

#### 子绝父相

* 在大多数情况下，子元素的绝对定位都是相对于父元素进行定位
* 如果希望子元素相对于父元素进行定位，又不希望父元素脱标，常用的解决方案是：
  * 父元素设置position：relative
  * 子元素设置position：absolute
  * 简称为"子绝父相"
