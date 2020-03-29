## CSS-属性-文本

### text-decoration

> 用于设置文字的装饰线
>
> `u`、`ins`元素默认设置了`text-decoration`为`underline`

取值如下：

```css
none：无任何装饰线
underline：下划线
overline：上划线
line-through：中划线(删除线)
```

### letter-spacing

> 设置字符之间的间距
>
> 默认值为0，可以设置负数

```css
letter-spacing: 10px
```

### word-spacing

> 设置单词之间的间距，通过空格分隔开的字符会被识别为一个单词
>
> 默认值为0，可以设置负数

```css
word-spacing: 10px
```

### text-transform

> 设置文字的大小写转换
>
> 建议通过`text-transform`来控制网页中英文字母的大小写，而不是直接在网页中写死形式

```css
capitalize：将每个单词的首字符变为大写
uppercase：将每个单词的所有字符变为大写
lowercase：将每个单词的所有字符变为小写
none：没有影响
```

### text-indent

> 用来设置第一行内容的缩进
>
> `text-indent:2em; `刚好是缩进2个文字

```css
绝对单位：px
相对单位：em
em是相对于 font-size 进行计算
2em：相当于 font-size * 2 = XX px
1em：相当于 font-size * 1 = XX px
```

### text-align

> 用于设置元素内容在元素中的水平对齐方式
>
> 取值如下

```css
left：左对齐
right：右对齐
center：正中间显示
justify：两端对齐
```

