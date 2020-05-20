## 子树(subtree)

> 用于对主仓库的拆分

#### 用法

```shell
# 添加子仓库
git subtree add --prefix=A B C [--squash]
git subtree add --perfix=libtree https://github.com/GJBlog/git_learn_libtree.git master [--squash]
---------
A：(也就是prefix)指向的是本地存放子仓库的目录
B：子仓库的远端地址
C：子仓库的远端分支
[--squash]：如果在添加时指定，则后续对子树使用时都需要添加，不然会失败
```

```shell
# 同步远端子仓库
git subtree pull --prefix=A B C [--squash]
```
```shell
# 推送本地子仓库
git subtree push --prefix=A B C [--squash]
```

```shell
# 拆分子仓库
git subtree split -P LibraryC -b tempLibraryC
```

#### 优点

* 拷贝主仓库后，可以直接使用，在使用时可以当做普工主仓库文件夹来看待
* 对于使用者而言可以不关注子树依赖，对使用者无感知，不需要子仓库权限
* 子树不像子模块那样会添加很多额外文件，对主仓库无污染
* 对子仓库的同步可交由单独的维护者

#### 缺点

* 合并过程较复杂
* 返回历史版本稍显复杂
* 容易混淆提交主仓库、子仓库代码
* 推送子库到远端很慢，相当于对主仓库下某个子仓库的目录的提交记录进行分割，以找出子仓库的修改，这个过程有点慢，如果推送周期比较长倒是可以尝试。
* 需要添加多个远端，子仓库和远端没有地方存储映射关系
* 改子仓库的分支略坑