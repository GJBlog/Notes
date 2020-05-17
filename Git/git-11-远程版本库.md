## 远程版本库

> Git允许一个版本库和任意多的版本库进行交互

#### 查看远端版本库的分支列表

```shell
git ls-remote --heads url
```

#### 注册远程版本库

```shell
git remote add 标识名 远端库地址
git remote add new-remote file:///xxxxx.git
git remote add --no-tags hello-world
```

#### 显示已经注册的远端版本库

```shell
git remote -v
```

#### 更改远程版本库的地址

* 第一种：手工修改.git/config文件
* 第二种：使用git config修改
* 第三种：使用git remote set-url new-remote 仓库地址

#### 可以为推送操作设置单独的url地址

```shell
git remote set-url --push new-remote /path/to/repos/hello-user2.git
```

#### 更改远程版本库的名称

```shell
git remote rename new-remote user2
```

#### 获取所有远程版本库更新

```shell
git remote update
```

#### 配置是否自动更新远程版本库

```shell
git config remote.user2.skipDefaultUpdate true
```

#### 删除远端版本库

```shell
git remote rm user2
```

#### 配置fetch时不获取里程碑信息

```shell
git fetch --no-tags file:///xxxx.git
```

#### 注意点

* 默认创建的待工作区的版本库都会包含core.logallrefuupdates为true的配置，这样在版本库中建立的每个分支都会创建对应的reflog。但是创建的裸版本库默认不包含这个设置，也就不会为每个分支设置reflog

