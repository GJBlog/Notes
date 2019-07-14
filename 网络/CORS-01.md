## CORS

####1、概念

* 是一个W3C的标准，全称为跨域资源共享(Cross-origin resource sharing)
* 允许浏览器向想跨源的服务端发出**XMLHttpRequest**请求，解决AJAX只能同源使用的限制

####2、分类

* 简单请求(simple request)

    * 请求方法是 HEAD、GET、POST之一。
    * HTTP头信息不超过这些字段(Accept、Accept-language、Content-Language、Last-Event-ID、Content-Type)。

* 非简单请求(no-so-simple request)

    * 凡是不同时满足上面的两个条件就是非简单请求。

####3、简单请求

在请求头信息中添加一个Origin信息

####4、非简单请求