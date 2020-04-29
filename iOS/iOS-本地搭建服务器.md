## 搭建本地服务器



#### 关闭mac中指定端口

> 在开启本地服务器的情况下通常会涉及到关闭某一个占用的端口

```shell
// 查看当前端口号信息
lsof -i:端口号
```

```shell
// 杀死指定端口
kill -9 42624(PID)
```



#### 参考

[干货系列之零基础搭建自测服务器](https://www.jianshu.com/p/638da64422a0)

[macOS搭建本地服务器](https://www.jianshu.com/p/db70c8b44c17)

[Mac搭建本地服务器与iOS调试](https://www.jianshu.com/p/81d8909b8675)

