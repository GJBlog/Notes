#  基本配置

##### 1、用户名、邮箱

```shell
// 设置
git  config --global user.name "your  name"
git config --global user.email "your email"

// 查看
git config user.name
git config user.email

// 删除
git config--unset--global user.name
git config--unset--global user.email
```

##### 2、config参数

global：版本库配置文件
system：全局级别配置文件
/etc目录下 ：系统级别配置文件


##### 3、Status下中文乱码

```shell
git config --global core.quotepath false
```


