## Python2中如何使用中文

在 python2 中默认使用的是ASCII编码格式

在 python3 中默认使用的是UTF-8的编码格式

在 python 文件的第一行增加以下代码，解释器会以utf-8编码来处理python 文件

```python
# *-* codeing:utf8 *-*
```

也可以是下面的方式(**官方推荐**)

```python
# coding=utf8
```

