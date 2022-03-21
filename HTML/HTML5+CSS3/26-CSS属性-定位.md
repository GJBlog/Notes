## CSS属性-定位

### CSS属性-position

* 利用position可以对元素进行定位，常用的取值有4个
  * static：静态定位
  * relative：相对定位
  * absolute：绝对定位
  * fixed：固定定位

#### relative定位

让一个元素进行相对定位的步骤

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

* 可以通过left、right、top、bottom 进行定位，定位参照对象是视口(viewport)
* 当画布滚动时，固定不动

