## Servlet

#### Servlet 是Server Applet的简称，译为"小服务程序"，用于响应客户端的请求

#### 一般的使用要素

* 继承```javax.servlet.http.HttpServlet```, 实现doGet、doPost或service方法

* 通过`request`对象获取客户端的请求数据
  - `request.getParameter()`

* 通过`response`对象给客户端返回响应
  * `response.getWriter().write()`

* 通过注解`@WebServlet`设置`Servlet`对应的请求路径 

#### 乱码问题

