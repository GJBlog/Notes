## CSS选择器(selector)

> 按照一定的规则选中符号条件的元素，为之添加CSS样式

### 选择器的种类如下

* 通用选择器 (universal selector)
* 元素选择器 (type selector)
* 类选择器 (class selector)
* id选择器 (id selector)
* 属性选择器 (attribute selector)
* 组合选择器 (combinators)
* 伪类选择器 (pseudo-class)
* 伪元素 (pseudo-elements)

#### 元素选择器(type selector)

> 当前指定的元素对应的所有标签

```css
// 所有div元素
div {
  color: red;
}
```

#### 通用选择器(universal selector)

> 所有的元素

```css
* {
  color: red;
}
```

* 一般用来给所有的元素做一些通用性的设置(比如：内边距、外边距)
* 效率比较低，尽量不要使用

### id选择器(id selectors)

id 值为one的元素

```html
<div id="one">我是div</div>
```

```css
#one {
  color: red;
}
```

#### 注意点

* 一个HTML文档里面的id值是唯一的，不能重复
* id值如果由多个单词组成，单词之间可以用中划线、下划线连接，也可以使用驼峰标识
* 最好不要用标签名作为id值

* 中划线又叫做连字符(hyphen)

### 类选择器(class selectors)

Class 值有one的元素

```html
<p class="type main">我是p1</p>
<p class="main">我是p2</p>
<p class="main">我是p3</p>
<p>我是p4</p>
```

```css
.main {
    color: red;
}
```

#### 注意点

* 一个元素可以有多个class值，每个class之间用空格隔开
* class值如果由多个单词组成，单词之间可以用中划线、下划线连接，也可以用驼峰标识
* 最好不要使用标签名作为class值
* 在开发过程中，类选择器可以认为是最常用最灵活的选择器
* 一般会将一些公共样式抽取出来，写到某个类选择器中，谁想要使用这些样式，加上类名即可

### 临时到的属性

#### 圆角半径

* border-radius

#### 鼠标样式

> 鼠标移动到元素上时显示的样子

* cursor：pointer(标识小手样式)

### 属性选择器(atribute selectrors)

#### [att]

* 拥有title属性的元素

```html
<a href="https://www.baidu.com">百度</a>
<a>京东</a>
<a href="https://www.qq.com">腾讯</a>
```

```css
<style>
    [href] {
        color: red;
    }
</style>
```

#### [att = value]

* title属性值恰好等于one的元素

#### [att ~=val]

* title属性值包含单词one的元素(且单词one与其他单词之间必须用空格隔开)

#### [att |=val]

* title属性值恰好等于one或者以单词one开头且后面紧跟着连字符-的元素

* 一般用在lang属性上面

```css
[lang !="en"] {
  color: red;
}
```

#### [att ^=val]

* title属性值以单词one开头的元素

```css
[title^="one"]{
  color: red;
}
```

#### [att$=val]

* title属性值以单词one结尾的元素

```css
[title$="one"] {
  color: red;
}
```

#### [att *=val]

* title属性值包含单词one的元素

```css
[title*="one"] {
  color: red;
}
```

### 后代组合(descendant combinator)

* div元素里面的span元素(包括直接、间距子元素)

```html
<span>文字内容1</span>
<div>
    <span>我是span</span>
</div>
```

```css
<style>
    div span {
        color:  red;
    }
</style>
```

### 子组合(child combinators)(子选择器)

* div元素里面的直接span子元素(不包括间接子元素)
* 在使用选择器时，不限于仅仅是标签名，其他任何选择器都可以

```html
<div class="div1">
    <div id="div2">
        <p><span title="123">我是span</span></p>
    </div>
</div>
```

```css
<style>
	  /* 第一种写法*/
    div>p>span{
        color: red;
    }
	  /* 第二种写法*/
    #div2>p>[title]{
        color: red;
    }
</style>
```

### 相邻兄弟组合(adjacent sibling combinator)(相邻兄弟选择器)

* div元素后面紧挨着的p元素(且div、p元素必须是兄弟关系)

```html
<p>文字内容1</p>
<div>
    <p>文字内容2</p>
</div>
<p>文字内容3</p>
<p>文字内容4</p>
```

```css
<style>
    div+p {
        color: red;
    }
</style>
```

