## CSS属性-字体

### font-size

> 决定文字的大小

#### 常用的设置

* 具体数值 + 单位

```css
100px
也可以使用em单位：1em代表100%，2em代表200%，0.5em代表50%
```

* 百分比

基于父元素的`font-size`计算，比如50%表示等于父元素的`font-size`的一半

#### 注意点

* 给`body`设置`font-size`就代表设置网页的默认字体大小
* 其他元素可以基于父元素设置字体大小
* 到时候只需要改变body的字体大小，其他元素都会按照比例改变

### font-family

> 用于设置文字的字体名称

* 可以设置1个或者多个字体名称(从左到右按顺序选择字体，直到找到可用的字体为止)

* 一般情况下，英文字体只适用于英文，中文字体同时适用于英文和中文，所以如果希望中英文分别适用不同的字体，应该先将英文字体写在前面，中文字体写在后面

```css
div {
  font-family："Courier New", "华文彩云";
}
```

### font-face

> 可以让网页支持网络字体，不再局限于系统自带的字体

#### 常见的字体种类

* TrueType 字体：拓展名是.ttf
* OpenType 字体：拓展名是 .ttf，otf，建立在TrueType字体之上
* Embedded OpenType 字体，拓展名是.eot，OpenType字体的压缩版
* SVG字体，拓展名是.svg，.svgz
* web开放字体：拓展名是.woff，建立在TrueType字体之上
* [字体下载地址](http:.//font.chinaz.com)

```css
<style>
    @font-face {
        /* 浏览器会按照顺序加载每一个字体文件，直到找到它支持的字体 */
        src: url("fonts/HanChengQingFengYue-2.ttf"),
	           url("fonts/HanChengQingFengYue-2.ttf");
        /* 字体名称，可以随便写，最好跟字体名称一致 */
        font-family: "GJFont";
    }
    div {
        font-family: "GJFont";
    }
</style>
```

### font-weight

> 用于设置文字的粗细(重量)

取值范围(从轻到重)

100、200、300、400、500、600、700、800、900

normal：等于400

bold：等于700

### font-style

> 用于设置文字的常规、斜体显示

取值

* normal：常规显示

* italic：用字体的斜体显示

* oblique：文本倾斜显示

斜体标签

* 像`em`、`i`、`cite`、`var`、`dfn`等元素的font-style默认就是italic
* 设置font-style为italic的span元素，使用效果等价于em元素

### font-variant

> 用于影响小写字母的显示形式

取值

* normal：常规显示
* Small-caps：将小写字母替换为缩小过的大写字母

