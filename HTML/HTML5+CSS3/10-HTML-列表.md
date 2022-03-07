## d列表

> HTML中提供3组常用的用来展示列表的元素

### 有序列表：ol、li

* ol(ordered list)

有序列表，直接子元素只能是li

* li(list item)

列表中的每一项

### 无序列表：ul、li

* ul(unordered list)

无序列表，直接子元素只能是li

* li(list item)
* 列表中的每一项

### 定义列表：dl、dt、dd

* dl(definition list)

定义列表，直接子元素只能是dt、dd

* dt(definition term)

列表中每一项的项目名

* dd(definition description)

列表中每一项的具体描述，是对dt的描述、解释、补充

一个dt后面一般紧跟着1个或者多个dd

* dt、dd常见的组合
  * 事务的名称、事物的描述
  * 问题、答案
  * 类别名、归属这类的各种事物

### 列表相关的CSS属性

列表相关的常见CSS属性有4个：list-style-type、list-style-image、list-style-position、list-style

适用于display设置为list-item的元素，比如**li**元素

他们都可以继承，所以设置**ol**、**ul**元素，默认也会应用到**li**元素

##### list-style-type：设置li元素前面标记的样式

* disc(实心圆)、circle(空心圆)、square(实心方块)
* decimal(阿拉伯数字)、lower-roman(小写罗马数字)、upper-roman(大写罗马数字)
* lower-alpha(小写英文字母)、upper-alpha(大写英文字母)
* none：什么也没有

##### list-style-image：设置某张图片为li元素前面的标记，会覆盖list-style-type的设置

##### list-style-position：设置li元素前面标记的位置，可以取outside、inside2个值

##### list-style：是list-style-type、list-style-image、list-style-postion的缩写属性

* **list-style**：**outside url("路径")**
* 一般最长用的还是设置为**none**，去掉li元素前面的默认标记**list-style: none;**