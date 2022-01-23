## CSS

### 什么是CSS?

* CSS的作用是：可以给网页中的每一个元素设置样式，让网页更精美
* CSS的全称：Cascading  Style Sheets 层叠样式表

##### CSS样式书写格式

* 冒号：左边是样式名，冒号：右边是样式值

```css
color: red
```

##### CSS 提供3种方式将CSS样式添加到元素上

* 内联样式( inline style)
* 文档样式表 ( document style sheet) | 内嵌样式表(embed Style Sheet)
* 外部样式表 (external style sheet)

#### 内联样式( inline Style)

* 将样式直接写在元素的**style**属性上

```css
<div style="color: red; background-color: blue;">文字内容</div>
```

* CSS样式之间使用分号`;`隔开，建议每条CSS样式后面都加上分号`;`

#### 文档样式表

* 将样式写在`head`元素的`style`元素中

```css
<head>
    <meta charset="UTF-8">
    <title>02-文档样式表</title>
    <style type="text/css">
        div {
            color: blue;
            background-color: red;
            font-size: 30px;
        }
    </style>
</head>
```

* `style`元素的`type`属性值默认是`text/css`，可以省略

#### 外部样式表

* 将样式写在单独的`CSS`文件中，然后在当前网页中`head`元素中用`href`元素引用

```html
<link rel="stylesheet" href="" >
```

* `link`元素中`type`属性值默认是`text/css`， 可以省略

##### 指定编码格式

* 在`CSS`文件中使用`@charset`指定文件编码，一般都是`UTF-8`

```css
@charset "UTF-8";

div {
    color: gray;
    background-color: red;
    font-size: 30px;
}
```

##### 导入文件

* 可以在`style`元素或者`CSS`文件中使用`@import`导入其他的`CSS`文件

* 第一种写法，在HTML中

```html
<style>
  @import "test.css"
  @import url("index.css")
</style>
```

* 第二种写法，在CSS文件中

```css
@charset "UTF-8";

@import "page.css";
@import url("page2.css");
```

* 不建议使用`@import`导入`CSS`文件，它的效率比`link`元素低

#### 细节

* 文档样式表、外部样式表可以针对一对元素，故称为样式表
* 内联样式表只针对某个特定的元素

#### 注释

* `CSS`的注释写法如下

```css
div {
  /* 这是一段CSS注释  */
}
```

* 不支持注释嵌套

#### HTML和CSS编写准则

* 结构和样式分离

* 不要使用`HTML`元素的属性里给元素添加样式，比如`body`的`bgcolor`，`img`元素的`width`、`height`等
* 以下是不建议的写法

```html
<body bgcolor="red">
  <img src="" alt="">
</body>
```

* 以下是建议写法

HTML页面

```html
<body>
  <img src"" alt="">
</body>
```

CSS页面

```css
body {
 	background-color: red;
}
img {
  width: 300px;
  height: 409px;
}
```

#### 设置网页图标

* `link`元素除了可以用来设置CSS文件，还可以设置网页的图标
* 写法如下

```html
<link rel="icon" href="images/good_code_icon.png">
```

* `link`元素的rel属性不能省略，用来指定文档与链接资源的关系
* 一般rel若确定，相应的type属性也会默认确定，所以可以省略type属性
* 网页图标支持的图片格式是`ico`、`png`，常用大小是16`*`16，24`*`24，32`*`32，单位像素

### 常用CSS属性

> 如下所示

![image-20220116183722111](/Users/guo/Notes/HTML/HTML5+CSS3/images/css_常用属性_01.png)

**<font color="red">所有CSS的属性都是小写</font>**

#### color

* 设置文本内容的前景色，包括文字、装饰线、边框、外轮廓等的颜色

#### background-color

* 设置背景色

#### width：宽度

* 撒打发斯蒂芬

#### height：高度

* 撒打发斯蒂芬

#### Fornt-size

* 文字大小

#### float

> 浮动，让元素向某个方向浮动

```css
div {
  float: left;
}
```

#### margin

> 设置外边距，元素与元素之间的间距

#### 颜色

> 有如下几种表示方式

##### 基本颜色关键字

* 只提供上百种基本颜色的关键字(例如：`red`，`green`，`yellow`，`black`等等)

```css
span {
  color: red:
}
```

##### RGB颜色

* 十进制颜色：**rgb(red,green,blue)**

每种颜色的取值范围0 ~ 255

```css
div {
  /* 系统会自动转为 (255, 0，0) */
  color: rgb(300, 0, 0);
}
```

```css
div {
  /* 100%等于255, 0% 等于0*/
  color: rgb(100%, 0%, 0%);
}
```

```css
div {
  /* 系统会自动转为 (255, 0，0) */
  color: rgb(300, -10, 0);
}
```

```css
div {
  /* 系统会自动转为 (51, 102，255),会将X%乘以255  */
  color: rgb(20%, 40%, 255);
}
```

* 十六进制颜色：**#rrggbb**、**#rgb**
* #rgb 会被转化成#rrggbb
* 尽量使用#rgb取代#rrggbb，可以缩减CSS代码的体积，从而减小文件大小
* 颜色规律
  * RGB颜色值越大，越靠近白色，越浅色
  * RGB颜色值越小，越靠近黑色，越深色
  * RGB颜色值一样的，一般是灰色


##### RGBA颜色

> RGBA在RGB颜色的基础上加了个alpha，实现带有透明度的颜色

* **rgba(red, green, blue, alpha)**

* alpha：取值范围是0.0 ~ 1.0，0表示完成透明，1表示完全不透明
* 关键字`transparent`等价于rgba(0, 0, 0, 0)，完全透明
