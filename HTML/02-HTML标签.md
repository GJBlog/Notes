# 02-HTML标签
###列表
####一、无序列表(使用最多)(unordered list)
1. 作用：给一堆数据添加列表语义，并且这一堆数据中所有的数据没有先后之分。
2. 格式：

```html
<ul>
    <li>需要显示的条目内容</li>
</ul>
```

3. 注意点：
    * ul标签是用来给数据添加列表语义，不是添加小圆点。
    * ul和li标签是一个整体，一般情况下是一起出现，不会单独出现。
    * 不推荐ul标签中包含其他标签。ul标签中只会看到li标签。
     
####二、有序列表(最少)(odered list)

1. 作用：给一堆数据添加列表语义，并且这一堆数据中所有的数据有先后之分。
2. 格式：

```html
<ol>
    <li>需要显示的条目内容</li>
</ol>
```

3. 注意点：同无序列表

####三、定义列表(其次)()(definition list)
1. 作用：
    * 给一堆数据添加列表语义
    * 先通过dt标签定义列表中的标题，再通过dd标签给每一个标题添加描述信息

2. 格式：

```html
<dl>
    <dt></dt>
    <dd></dd>
    <dt></dt>
    <dd></dd>
</dl>
```

dt：definition title 缩写，用来定义列表中的标题
dd：definition description 缩写，用来定义标题对应的描述

3. 应用场景
    * 网站尾部的相关信息
    * 图文混排
4. 注意点
    * 和ul/ol一样，dl和dt/dd是一个整体，它们一般情况下不会单独出现，都是一起出现
    * 和ul/ol一样，由于dl和dt/dd是一个组合标签，所以dl中建议只放dt和dd标签
    * 一个dt可以没有对应的dd，也可以有多个对应的dd，但是无论有或者没有dd都不推荐
    * 推荐使用一个dt对应一个dd，当需要丰富界面时，可以在dt和dd标签中就添加其他标签
 
####技巧

1. 快速编写一个ul标签：
ul>li
含义：生成一对ul标签，然后在这对ul标签中再生成一对li标签
ul>li*3
含义：生成一对ul标签，然后在这对ul标签中再生成3对li标签


