## CSS-属性-字体

### font-size

> 决定文字的大小
>
> 一般给`body`设置`font-size`就代表设置网页的默认字体大小，其他元素可以基于父元素设置字体大小，这样到时候只需要改变`body`的字体大小，其他元素都会按照比例改变
>
> 常用的设置

* 具体数值+单位

```css
px：100px
em：1em代表100%,2em代表200%，0.5em代表50%
```

* 百分比

```css
基于父元素的font-size计算，50%表示等于父元素的font-size的一半
```

### font-family

> 用于设置文字的字体名称

* 可以设置1个或者多个字体名称(从做到右按顺序选择字体，直到找到可用的字体为止)，如果一个字体有多个单词或者是文字字体才需要加`""`

```css
font-family："微软雅黑", XXX, XXX;
```

* 一般情况下，英文字体只适用于英文，中文字体同时适应于英文和中文，通常如果希望中英文分别使用不同的字体，应该先将英文字体写在最前面，中文字体写在后面

### @font-face

> 可以让网页支持网络字体，不在局限于系统自带的字体

* 常见的字体种类 
  *  `TrueType` 字体，拓展名：`.ttf`
  *  `OpenType` 字体 ，拓展名：`.ttf`、`.otf`，建立在`TrueType`字体之上
  *  `Embedded OpenType`  字体，拓展名：`.eot`，`OpenType` 字体的压缩版
  *  `SVG` 字体，拓展名：`.svg`、`.svgz`
  * `Web` 开放字体，拓展名：`.woff`，建立在`TrueType`字体之上
* 字体下载：[地址](http://font.chinaz.com)

```css
style {
  /* 加载字体文件 */
  @font-face {
    /* 设置字体文件位置 */
    src: url("fonts/naughty-lite-2.ttf"),
      	 url("XXX");
    /* 自定义字体名称 */
    font-family: "fontName";
  }
  div {
    font-family: fontName;
  }
}
```

### font-weight

> 设置文字的粗细(重量)

```css
100|200|300|400|500|600|700|800|900：每一个数字表示一个重量
normal：等于400
bold：等于700
```

### font-style

> 设置文字的常规、斜体显示

* 取值

```css
normal：常规显示
italic：用字体的斜体显示(如果字体不包含斜体，则没有效果)
oblique：文本倾斜显示(不管字体是否包含斜体，都有效果)
```

### font-variant

> 可以影响小写字母的显示形式
>
> 取值如下

```css
normal：常规显示
small-caps：将小写字母替换为缩小过的大写字母
```