### 全体兄弟组合(general sibling combinator)

* div元素后面的p元素(且 div、p元素必须是兄弟关系)

```html
<p>文字内容1</p>
<div>
    <p>文字内容2</p>
</div>
<p>文字内容3</p>
<p>文字内容4</p>
```

```css
<style>
    div~p {
        color: red;
    }
</style>
```

### 选择器组-交集

* 所有同时符号2个条件的元素：div元素、class值有one

```html
<div class="one">文字内容1</div>
<div class="two">文字内容2</div>
<p class="one">文字内容3</p>
```

```css
<style>
    div.one {
        color: red;
    }
</style>
```

### 选择器组-并集

* 所有的div元素+所有的class值有one的元素+所有title属性值等于test的元素

```html
<div>文字内容1</div>
<span title="test">文字内容2</span>
<p class="one">文字内容3</p>
```

```css
<style>
    div, .one, [title="test"] {
        color: red;
    }
</style>
```

### 伪类选择器(pseudo-classes)

- 常见的伪类有
* 动态伪类(dynamic pseudo-classes)
  * :link、:visited、:hover、:active、:focus

* 目标伪类
  * :target

* 语言伪类
  * :lang()

* 元素状态伪类(UI element states pseudo-classes)
  * :enableed、:disabled、:checked

* 结构伪类(structual pseudo-classes)
  * :nth-child()、:nth-last-child()、:nth-of-type()、:nth-last-of-type()
  * :first-child、:last-child、first-of-type、:last-of-type
  * :root、:only-child、:only-of-type、:empty

* 否定伪类(negation pseudo-classes)
  * :not()

#### 动态伪类(dynamic pseudo-classes)

* a:link 未访问过的链接
* a:visited 已访问的链接
* a:hover 鼠标挪动到链接上
* a:active 激活的链接(鼠标在链接上长按住，未松开)
* a:focus 这里与active的效果等同

* 使用注意
  * :hover必须放在:link、:visited后面才能完全生效
  * :active必须放在:hove后面才能完成生效
  * 除了a元素，:hover、:active也能用在其他的元素上
  * focus要放在active前才有效
  * 动态伪类编写建议顺序 :link  :visited  :focus  :hover  :active

```html
<a href="http://www.360.cn">360</a>
<div>我是div</div>
```

```css
a:link {
    color: red;
}
a:visited {
    color: pink;
}
a:hover {
    color: green;
}
a:active {
    color: yellow;
}
div {
    width: 100px;
    height: 100px;
    background-color: red;
}
div:hover {
    background-color: green;
}
div:active {
    background-color: yellow;
}
```

#### :focus

>  指当前拥有输入焦点的元素(能接收键盘输入)

* 因为链接a元素可以被键盘tab键选中聚焦，所以focus也适用于a元素
* 去除a元素默认的:focus效果

```css
/* 第一种方式 */
a:focus {
  outline: none;
}
/*第二种方式*/
将tabIndex属性设置为-1
```

* 使用tabindex可以控制tab键选中元素的顺序，从1开始
* tabindex设置为-1，代表禁止使用tab键选中

### 结构伪类(structural pseudo-classes)

#### :nth-child(1)

> 是父元素中的第1个子元素

```html
<p>文本内容1</p>
<p><span>文本内容2</span></p>
<div>
    <p>文本内容3</p>
    <p>文本内容4</p>
</div>
```

```css
<style>
    p:nth-child(1) {
        color: red;
    }
</style>
```

#### :nth-child(2n)

> n代表任意正整数和0
>
* 是父元素中的第偶数个子元素(第2、4、6、8....个)
* 跟:nth-child(even)同义

```html
<div>
    <p>文本内容1</p>
    <p>文本内容2</p>
    <p>文本内容3</p>
    <p>文本内容4</p>
</div>
```

```css
<style>
    p:nth-child(2n) {
        color: red;
    }
</style>
```

#### nth-child(2n+1)

> n代表任意正整数和0

* 是父元素中的第奇数个子元素(第1、3、5、7....个)
* 跟:nth-child(odd)同义

```html
<div>
    <p>文本内容1</p>
    <p>文本内容2</p>
    <p>文本内容3</p>
    <p>文本内容4</p>
</div>
```

