# Http协议

## 概念

* 客户端：请求访问文本和图像等资源的一端
* 服务器端：提供资源响应的一端
* 请求报文：请求方法、请求URI、协议版本、可选的请求首部字段和内容实体构成
* 响应报文：协议版本、状态码、解释状态码的原因短语、可选的响应首部字段、实体主体构成

## 特点

* Http协议本身无状态，借助Cookie实现保持状态功能
* 方法名区分大小写，一定要用大写字母

## 方法

#### GET：获取资源

* 用来请求访问已被 URI 识别的资源

#### POST：传输实体主体

* 目的并不是获取响应的主体内容，用来传输实体的主体

#### PUT：传输文件

* 用来传输文件。就像 FTP 协议的文件上传一样，要求在请求报文的主体中包含文件内容，然后保存到请求 URI 指定的位置
* 鉴于 HTTP/1.1 的 PUT 方法自身不带验证机制，任何人都可以上传文件 , 存在安全性问题，因此一般的 Web 网站不使用该方法。若配合 Web 应用程序的验证机制，或架构设计采用 REST（REpresentational State Transfer，表征状态转移）标准的同类 Web 网站，就可能会开放使用 PUT 方法

#### HEAD：获得报文首部

* 与GET方法一样，只是不返回报文主体部分。用于确认URI的有效性及资源更新的日期时间等

#### DELETE：删除文件

* 用来删除文件，与PUT方法相反。根据请求URI删除指定的资源
* HTTP/1.1 的 DELETE 方法本身和 PUT 方法一样不带验证机制，所以一般的 Web 网站也不使用 DELETE 方法。当配合 Web 应用程序的验证机制，或遵守 REST 标准时还是有可能会开放使用的。

#### OPTIONS：询问支持的方法

* 用来查询针对请求 URI 指定的资源支持的方法

#### TRACE：追踪路径

* 让 Web 服务器端将之前的请求通信环回给客户端的方法。
* 发送请求时，在 Max-Forwards 首部字段中填入数值，每经过一个服务器端就将该数字减 1，当数值刚好减到 0 时，就停止继续传输，最后接收到请求的服务器端则返回状态码 200 OK 的响应
* 通过 TRACE 方法可以查询发送出去的请求是怎样被加工修改 / 篡改的，容易引发 XST（Cross-Site Tracing，跨站追踪）攻击，通常不会用到

#### CONNECT：要求用隧道协议连接代理

* 要求在与代理服务器通信时建立隧道，实现用隧道协议进行 TCP 通信。主要使用 SSL（Secure Sockets Layer，安全套接层）和 TLS（Transport Layer Security，传输层安全）协议把通信内容加 密后经网络隧道传输
* 格式

```
CONNECT 代理服务器名：端口号 HTTP版本
```

* TLS 1.0与SSL 3.0的差异非常微小

## 持久连接

* 为了解决每次进行一次HTTP通信就断开一次TCP连接的问题，产生持久连接（HTTP Persistent Connections，也称为 HTTP keep-alive 或 HTTP connection reuse）的方法
* 只要任意一端没有明确提出断开连接，则保持 TCP 连接状态
* 好处是减少了 TCP 连接的重复建立和断开所造成的额外开销，减轻了服务器端的负载。另外，减少开销的那部分时间，使 HTTP 请求和响应能够更早地结束，这样 Web 页面的显示速度也就相应提高了
* 在HTTP/1.1中，所有连接默认都是持久连接

## 管线化

* 持久连接使得多数请求以管线化（pipelining）方式发送成为可能。从前发送请求后需等待并收到响应，才能发送下一个请求。管线化技术出现后，不用等待响应亦可直接发送下一个请求。这样就能够做到同时并行发送多个请求，而不需要一个接一个地等待响应了

## Cookie状态管理

* 通过在请求和响应报文中写入 Cookie 信息来控制客户端的状态
* Cookie 会根据从服务器端发送的响应报文内的一个叫做 Set-Cookie 的首部字段信息，通知客户端保存 Cookie。当下次客户端再往该服务器发送请求时，客户端会自动在请求报文中加入 Cookie 值后发送出去
* 服务器端发现客户端发送过来的 Cookie 后，会去检查究竟是从哪一个客户端发来的连接请求，然后对比服务器上的记录，最后得到之前的状态信息