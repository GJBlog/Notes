## xattr

#### 定义

xattr命令可用于显示、修改或删除一个或多个文件的扩展属性，包括目录和符号链接。

```shell
sudo xattr -d com.apple.quarantine /Applications/xxxx.app
```

-c：清除所有属性

-d：删除给定属性

-r：指定文件夹，递归文件夹下的所有文件



[参考](https://blog.niekun.net/archives/1680.html)