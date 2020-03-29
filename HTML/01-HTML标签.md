## 01-HTML标签

### h

* 表示网页的标题
* 从h1~h6共规定了6个登记的标题，显示效果:从大到小的顺序
* 有助于网站的SEO(Search Engine Optimization)优化，可以促进关键词排名
* 建议网页中最多只有1个h1元素

### p

* 表示文章中的一个段落(paragraph)

### strong

* 用于强调某些文本，粗体的显示效果

### pre 

在默认情况下，HTML代码中大多数空格都会被浏览器压缩，比如一段连续的空格被压缩成1个空格
如果想要保留内容HTML代码中的空格、换行，可以使用`pre`标签

```html
<pre>内容</pre>
```

### 字符实体(Character Entity)

要想在网页中正确显示一些预留字符，必须使用字符实体，书写格式有如下两种

```html
&entity_name;
&#entity_number;
```
常用的有：

* 空格：`&nbsp;`
* 大于号：`&gt;`
* 小于号：`&lt;`
* &：`&amp;`

### code

* 为了更好表达清楚语义，使用code标签

### br

* 单标签，用于强制换行

### img

* img元素专门用来显示图片
* 如果只设置了width(height)，浏览器会根据图片宽高比计算出height(或width)，在HTML5规范中，alt是img元素的必要属性
* src属性用来设置图片的路径，它分为2种：
    * 绝对路径：完整的描述文件位置的路径
    * 相对路径：由这个文件所在的文件夹引起的跟其他文件的路径关系

* 在相对路径中, `.`代表当前文件夹,可以省略,`..`代表上级文件夹

```html
<img src="XXX" alt="图片加载失败的占位文字" width="100" height="100" >
```

### a

* target取值有如下几种

```html
_self：默认值，在当前窗口打开URL
_blank：在一个新的窗口中打开URL
_parent：在父窗口中打开URL
_top：在顶层窗口中打开URL
某个frame的name值：在某个frame中打开URL
```

### base
* 可以利用base元素设置当前页面所有a元素的默认行为
* base元素写在head元素中
* 如果想做到让所有的a标签的target属性统一设置，可以在Head标签中添加base标签中设置。

```HTML
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <base target="_blank" href="公共链接前缀">
</head>
<body>
    <a href="">百度</a> 
</body>
```

* base 标签就是专门用来统一的指定当前页面中所有的超链接(a标签)需要如何打开
* 假链接的格式：
    1. `#` ：点击会自动回到网页的顶部
    2. javascript：点击不会自动会到网页顶部
* 锚点：指定目标页面的id，通过a标签跳转到指定的页面位置。步骤分为两步
    1. 给目标位置的标签添加id属性，指定一个唯一的值
    2. 设置a标签你需要跳转到的目标标签对应的id
    
* 注意点：
    1. 该方式是没有过渡动画的，直接跳转到指定位置
    2. a标签除了可以跳转到当前界面指定外置外，还可以在跳转到其他界面时直接跳转到其它界面的指定位置
    
### iframe     

利用`iframe`元素可以实现：在一个`HTML`文档中嵌入其他的
`HTML`文档

```html
// frameborder：iframe的边框，取值为0(不显示)或者1(显示)
<iframe src="嵌入的网页的地址" frameborder="0"></iframe>
// 利用iframe来打开a指定的href页面

<iframe name="frame1" src="https://www.baidu.com" frameborder="1"></iframe>
<iframe name="frame2" src="https://www.taobao.com" frameborder="1"></iframe>

<a href="http://www.qq.com" target="frame1">腾讯网(frame1)</a>
<a href="http://www.qq.com" target="frame2">腾讯网(frame2)</a>
```

### 锚点链接

* 锚点链接用来实现：跳转到网页中的具体位置
* 如果表示要跳转到某个页面并且停止在该页面的某个位置，则在`href`中为`正常链接`+`#id名称`

```html
// 表示跳转到某个页面并且到该页面的某个位置
<a href="one.html#third">XXX</a>
// 连接跳转到`id`为`third`的位置
<a href="#third">调准</a>
<p id="first">第一章</p>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<p id="second">第二章</p>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<p id="third">第三章</p>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br>
// 单独`#`表示跳转到页面最顶端
<a href="#">回到顶部</a>
```

```html
// 定义锚点的两种方式
<a href="#one">go</a>
点击go会定位到
1、id值为one的任何元素
2、name值为one的a元素
```

### 伪链接

* 定义伪链接的两种方式

```html
<a href="#" onclick="return false;">立即充值</a>
<a href="javascript:">立即充值</a>
```

### URL

* URL的基本格式 = protocol://hostname/path
* URL完整格式 = protocol://hostname[:port]/path/[;parameters][?query]#fragment

http://www.baidu.com:80/s?wd=ios#page
```html
url = 协议://主机地址/路径
协议：不同的协议，代表不同的资源查找方法，资源传输方式
主机地址：存放资源的主机的IP地址(域名)
路径：资源在主机中的具体位置
port：端口，端口号范围从0到65535，默认HTTP的端口号80，FTP的端口是21
query：请求参数
fragment：锚点位置
```
### div

> 一般作为其他元素的父容器，把其他元素包住，代表一个整体
>
> 用于把网页分割为多个独立的部分

* 查看网页的技巧，在网页检查中给`div`添加外轮廓效果

```css
div {
  outline: 2px solid green !important;
}
```

### CSS属性可用性

> 由于浏览器、CSS版本问题，有些CSS属性是无法使用的
>
> 可以通过[https://caniuse.com]([https://caniuse.com)查询CSS属性的可用性