```css
<style>
    p:nth-child(2n + 1) {
        color: red;
    }
</style>
```

#### nth-last-child()

* 语法跟nth-child()类似，不同点是:nth-last-child() 从最后一个子元素开往前计数
* nth-last-child(1)，代表倒数第一个子元素
* Nth-last-child(-n + 2)，代表最后2个子元素

#### nth-of-type()

* 与:nth-child()类似，不同点是:nth-of-type()计数时只计算同种类型的元素

```html
<div>
    <p>我是p</p>
    <span>span1</span>
    <span>span2</span>
    <span>span3</span>
</div>
```

```css
<style>
    span:nth-of-type(1){
        color: red;
    }
</style>
```

#### nth-last-of-type()

* 与:nth-of-type()类似，不同点是:nth-last-of-type() 从最后一个这种类型的子元素开始往前计数

### 整理结构伪类

##### :nth-child() 的完整使用格式是:nth-child(an+b)

* 是父元素中的第an + b个子元素
* n代表任意正整数和0
* a、b需要给出具体值，可以是正整数、负整数、0

##### 技巧

* 用:nth-child()表示最前面2个子元素

```css
nth-child(-n + 2)
```

* 表示第2个~倒数第2个元素（去除头和尾元素）

```css
p:nth-child(n + 2):nth-last-child(n + 2) {
  color: red;
}
```

* 不能写成b + an

#### :empty

> 表示里面完全空白的元素,不包含内容

```html
<div>
    <p>我是p</p>
    <span>span1</span>
    <span>span2</span>
    <span>span3</span>
    <p></p>
</div>
```

```css
<style>
    p:empty {
        width: 100px;
        height: 20px;
        background: red;
    }
</style>
```

### 否定伪类(negation pseudo-class)

#### :not(x)

* 写法

```css
<body>
    <p>我是p</p>
    <span>我是span</span>
    <strong>我是strong</strong>
</body>
```

```css
<style>
    :not(p):not(body):not(html) {
        color: red;
    }
</style>
```

* x是一个简单选择器，可以是元素选择器、通用选择器、属性选择器、类选择器、id选择器、伪类(除否定伪类)

* :not(x) 表示除x之外的元素

### 其他结构伪类

* first-child，等同于 :nth-child(1)
* last-child，等同于 :nth-last-child(1)
* first-of-type，等同于 :nth-of-type(1)
* last-of-type，等同于 :nth-last-of-type(1)
* only-child，是父元素中唯一的子元素
* 等同于:first-child:last-child 或者:nth-child(1):nth-last-child(1)
* :only-of-type是父元素中唯一的这种类型的子元素
* 等同于 :first-of-type:last-of-type或者:nth-of-type(1):nth-last-of-type(1)

* :root，是根元素，就是HTML元素

### 伪元素

#### ::first-line

> 可以针对首行文本设置属性

* 只有下列属性可以应用在::first-line伪元素
  * 字体属性、颜色属性、背景属性
  * word-spacing、letter-spacing、text-decoration、text-tranform、line-height

#### ::first-letter

> 可以针对首字母设置属性

* 只有下列属性可以应用在::first-letter伪元素
  * 字体属性、margin属性、padding属性、border属性、颜色属性、背景属性
  * Text-decoration、text-transform、letter-spacing、word-spacing(适当的时候)、line-height、float、vertical-align(只有当float是none时)

#### ::before和::after

* 用来在一个元素的内容之前和之后插入其他的内容(可以是文字、图片)

```css
div::before {
    content: "this is befor" ;
}
```

##### 注意点

* ::before和::after的content属性不能缺少
* ::before和::after的display默认是inline，可以把::before和::after当做是span元素
* 可以使用::before和::after来使用取代子元素
* 由于::before和::after是CSS样式，所以可有可无的内容才使用::before和::after

### attr()

* 在content中，还可以使用attr(属性名)来获得元素的属性值

```html
<a href="https://www.baidu.com">百度</a><br>
<a href="https://www.qq.com">腾讯</a><br>
<a href="https://www.taobao.com">淘宝</a>
<a href="#">哈哈</a>
```

```css
<style>
    a[href^="http"]::after {
        content: "[" attr(href) "]";
    }
</style>
```
