## Tomcat服务器

* 目录文件

  * bin：可执行文件(mac中：startup.sh，shutdown.sh，win中：startup.bat，shutdown.bat)
  * conf：配置文件(server.xml)
  * lib：tomcat依赖的jar文件
  * log：日志文件(记录出错等信息)
  * temp：临时文件
  * webapps：可执行的项目,(将我们开发的项目放入该目录)
  * work：存放由jsp翻译成的java，以及编译成的class文件(jsp->java->class)

* 常见状态码

  * 200：正常
  * 300/301：重定向
  * 403：权限不足
  * 404：资源不存在
  * 500：服务器内部代码错误

* 配置虚拟路径

  >docBase：表示实际路径

>path：表示虚拟路径(可以是绝对路径也可以相对路径,相对路径是相对webapps文件夹)

* 第一种(弊端：需要配置后重启Tomcat)
  将web项目文件配置到 webapps 以外的目录，并在Tomcat文件夹下的conf/server.xml中的配置如下

  ```
  <Host>
    ...
    <Context docBase="/Users/guo/JspProject" path="/JspProject" />
  </Host>
  ```

  * 第二种(配置后不需要重启Tomcat)

    Tomcat文件夹下Catalina/localhost文件夹中添加一个与项目名称同名的XX.xml文件并配置

  ```
  <Context docBase="/Users/guo/JspProject" path="/JspProject" />
  ```

* 虚拟主机

### 部署项目

有如下4种方式

1、将web项目整个文件夹，放在%TOMCAT_HOME%/webapps目录中，文件夹名称作为ContextPath

2、将web项目打包成war，放在%TOMCAT_HOME%/webapps目录中，war文件名作为ContextPath

