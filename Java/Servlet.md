## Servlet JSP

#### Servlet 是Server Applet的简称，译为"小服务程序"，用于响应客户端的请求

#### 一般的使用要素

* 继承```javax.servlet.http.HttpServlet```, 实现doGet、doPost或service方法

* 通过`request`对象获取客户端的请求数据
  - `request.getParameter()`

* 通过`response`对象给客户端返回响应
  * `response.getWriter().write()`

* 通过注解`@WebServlet`设置`Servlet`对应的请求路径 

#### 乱码问题

* 客户端的请求数据乱码

```java
request.setCharacterEncoding("UTF-8")
```

* 服务器的响应数据乱码
  * text/plain 是数据的MIMEType, 根据实际情况而定
  * 更多的MIMEType可以参考(TOMCAT_HOME/conf/web.xml)

```java
response.setContentType("text/plain;charset=UTF-8");
```

#### Servlet处理请求的常见过程

![image-20221120164901894](/Users/guo/Notes/Java/JavaWeb/images/servlet处理过程.png)

#### JSP

> 是 javaServer Pages 的简称，是一种动态网页技术标准

* 指令

```jsp
<%@ page %>: 配置当前页面信息
<%@ include %>: 包含其他页面
<%@ taglib%>: 导入标签库
```

* 输出

```
<%= 需要输出的内容 %>
等价于out.printf(需要输出的内容)
```

* 嵌入Java代码

```jsp
<% Java代码 %>
```

* 注释

```jsp
<%-- 注释内容 --%>
HTML、CSS、JS 注释依旧可以使用
```

* 声明

```jsp
<%! 声明成员变量、方法%>
```

#### 依赖的库

> 作用：可以简化JSP代码

1、EL库：Expression Language的简称

2、JSTL库：JSP Standard Tag Library 的简称，译为 JSP 标准标签库，由Apache的Jakarta小组维护

3、如何导入使用

* [下载地址](XXX)
* XXX



####  转发(forward)

> 在同一个Context中进行请求转发

![image-20221120203558589](/Users/guo/Notes/Java/JavaWeb/images/servlet转发.png)

#### 转发链条

* 在同一次请求中，可以转发多次，形成一个转发链条，在一个转发链条上
  * 可以通过request.setAttribute、request.getAttribute来共享数据
  * 每一次转发都会创建一个新的request对象，用成员变量request指向前一个request对象

![image-20221120203826655](/Users/guo/Notes/Java/JavaWeb/images/servlet转发链条.png)

* 在转发链条上，所有的attribute都存储在头部的Request对象中

#### 重定向(redirect)

> 服务器通知客户端chog你新年发送请求到新的任意URL地址

![image-20221120203506414](/Users/guo/Notes/Java/JavaWeb/images/servlet重定向.png)

#### 转发 VS 重定向

* 转发代码

```java
request.getRequestDispatcher("/路径").forward(request, response);
```

只能转发到同一个Context下，路径中不用包含ContextPath

客户端只发了一次请求

浏览器地址栏的URL不会发生变化

转发的操作只由服务器完成

* 重定向代码

```java
response.sendRedirect("/路径");
```

可以重定向到任意URL，如果重定向到同一个Context下，路径中需要包含ContextPath

客户端发了两次请求

浏览器地址栏的URL会发生变化

重定向的操作由服务器+客户端配合完成



