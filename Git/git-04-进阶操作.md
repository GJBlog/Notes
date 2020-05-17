# 进阶操作

##### 1、创建标签

* 将分支切换到需要打标签的分支上
* 执行如下操作

```shell
git tag v1.0(标签名称)
```
##### 2、创建带有说明的标签

```shell
git tag -a v0.1(标签名) -m "version 0.1 released"(标签说明信息) 1094adb(commit id)
```

##### 3、查看所有标签列表

```shell
git tag
```

##### 4、为历史提交创建标签

* 先找到历史提交对应```commit id```

```shell
git log --pretty=oneline --abbrev-commit
```
* 创建标签

```shell
git tag v1.1(标签名称) e25b670(commit id)
```

##### 5、查看具体标签信息

```shell
git show <tagname>
```
##### 6、删除本地标签

```shell
git tag -d <tagname>
```

##### 7、推送tag到远端

```shell
// 推送单个标签
git push origin <tagname>
// 推送所有未推送过的本地标签
git push origin --tags
```
##### 8、删除远端标签

```shell
git push origin :refs/tags/<tagname>
```

##### 9、查看.gitignore检查

```shell
git check-ignore -v App.class(文件名)
```
##### 10、配置别名

```shell
git config --global alias.XXX(别名) 'reset HEAD'(命令)
```

##### 11、git clean

> 用于从工作目录中删除所有没有被tracked过的文件

```shell
# 仅仅用于显示那些文件会被删除，不会真正删除
git clean -n
# 删除当前目录下所有没有track过的文件，不会删除.gitignore文件里面的文件夹和文件
git clean -f
# 删除指针路径下的没有被track过的文件
git clean -fd
```

