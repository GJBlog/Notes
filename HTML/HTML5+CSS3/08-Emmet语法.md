## Emmet语法

### !、html:5

按下Tab键，可以直接生成

```htmlc
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

</body>
</html>
```

### > 和 +

* div>ul>li

```html
<div>
    <ul>
        <li></li>
    </ul>
</div>
```

* div+p+bq

```html
<div></div>
<p></p>
<blockquote></blockquote>
```

* div+div>p>span+em

```html
<div></div>
<div>
    <p><span></span><em></em></p>
</div>
```

### * 和 ^

* ul>li * 5

```html
<ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>
```

* div+div>p>span+em^h1

  	* ^表示em与它的父元素是兄弟关系
  	
  	* ^写的再多，最终也是跟第一个元素同级

```html
<div></div>
<div>
    <p><span></span><em></em></p>
    <h1></h1>
</div>
```

* 中间不要存在空格

### 属性

* div#header+div.page+div#footer.class1.class2.class3

```html
<div id="header"></div>
<div class="page"></div>
<div id="footer" class="class1 class2 class3"></div>
```

* td[title="hello word!" colspan=3]

```html
<td title="hello word!" colspan="3"></td>
```

* td[title=hello]

```html
<td title="hello"></td>
```

* td[title colspan]

```html
<td title="" colspan=""></td>
```

### $

* ul>li.item$*5

```html
<ul>
    <li class="item1"></li>
    <li class="item2"></li>
    <li class="item3"></li>
    <li class="item4"></li>
    <li class="item5"></li>
</ul>
```

* ul>li.item$$$*5

```html
<ul>
    <li class="item001"></li>
    <li class="item002"></li>
    <li class="item003"></li>
    <li class="item004"></li>
    <li class="item005"></li>
</ul>
```

### $@

* @表示从哪一个数字开始
* -表示从大到小

ul>li.item$@*5

```html
<ul>
    <li class="item1"></li>
    <li class="item2"></li>
    <li class="item3"></li>
    <li class="item4"></li>
    <li class="item5"></li>
</ul>
```

ul>li.item$@-*5

```html
<ul>
    <li class="item5"></li>
    <li class="item4"></li>
    <li class="item3"></li>
    <li class="item2"></li>
    <li class="item1"></li>
</ul>
```

ul>li.item$@3*5

```html
<ul>
    <li class="item3"></li>
    <li class="item4"></li>
    <li class="item5"></li>
    <li class="item6"></li>
    <li class="item7"></li>
</ul>
```

ul>li.item$@-3*5
```
<ul>
    <li class="item7"></li>
    <li class="item6"></li>
    <li class="item5"></li>
    <li class="item4"></li>
    <li class="item3"></li>
</ul>
```

a>{click}+span{here}

```html
<a href="">click<span>here</span></a>
```

p{click}+a{here}+{to continue}

```html
<p>click</p>
<a href="">here</a>
to continue
```

p>{click}+a{here}+{ to continue }

```html
<p>click<a href="">here</a> to continue </p>
```

### {}

* a{click}

```css
<a href="">click</a>
```

* a>{click}

```css
<a href="">click</a><span>here</span>
```

* a{click} + span{here}

```css
<a href="">click</a><span>here</span>
```

* a>{click}+span{here}

```css
<a href="">click<span>here</span></a>
```



### 隐式标签

* 第一个

```html
<div>
    .wrap>.content
</div>
```

按下Tab键=>

```html
<div>
    <div class="wrap">
        <div class="content"></div>
    </div>
</div>	
```

* 第二个

```html
<span>.item</span>
```

按下Tab键=>

```html
<span><span class="item"></span></span>
```

* 第三个
```html
<em>.item</em>
```

按下Tab键=>

```html
<em><span class="item"></span></em>
```

* 第四个

```html
ul>.item*3
```

按下Tab键=>

```html
<ul>
    <li class="item"></li>
    <li class="item"></li>
    <li class="item"></li>
</ul>
```

* 第五个

```html
<ul>
	.item
</ul>
```

按下Tab键=>

```html
<ul>
    <li class="item"></li>
</ul>
```

* 第六个

```html
table>#row$*4>[colspan=2]
```

按下Tab键=>

```html
<table>
    <tr id="row1">
        <td colspan="2"></td>
    </tr>
    <tr id="row2">
        <td colspan="2"></td>
    </tr>
    <tr id="row3">
        <td colspan="2"></td>
    </tr>
    <tr id="row4">
        <td colspan="2"></td>
    </tr>
</table>
```

* 第七个

```html
<table>
    .item
</table>
```

按下Tab键=>

```html
<table>
    <tr class="item"></tr>
</table>
```

* 第八个

```html
<table>
    <tr class="item">
        .next
    </tr>
</table>
```

按下Tab键=>

```html
<table>
    <tr class="item">
        <td class="next"></td>
    </tr>
</table>
```

