## 分支

> 分支分为：特性分支、、、

#### 特性分支(Feature Branch)

> 试验性、探索性的功能开发
>
> 功能复杂、开发周期长(有可能在本次发布中取消)
>
> 会更改软件体系架构、破坏软件集成
>
> 容易导致冲突、影响他人开发进度的模块

#### 卖主分支(Vendor Branch)

> 是指在版本库中创建一个专门和上游代码进行同步的分支，一旦有上游代码发布就捡入到卖主分支中

### 分支操作

```shell
用法1：git branch
用法2：git branch <branchname> 
用法3：git branch <branchname> <start-point>
用法4：git branch -d <branchname>
用法5：git branch -D <branchname>
用法6：git branch -m	<old branch> <new branch>
用法7：git branch -M <old branch> <new branch>
```

> 用法1：用于显示本地分支列表，当前分支在输出中会显示为特别的颜色，并用星号*标识
>
> 用法2和用法3用于创建分支，用法2基于当前头指针(HEAD)指向的提交创建分支，新分支的分支名<branchname>，用法3基于提交<start-point>创建新分支，新分支的分支名为<branchname>
>
> 用法4和用法5用于删除分支。用法4在删除分支<branchname>时会检查所需要删除的分支是否已经合并到其他分支中，否则会拒绝删除。用法5会强制删除分支<branchname>即使该分支没有合并到任何一个分支中。
>
> 用法6和用法7用于重命名分支。如果版本库中已经存在名为<new branch>的分支，用法6会拒绝执行重命名，而用法7会强制执行

#### 创建分支

* 第一种方式

```shell
# 创建分支branchname
git branch <branchname>
# 切换branchname分支
git checkout <branchname>
```

* 第二种方式

```shell
# 创建并切换分支
git checkout -b <newbranch> <start-point>
```



