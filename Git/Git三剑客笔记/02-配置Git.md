# 02-配置Git

### git config

#### 配置参数

```shell
git config --参数
```

1. --local：只对某个仓库有效
2. --global：对当前用户所有仓库有效
3. --system：对系统所有登录的用户有效
4. 缺省等同于 local

#### 显示配置信息

```shell
git config --list --local
git config --list --global
git config --list --system
# 仅仅显示部分内容，而不是全部的配置内容
git config --local user.name
```
### 新建仓库

##### 把已有的项目代码纳入Git管理

```shell
cd 项目文件夹
git init
```

##### 新建的项目直接用Git管理

```shell
cd 某个文件夹
git init your_project #在当前路径下创建和项目名称同名的文件夹
cd your_project
```

### 流程

​					git add								git commit

工作目录  =============> 暂存区 =============> 版本历史



