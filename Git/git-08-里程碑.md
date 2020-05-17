## Git-里程碑(Tag)

> 三种形式：轻量级里程碑、带注释的里程碑、带签名的里程碑

#### Tag列表

```shell
# 不带任何参数执行，为显示当前版本库的tag列表
git tag
# 使用-n<num>参数，为显示最多<num>行的里程碑说明
git tag -n1
```

#### 输出带Tag的log日志

```shell
git log --decorate
```

#### git describe

> 将提交显示为一个易记的名称，这个易记的名称来自于建立在该提交上的里程碑。如果没有对应的里程碑，但是在其祖先版本上建有里程碑，则使用类似<tag>-<num>-g<commit>的格式显示

```shell
git describe
```

#### git name-rev

> 会显示提交ID和其对应的一个引用，默认优先使用分支名，除非使用--tags参数

```shell
git name-rev
```

#### 创建里程碑

```shell
用法1：git tag <tagname> [<commitId>]
用法2：git tag -a <tagname> [<commitId>]
用法3：git tag -m <tagname> [<commitId>]
用法4：git tag -s <tagname> [<commitId>]
用法5：git tag -u <key-id> <tagname> [<commitId>]·
```

>用法1：创建轻量级里程碑
>
>用法2和用法3相同，都是创建带说明的里程碑。其中用法3直接通过-m参数提供里程碑创建说明。
>用法4和用法5相同，都是创建带GnuPG签名的里程碑。其中用法5用-u参数选择指定的私钥进行签名。
>创建里程碑需要输入里程碑的名字（＜tagname＞）和一个可选的提交ID（＜commit＞）。
>如果没有提供提交ID，则基于头指针HEAD创建里程碑。

#### 查看Tag的提交日志

```shell
git log -1 --pretty=oneline mytag2
```

#### 删除Tag

```shell
git tag -d mytag
```

#### 补救删除的Tag

```shell
git tag <tag名称> tag对应的提交ID
```

#### 推送里程碑到远端

```shell
# 推送某一个tag
git push origin <tagname>
# 推送所有本地里程碑
git push origin refs/tags/*
```

#### 删除远端里程碑

```shell
git push <remote_url>:<tagname>
```

#### 引用表达式

> 所谓引用表达式就是用冒号分割的引用名称或通配符

#### 查看远端共享库中的里程碑

```shell
git ls-remote origin my*
```

#### 检查引用名称是否规范

```shell
# 若结果为0，表示引用名称符合规范
# 若结果为1，表示引用名称不符合规范
git check-ref-format
```



#### 里程碑的命名规范

* 不要以符号*-*开头
* 可以包含路径分隔符*/*，但是路径分隔符不能位于最后
* 不能出现两个连续的*.*，因为两个连续的*.*被用于表示版本范围
* 不能再里程碑命名的最后出现*.*
* 不能使用使用特殊字符，比如空格、波浪线、脱字符(^)、冒号、冒号、星号、方括号、删除字符、小于符号等



#### 注意点

* 里程碑可以被强制更新，当里程碑被改变后，已经获取到里程碑的版本库再次使用获取或者拉取操作，不能自动更新里程碑
* 远程版本库中的里程碑同步到本地版本库，会使用同样的名称，而不是像分支那样移动到另外的命名空间