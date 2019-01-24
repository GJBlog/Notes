## HTTPS

### 基础

1、HTTPS：Secure Hypertext Transfer Protocol (安全超文本传输协议)
2、HTTPS = HTTP + TLS/SSL

#### HTTP

1、HTTPS：Secure HypeText Transfer Protocol (安全超文本传输协议)


#### TLS/SSL

* 1、TLS/SSL：Transport Layer Security (安全传输层协议)，是介于TCP与HTTP之间
* 2、作用：身份验证、信息加密、完整性校验
* 3、原理

主要基于如下三类算法：

* 散列函数Hash：验证信息的完整性(MD5、SHA1、SHA256...)
* 对称加密：采用协商的秘钥对数据加密(AES、DES、3DES、AES-GCM、AES-CBC...)
* 非对称加密：实现身份认证和秘钥协商（RSA、ECC、DH...）

### 性能与优化

#### 性能损耗

* 增加延时
* 消耗较多的CPU资源

#### 优化

* CDN接入
* 会话缓存
* 硬件加速
* 远程解密
* SPDY/HTTP2


### 参考资料

* [全站 HTTPS 来了](https://mp.weixin.qq.com/s?__biz=MzA3NTYzODYzMg==&mid=402615812&idx=1&sn=b6dae639119bb66e7025321254b8d973&scene=2&srcid=122466parPJZpmpxfpPVFutJ&from=timeline&isappinstalled=0#wechat_redirect)


