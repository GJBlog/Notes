# 配置GitHub

##### 1、配置同一个GitHub网站下多个仓库

* 在```.ssh```文件夹中配置```config```文件(如果没有可以手动创建)
* 在```config```文件中设置每个仓库的Host

```shell
Host github.com-GJ9117
    User git
    HostName github.com
    IdentityFile ~/.ssh/id_rsa_gj9117@gmail.com
```
Host后面配置的标识作用于在git remote add 时填写的git地址的前半部分所要更换的内容

```shell
git remote add GJ9117 git@GJ9117:GJBlog/LearnGit.git
```

##### 2、配置不同网站仓库

* 仅仅在```.ssh```文件夹下```config```的文件中添加多个如下即可。

```shell
Host github.com-GJ9117(标识)
    User git
    HostName github.com
    IdentityFile ~/.ssh/id_rsa_gj9117@gmail.com(对应sshKey的公钥)

```

**参考资料**

* [一个项目push到多个远端Git仓库](https://segmentfault.com/a/1190000011294144)

* [git 给远程库 添加多个url地址](https://my.oschina.net/shede333/blog/299032)

* [ERROR: Permission to XXX.git denied to user](https://www.jianshu.com/p/12badb7e6c10)