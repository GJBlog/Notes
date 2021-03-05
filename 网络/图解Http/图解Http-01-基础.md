# Web基础

## 概念

### 客户端

* 通过发送请求获取服务器资源的```web```浏览器被称为客户端```client```

### TCP/IP协议簇

* 把与互联网相关联的协议及合起来总称为```TCP/IP```,即TCP/IP是在IP协议的通信过程中，使用到的协议簇的统称
* 分层
    * 应用层
    * 传输层
    * 网络层
    * 数据链路层

##### 应用层 

* 决定了向用户提供应用服务时通信的活动
* 内置应用服务
    * FTP(File Transfer Protocol)：文件传输协议
    * DNS(Domain Name System)：域名系统
* 协议：Http协议、DNP协议

##### 传输层

* 对上层应用层，提供处于网络连接中的两台计算机之间的数据传输
* 协议：
    * TCP(Transmission Control Protocl)：传输控制协议
    * UDP(User Data Protocol)：用户数据报协议

##### 网络层(又叫网络互连层)

* 用来处理在网络上流动的数据包(数据包：是网络传输的最小数据单位)，规定了通过什么路径到达对方计算机，决定了在众多的选项内选择一条传输线路
* 协议：IP协议、ARP协议

##### 数据链路层(又叫链路层、网络接口层)

* 用来处理连接网络的硬件部分。包括控制操作系统、硬件的设备驱动、NIC(Network Interface Card，网络适配器，即网卡)、光纤等物理可见的部分,(还包括链接器等一切传输媒介)，硬件上的范畴都在链路层的作用范围内

### IP协议(IP网际协议，Internet Protocol)

* 作用：把各种数据包传送给对方。
* IP地址：节点被分配到的地址,可变换
* MAC(Media Access Control)地址：网卡所属的固定地址，基本上不会更改
* IP之间的通信依赖MAC地址，通常是经过多台计算机和网络设备中转才能连接到对方。而在进行中转时，会利用下一站中转设备的 MAC 地址来搜索下一个中转目标。这时，会采用 ARP协议。

### ARP(Address Resoluton Protocol)协议

* 是一种用以解析地址的协议，根据通信方的IP地址就可以反查出对应的MAC地址

### TCP协议

* 提供可靠字节流服务(Byte Stream Service)。所谓字节流服务是指，为了方便传输，将大块数据分割成报文段(segment)为单位的数据包进行管理。即TCP协议为了更容易传送大数据才把数据分割，而且 TCP 协议能够确认数据最终是否送达到对方
* 为了准确无误地将数据送达目的处，TCP协议采用三次握手策略。握手中使用了TCP的标志(flag)，SYN(Synthronize)、ACK(acknowledgement)
* 三次握手过程
* 发送端首先发送一个带 SYN 标志的数据包给对方。接收端收到后，回传一个带有 SYN/ACK 标志的数据包以示传达确认信息。最后，发送端再回传一个带 ACK 标志的数据包，代表“握手”结束。若在握手过程中某个阶段莫名中断，TCP 协议会再次以相同的顺序发送相同的数据包

### DNS协议(Domain Name System)

* 提供域名到IP地址之间的解析服务
* 既可以通过域名查找IP地址，也可以逆向从IP地址反查域名

### URI和URL

* URI(Uniform Resource Identifier)：统一资源标识符,就是由某个协议方案(所谓协议方案，访问资源所使用的的协议类型名称)表示的资源的定位标识符，使用字符串标识某一互联网资源
* URL：统一资源定位符,它是URI的子集，表示资源的地点(互联网上所处的位置)
* URI格式
    * 要使用涵盖全部必要信息的绝对 URI、绝对 URL 以及相对 URL。相对 URL，是指从浏览器中基本 URI 处指定的 URL，形如 /image/logo.gif

```apache
// 绝对URI格式
                    hierarchical part
        ┌───────────────────┴─────────────────────┐
                     authority                  path
        ┌────────────────┴──────────────────┐┌───┴────┐
  abc://username:password@www.example.com:123/path/data?key=value&key2=value2#fragid1
  └┬┘   └───────┬───────┘ └──────┬──────┘ └┬┘           └─────────┬─────────┘ └──┬──┘
scheme  user information        host      port                  query         fragment

scheme：标识协议类型
user Information：指定用户名和密码作为从服务器端获取资源时必要的登录信息，可选项
www.example.com：服务器地址
port：服务器端口号
path：文件路径
query：查询字符串
fragment：片段标识符，通常可标记出已获取资源中的子资源
```

