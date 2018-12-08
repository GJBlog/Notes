# 基本操作

##### 1、初始化

* 自动创建文件夹，并生成git版本库

```shell
git init 文件夹名称
```

##### 2、改动文件添加版本库

```shell
git add welcome.txt
```

##### 3、提交

```shell
// 有改动信息
git ci -m '提交信息'

// 无改动信息(空白提交)
git ci --allow-empty --allow-empty-message -m '提交信息'

// 对本地所有变更的文件执行提交操作，包括对本地修改文件和删除的文件，但是不包括未被版本库跟踪的文件
git ci -a
```

##### 4、修改提交信息

```shell
git commit --amend --allow-empty --reset-author
```

##### 5、查看log日志

```shell
git log --pretty=fuller

// 退出log日志
":" + "q"
```

##### 6、备份工作区

```shell
git clone 工作区文件夹名称 备份的工作区文件夹
```

##### 7、查看暂存区

```shell
git status -s(简洁方式)
```

##### 8、取消工作区文件修改

```shell
git checkout -- 文件名称
```

##### 9、查看HEAD指向的目录树信息

```shell
git ls-tree-l HEAD
```
**结果**

```shell
100644(文件属性rw-r--r--) blob(Git对象库中一个blob对象) b493a7f1744e9b001a540332a701c64a1df2bbab(该文件在对象库中对应ID)      18(文件大小)	welcome.txt(文件名)
```

##### 10、之前某个版本标识

```shell
HEAD：表示当前最新提交点
HEAD^：表示上一个提交点
HEAD^^：表示上上一个提交点
……
HEAD-100：表示往上100个提交点
```

##### 11、切换不同提交点版本

```shell
git reset --hard 标识
(标识：可以是HEAD或者文件对象库中的ID前几位，通常前6、7位左右)
git reset --hard HEAD^
git reset --hard b493a7
git reset --hard 上一版本HEAD^
git reset --hard 下一版本(标识)
```

##### 12、查看所有的提交记录

要想确定要回退的版本，通过```git log```查看历史
要想重返未来的版本，通过```git reflog```查看未来版本

```shell
git reflog
```

##### 13、添加远端仓库

```shell
git remote add origin(仓库别名) git@github.com:GJBlog/Notes.git(仓库地址)
```

##### 14、查看远端仓库地址

```shell
git remote -v
```

##### 15、删除远端库

```shell
git remote rm origin(仓库别名)
```

##### 16、本地仓库与远端仓库关联

```shell
git remote add origin git@github.com:GJBlog/LearnGit.git
```

##### 16、推送远端仓库

```shell
git push (-u) origin master
origin：远端仓库名称
master：远端仓库分支
-u：关联本地和远端仓库后第一次推送
```

##### 17、切换分支

```shell
git checkout 待切换分支名
```

##### 18、撤销暂存区修改，内容重新放回工作区

```shell
git reset HEAD 文件名
```

##### 19、从版本库中删除文件

```shell
git rm 文件名
```

##### 20、创建新分支

```shell
git branch 分支名
```

##### 21、切换分支

```shell
git checkout 分支名
```

##### 22、创建新分支并切换到当前分支

```shell
git checkout -b 分支名
```

##### 23、拉取远端分支到本地

```shell
git checkout -b dev(本地分支名) origin/dev(远端分支名)
```

##### 24、建立本地分支跟远端分支的关联

```shell
git branch --set-upstream branch-name origin/branch-name
```


##### 25、推送本地分支到远端

```shell
git push origin(远端主机名) dev(本地分支名):dev(远端分支名)
git push origin(远端主机名) dev(本地分支名==远端分支名)
```

##### 26、查看所有分支

```shell
远端分支：git branch -a
本地分支：git branch
```

##### 27、删除本地分支

```shell
git branch (-d)(-D) 分支名
-D：强行删除
```

##### 28、删除远端分支

```shell
git push origin(远端主机名) --delete dev(远端删除分支名)
git push origin(远端主机名) :dev(远端待分支名)
```

##### 29、默认合并分支

```shell
git merge (--no-ff) dev(分支名)
合并dev(分支名)到当前分支
```

##### 30、禁用Fast forward模式合并分支

--no--ff：表示禁用```Fast forward```模式

```shell
git merge --no-ff -m "merge with no-ff" dev
```

##### 25、查看分支合并图

```shell
完整版：git log --graph
简化版：git log --graph --pretty=oneline --abbrev-commit
```

##### 26、贮藏当前文件

```shell
git stash
将当前工作区中所有改动的内容都贮藏

git stash list
展示已经贮藏的所有文件
```

##### 27、恢复贮藏内容

```shell
git stash apply stash@{0}
恢复贮藏内容，但是在贮藏列表中并不会删除

git stash pop
恢复贮藏内容，并且在贮藏列表中删除
```

##### 28、删除贮藏内容

```shell
git stash drop
删除单个贮藏内容

git stash clear
清空整个贮藏列表
```

##### 29、拉取远端分支

**取回远端主机某个分支的更新，并与本地的对应分支合并**

```shell
git pull origin(远端主机名) dev(远端分支名):(dev)(本地分支名)
```

##### 33、抓取远端分支

```shell

```


**注意点**

* 若文件仅仅在工作区修改，未提交到暂存区，则直接使用```git checkout -- 文件名```可以撤销修改。

* 若文件不仅在工作区修改，还提交到暂存区中，但是未```git commit```之前，则需要先使用```git reset HEAD 文件名```将修改内容撤回到工作区中，接着再使用```git checkout -- 文件名```将工作区中的修改丢弃，恢复到工作区改动之前。

* 当文件提交到版本库中，通过```git checkout```只能恢复文件到最新版本，会丢失最近一次提交后你的修改的内容。

* 通常情况下，合并分支时，如果可能Git会默认采用```Fast forward```模式，在这种模式下当删除分支后，会丢掉分支信息。如果强制禁用```Fast forward```模式，Git会在merge时生成一个新的commit提交,这样在分支历史中就可以看到分支信息。



