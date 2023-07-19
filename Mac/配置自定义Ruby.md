## 配置可访问权限的Ruby

* 思想是：基于 brew，通过 brew 安装 Ruby，然后在环境变量中指定当前系统依赖的Ruby指向新安装的Ruby可执行文件
* 适用于 Mac M系列、Inter系列

##### 操作步骤

1、安装brew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

配置环境变量

```shell
//打开 .zshrc 或 .bash_profile 文件
export PATH="/opt/homebrew/bin:$PATH"
```

2、基于 brew 安装 Ruby

```shell
brew install ruby
```

安装后的提示信息

```shell
==> ruby
ruby is keg-only, which means it was not symlinked into /opt/homebrew,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have ruby first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc

For compilers to find ruby you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

For pkg-config to find ruby you may need to set:
  export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
==> qt
You can add Homebrew's Qt to QtCreator's "Qt Versions" in:
  Preferences > Qt Versions > Link with Qt...
pressing "Choose..." and selecting as the Qt installation path:
  /opt/homebrew
```

配置环境变量

```shell
//打开 .zshrc 或 .bash_profile 文件
export PATH="/opt/homebrew/Cellar/ruby/3.2.1/bin:$PATH"
```

##### 其他命令安装

1、Cocoapods

```shell
sudo gem install cocoapods
```

配置环境变量

```shell
//打开 .zshrc 或 .bash_profile 文件
export PATH="/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH"
```



#### 参数来源

1、[苹果M1/M2芯片安装CocoaPods](https://www.jianshu.com/p/270ecd9a9a25)

2、[猫哥-m1 silicon macos 安装 cocoapods](https://wiki.ducafecat.tech/blog/flutter-tips/3-m1-macos-install-cocoapods.html#_3-%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F)

