## 修复终端问题

#### 切换路径提示env问题

1、现象

![](https://cdn.jsdelivr.net/gh/GJBlog/Notes/Mac/images/%E7%BB%88%E7%AB%AF%E6%8F%90%E7%A4%BAenv.png)

2、解决方案

* 第一步

```shell
sudo ln -s /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.8/bin/python3 /usr/local/bin/python3
```

* 第二步

```shell
 sudo ln -s -f /usr/local/bin/python3 /usr/local/bin/python
```

#### 来源

[文章](https://blog.csdn.net/shenhonglei1234/article/details/124487144)