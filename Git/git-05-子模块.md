# 子模块

> 子模块允许你将一个Git仓库作为另一个Git仓库的子目录，它能让你将另一个仓克隆到自己的项目中，同时保持独立

#### 添加子模块

```shell
git submodule add 仓库地址
```

> 会自动添加子模块文件夹和.gitmodules文件，同时会在config中添加子模块信息

#### gitmodules

> 该配置文件保存了项目URL与已经拉取的本地目录之间的映射

可以通过git config submodule.url 设置私有url来覆盖.gitmodules中的url

#### 克隆包含子模块的项目

> 克隆时，默认会包含该子模块的目录，但是中目录中没有任何文件

此时必须运行2个命令：

* git submodule init：用来初始化本地配置文件
* git submodule update：用来从该项目中抓取所有数据并检出父项目中列出的合适的提交

或者在克隆主工程时，添加--recurse -submodules，会自动初始化并更新仓库中的每一个子模块，包括可能存在的嵌套子模块

* git clone --recurse -submodules git@github.com:GJBlog/GitMainProject.git

如果你已经克隆了项目但忘记了 `--recurse-submodules`，那么可以运行 `git submodule update --init` 将 `git submodule init` 和 `git submodule update` 合并成一步。如果还要初始化、抓取并检出任何嵌套的子模块， 请使用简明的 `git submodule update --init --recursive`

运行 `git submodule update --remote`，Git 将会进入子模块然后抓取并更新。

####  子模块URL失效

```shell
# 将.git/config中的信息与.gitmodules中的信息重新同步
git submodule sync --recursive
```

