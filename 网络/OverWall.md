## OverWall

## 终端配置代理

在命令行输入执行以下两条指令

```
export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087
```



macOS 版的 SS 默认监控本地的HTTP端口是 1087，而 Windows 版本的则是 1080，如果改过默认端口，就使用你指定的端口
这样就完成终端翻墙了，当然我们每次翻墙都执行一次指令会比较麻烦，把指令写进 .bash_profile 方便以后操作。

## 终端代理写进 .bash_profile

```
vim ~/.bash_profile
```

进入 .bash_profile，在最后加上以下代码

```
function proxy_on(){
    export http_proxy=http://127.0.0.1:1087
    export https_proxy=http://127.0.0.1:1087
    echo -e "已开启代理"
}
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}
```

之后使该配置文件生效

```
source ~/.bash_profile
```

使用 proxy 前先查看下当前的 ip 地址

```
➜  ~ curl ip.cn
当前 IP：103.202.xxx.xx 来自：北京市
```



之后开启 proxy,再查看

```
➜  ~ proxy_on
已开启代理
➜  ~ curl ip.cn
当前 IP：103.88.xxx.xx 来自：日本 CatNetworks
```



不需要代理的时候再执行 proxy_off 关闭代理

```
➜  ~ proxy_off
已关闭代理
```



> ip.cn 有时候会挂掉，可以尝试 ip.sb







[参考资料]([https://kerminate.me/2018/10/22/mac-%E7%BB%88%E7%AB%AF%E5%AE%9E%E7%8E%B0%E7%BF%BB%E5%A2%99/](https://kerminate.me/2018/10/22/mac-终端实现翻墙/))