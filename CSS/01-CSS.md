## CSS



### CSS应用在元素上的三种方式

#### 内联样式(inline style)

* 直接将样式写在元素的`style`属性上

* `CSS`之间用`;`隔开
* `CSS`样式与`CSS`属性是同义词

```html
<div style="color: blue; background-color: red">我是一个div</div>
```

#### 文档样式表(document style sheet)

* 将样式写在`head`元素的`style`元素中

```html
<head>
    <meta charset="UTF-8">
    <title>CSS_01</title>
    <style>
        div {
            color: red;
        }
    </style>
</head>
```

* `style`的默认`type`属性值就是`test/css`，所以可以省略

#### 外部样式表(external style sheet)

* 将样式写在单独的`CSS`然后再当前网页的`head`元素中用`link`元素引用

```html
<link rel="stylesheet" href="css/page.css" />
```

* 在`CSS`文件中，建议一开始写上编码方式，以防止后续字体之类的属性值中涉及到汉字无法识别问题

```css
page.css文件
@charset "UTF-8";
div {
    color: blue;
    background-color: red;
}
```


* `link`的默认`type`属性值就是`test/css`，所以可以省略
* 不建议使用`@import`导入CSS文件，它的效率比`link`元素低

* 可以在`style`元素或者CSS文件中使用`@import`导入其他的`CSS`文件

```html
page.html文件
<head>
  <style>
    @import "CSS/page3.css";
    @import 'CSS/page3.css';
    @import url('CSS/page3.css');
    @import url("CSS/page3.css");
    @import url(css/page3.css);
  </style>
	<link rel="stylesheet" href="css/page.css"/>
</head>
```

```css
page.css文件
@charset "UTF-8";
@import "page2.css";
```

#### 网页图标

* `link`元素除了可以用来引入`CSS`文件，还可以设置网页的图标
* 通常可以省略`type`属性设置
* 网页图标支持的图片格式是`ico`  `png`，单位是像素，常用大小是16✖️16，24✖️24， 32✖️32

```html
<link rel="icon" type="image/x-icon" href="http://www.jd.com/favicon.icon"/>
<link rel="icon" href="http://www.jd.com/favicon.icon"/>
```

#### 最常用属性

* color：前景色(包括文字颜色)，设置文本内容的前景色，包括文字、装饰线、边框、外轮廓等颜色
* Background-color：背景色
* width：宽度
* height：高度
* Font-size：文字大小

