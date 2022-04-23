## CSS属性-text-overflow

* text-overflow 通常用来设置文字溢出时的行为(处理那部分不可见的内容)
  * clip：溢出的内容直接裁掉(字符可能会显示不完整)
  * ellipsis：溢出那行的结尾处用省略号表示
* text-overflow：生效的前提是overflow不为visible
* Text-overflow的效果受direction的影响

代码写法

```css
// 只显示一行文字(超出部分用省略号显示)
{
  // 保证用于只显示一行文字(单词可以超出元素范围)
  white-space: nowrap;
  // 超出元素的内容隐藏掉
  overflow: hidden;
  // 隐藏掉的内容在尾部用省略号来显示
  text-overflow: ellipsis;
}
```

