### HTTP

HTTP的请求方式：
1、GET、POST、HEAD、PUT、DELETE、OPTIONS
GET和POST区别
1、GET：用于获取资源(特性：非安全的、幂等的、可缓存的)
2、POST：用于处理资源(特性：安全的、非幂等的、不可缓存的)
按照安全性来分类：
1、GET、HEAD、OPTIONS 都是安全性的(安全性：不会引起Serve端的任何状态变化)
按照幂等性来分类：
1、GET、PUT、DELETE(幂等性：同一个请求方法执行多次和执行一次的效果完全相同)
按照可缓存性分类：
1、GET、HEAD(缓存性：请求是否可以被缓存)
了解哪些状态码？
1、1XX,2XX,3XX,4XX,5XX
HTTP的建立连接流程？
1、通过TCP三次握手建立HTTP连接
2、在连接上进行HTTP的请求和响应
2、经过TCP的四次挥手进行连接释放
HTTP的特点
1、无连接(HTTP的持久连接方式)
- 请求头部字段：
    - Connection：keep-alive
    - time：持久时间有效期
    - max：这条连接最多可以发生多少个HTTP请求、响应
- 判断一个请求是否结束
    - 响应报文中头部携带的Content-length字段值
    - chunked，最后会有一个空的chunked
2、无状态(Cookie/Session)
Charles抓包原理
1、HTTP的中间人攻击漏洞

### HTTPS与网络安全

一、HTTPS和HTTP的区别
1、HTTPS = HTTP + SSL/TLS(协议)
HTTP(应用层) SSL/TLS(应用层之下、传输层之上中间层)
TCP(传输层)
IP(网络层)
协议栈

二、HTTPS连接建立流程
HTTPS都是用了哪些加密手段？为什么？
1、连接建立过程使用非对称加密，非对称加密很耗时
2、后续通信过程使用对称加密

三、TCP\UDP

* TCP：位于传输层，传输控制协议，数据传输单位：报文段
特点：
- 面向连接：
    - 为什么进行三次握手？
    - 答：解决同步请求连接建立的报文超时的场景，来规避连接建立异常问题

    - 四次挥手
    - 答：TCP连接通道是全双工的概念，全双工的概念：一条通道，两个端点都可以进行发送和接收数据
    
- 可靠传输
    - TCP怎样保证可靠传输
    - 答：保证报文无差错、不丢失、不重复、按需到达
    - 实现可靠传输
    - 答：可靠传输在TCP层面是通过停止等待协议实现的
 - 停止等待协议
     - 无差错情况：
     - 超时重传
     - 确认丢失
     - 确认迟到

- 面向字节流

- 流量控制
    - 是基于滑动窗口协议实现的
    - 关于什么是滑动窗口协议，怎样理解的？
    - 答：

- 拥塞控制
功能：
    - 慢开始、拥塞避免策略
    - 快恢复、快重传是基于慢开始、拥塞避免产生的

* UDP：位于传输层，用户数据报协议，数据传输单位：用户数据报
特点：无连接、尽最大努力交付(不可靠)、面向报文
功能：复用、分用、差错检测

* DNS解析：
    - 了解DNS解析吗？DNS解析的过程？
    - 答：DNS是指域名到IP地址的映射，DNS(解析)协议是应用层协议，DNS解析请求是采用UDP数据包，且明文传输

    - DNS解析查询方式
        - 递归查询：
        - 迭代查询：

    - DNS解析存在哪些常见问题
        - DNS劫持问题
        - 答：DNS劫持跟HTTP没有关系，DNS解析是发生在HTTP建立连接之前，且DNS解析请求使用UDP数据报，端口号是53
        - 如何解决？
            * httpDNS：将原来的使用DNS协议向DNS服务器的53端口进行请求改为使用HTTP协议向DNS服务器的80端口进行请求的流程
            * 长连接：在客户端跟Server端中间建立长连Server,客户端跟长连Server建立TCP长连通道，长连Server与Server端建立内网专线进行HTTP的请求和响应

        - DNS解析转发问题
        - 答：
        
    * Session、Cookie

        - Cookie：主要用来记录用户状态，区分用户；状态保存在客户端。且通过服务端下发响应信息时在响应头中```Set-Cookie```字段中携带
                请求报文的头部```Cookie```字段
        客户端--------------------------------->服务端
                响应报文的头部中```Set-Cookie```字段
        客户端<---------------------------------服务端   
        
        - 如何修改Cookie？
            * 新cookie覆盖旧cookie
            * 满足覆盖规则：name、path、domain等需要与原cookie一致
        - 如何删除Cookie?
            * 新cookie覆盖旧cookie
            * 满足覆盖规则：name、path、domain等需要与原cookie一致
            * 设置cookie的expires=过去的一个时间点，或者maxAge = 0
        - 如何保证Cookie的安全？
            * 对Cookie进行加密处理
            * 只在https上携带Cookie
            * 设置Cookie为httpOnly，防止跨站脚本攻击

        - Session：也是用来记录用户状态，区分用户的，状态保存在服务器端。
        - Session 与 Cookie 的区别？
            * 存放位置不同
            * 有联系，Session需要依赖Cookie机制实现(因为服务端生成的sesssId是通过Set-Cookie和Cookie中的sessId字段在客户端和服务器端进行传输的)
            
 四、IP
 IP协议：位于网络层、
    ### 总结
    
    * GET和POST方式区别？
    * HTTPS连接建立流程是怎么样的？
    * TCP和UDP有什么区别？
    * 简述TCP的慢开始过程？(TCP的拥塞控制)
    * 客户端怎么避免DNS劫持
            