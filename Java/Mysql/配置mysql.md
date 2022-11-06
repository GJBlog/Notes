## 配置mysql

#### 一、更改默认密码

1、遇到如下提示的解决办法

```shell
Your password has expired. To log in you must change it using a client that supports expired passwords.
```

* 先正常登录上root账号（密码：默认是安装好mysql后会弹窗显示）

```shell
mysql -u root -p
```



* 再使用如下语句，修改密码

```shell
set password=password('新密码');
```

#### 二、配置环境变量

* 在bash对应的bash_profile或者zsh对应的zshrc文件中

```shell
export PATH=$PATH: /usr/local/mysql/bin
```

* 为了更便利，增加别名

```shell
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
```

####  三、配置默认编码格式

有如下步骤：

1、先切换到private/etc文件夹下，

2、创建my.cnf 文件，这里是因为mysql5.7的版本中没有自带配置文件

3、添加以下配置

```mysql
[client]
default-character-set=utf8
 
[mysql]
default-character-set=utf8
 
[mysqld]
character-set-server = utf8
```

4、保存，重新启动mysql即可

#### 四、查看编码格式

```mysql
show variables like '%char%';
```

### 参考

1、[密码文章](https://blog.csdn.net/weixin_33207551/article/details/84944065)

2、[配置环境变量](https://blog.csdn.net/mChales_Liu/article/details/110092812)

3、[编码文章](https://www.cnblogs.com/chenyanbin/p/12159850.html)

