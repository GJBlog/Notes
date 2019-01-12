# Mac 检测 iOS App 中 HTTPS 域名是否有效

##### 1、通过 nscurl 命令即可

```shell
nscurl --ats-diagnostics --verbose 域名

例如：

nscurl --ats-diagnostics --verbose https://www.aliyun.com
```
##### 2、结果

```shell
Result : PASS  表示成功
Result : false 表示失败
```

[引用来源](!https://blog.csdn.net/zcl_666/article/details/69388883)


