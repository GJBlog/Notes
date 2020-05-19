### git reset



#### 用法1

```shell
git reset [-q][<commit>][--]<paths>
```

>省略 commit，则相当于使用HEAD,
>
>不会重置引用，更不会更改工作区，而是用提交状态<commit>下的文件<paths>替换到的暂存区的中的文件

#### 用法2

```shell
git reset[--soft|--mixed|--hard|--merge|--keep][-q][<commit>]
```

> 省略 commit，则相当于使用HEAD，会重置引用

* hard：git reset --hard <commit>

  1、会替换引用的指向，引用指向新的提交ID

  2、替换暂存区，替换后，暂存区中的内容和引用指向的目录树一致

  3、替换工作区，替换后，工作区的内容变得和暂存区一致，也和HEAD所指向的目录树内容相同

* soft：git reset --soft <commit>

  1、只更改引用的指向，不改变暂存区和工作区

* mixed：git reset --mixed

  1、更改引用的指向

  2、重置暂存区

  3、不改变工作区