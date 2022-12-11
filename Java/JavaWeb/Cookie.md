## Cookie 和 Session

#### 会话跟踪

##### HTTP 是一种无状态(stateless) 的协议


#### Cookie

> 是直接存储在浏览器本地的一小串数据

* 使用document.cookie访问Cookie
* 修改Cookie时，只会修改其中提到的Cookie
* name=value时必须被编码
* 一个Cookie最大为4kb，每个网站最多有20+个左右的Cookie(具体取决于浏览器)

##### 有效期

* 如果没有设置Cookie的过期时间，则当浏览器关闭时，Cookie就失效了

##### expires

* 必须完全采用GMT时区的格式，可以使用date.toUTCString 来获取
* 例如：expires=11 Dec 2022 10:08:56 GMT

##### max-age

* 过期时间距离当前时间的秒数
* 例如：max-age=60

##### 作用域

* domain和path标识定义了Cookie的作用域，即Cookie应该发给哪些URL
* domain
  * 标识指定了哪些主机可以接受Cookie
  * 如果不指定，默认为当前文档的主机(不包含子域名)；如果指定了domain，则一般包含子域名
  * 例如：如果设置domain=baidu.com，则Cookie也包含在子域名中(如：bbs.baidu.com)

* path
  * 标识指定了主机下的哪些路径可以接受Cookie，子路径也会被匹配
  * 例如：设置path/docs，则以下地址都会匹配
    - /docs
    - /docs/one/
    - /docs/one/img

#### 服务器设置Cookie

> Cookie通常是由Web服务器使用响应头Set-Cookie设置的

##### 关于max-age

* 在js中，如果设置为0或者负数，会立即设置Cookie
* 在java中，如果设置为0，则立即删除Cookie，如果设置为负数，按默认情况处理

#### Java中getSession内部原理

> 检查客户端是否有发送一个叫做JSESSIONID的Cookie

* 如果没有
  * 创建一个新的Session对象，并且这个Session对象会有一个id
  * 这个Session对象会保留在服务器的内存中
  * 在响应的时候，会添加一个Cookie(JSESSIONID=Session对象的id)给客户端
* 如果有
  * 返回id为JSESSIONID的Session对象

#### Session有效期

* session的有效期默认为30分钟
* 可以在web.xml中配置失效时间(单位是分钟)

```java
<session-config>
    <session-timeout>30</session-timeout>
</session-config>
```

#### JSESSIONID

* 默认情况下，当用户关闭浏览器时，Cookie中存储的JSESSION就会被销毁
* 可以通过如下代码延长JSESSIONID在客户端的寿命

```java
Cookie cookie = new Cookie("JSESSIONID", request.getSession().getId());
cookie.setMaxAge(3600);
response.addCookie(cookie);
```



