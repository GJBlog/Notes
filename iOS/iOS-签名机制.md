### 签名

#### 一、概述

* x.509：一种格式标准(公钥证书)，应用于TLS/SSL中、电子签名服务

```
TLS: Transport Layer Security(传输层安全性协议)
SSL: Security Sockets Layer(安全套接字层协议)
```

包含：公钥、身份信息、签名信息、待扩展信息

* 

二、机制



三、实际操作，探究证书中的内容

* 查看证书签名信息

```
openssl pkcs12 -in xxx.p12 -out xxx.pem -nodes
```







四、代码签名

代码签名流程：

![image-20201027132451400](/Users/guojie/Library/Application Support/typora-user-images/image-20201027132451400.png)

作用：

* Ensure that a piece of code has not been altered since it was signed.
* Identify code as coming from a specific source (a developer or signer)
* Determine whether code is trustworthy for a specific purpose.

