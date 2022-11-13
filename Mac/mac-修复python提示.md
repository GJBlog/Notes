## 修复终端问题

#### 切换路径提示env问题

1、现象

![image-20221114003952161](/Users/guojie/Notes/Mac/images/终端提示env.png)

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