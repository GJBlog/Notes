## CSS属性-文本

### text-decoration

> 用于设置文字的装饰线

取值如下：

* `none`：无任何装饰线，(可以去除`a`元素默认的下划线)
* `underline`：下换线
* `overline`：上划线
* line-throught：中划线(删除线)

* `u`，`ins`元素默认就是设置了`text-decoration`为`underline`

### letter-spacing，word-spacing

> 分别用于设置字母、单词之间的间距

* 默认值是0，可以设置负数

### text-transform

> 用于设置文字的大小写转换

取值如下

* `capitalize`：将每个单词的首字符变为大写
*  `uppercase`：将每个单词的所有字符变为大写
* `lowercase`：将每个单词的所有字符变为小写

* `none`：没有任何影响

建议通过text-transform属性来控制网页中的中英文字母的大小写，不要直接在HTML中固定死书写形式

### text-indent

> 用于设置第一行内容的缩进

```css
text-indent: 2em; 表示刚好缩进2个文字
```

### text-align

> 用于设置元素内容在元素中的水平对齐方式

常用的值

* `left`：左对齐
* `right`：右对齐
* `center`：正中间显示
* `justify`：两端对齐

### 单位

* 绝对单位：px
* 相对单位：n em，相当于 font-size * n，是相对于font-size 进行计算
