### App的重签名

在有些情况下，我们或许会需要对AppStore下载的App或者其他App有重签名的操作，比如说在分发某个App的ipa包，并没有修改App的源码，因为看不到App的源码，无法直接使用自己的账号来打包，这个使用就需要使用到App的重签名！那么通常的重签名方式都有哪些呢？

##### 1、ios-app-signer 工具

工具界面如下所示，

* input File：选择对应的.ipa包
* Signing Certificate：选择对应的证书
* Provisioning Profile：选择对应的描述文件
* 其他选项都是可选

![ios-app-signer](/Users/guo/Notes/iOS/images/ios-app-signer.png)


##### 2、sigh脚本

* 通过 Homebrew 安装 ruby 

```bash
brew install ruby
```

* 安装sigh

```bash
sudo gem install sigh
```

* 使用步骤
    * 在终端输入 ```bash sign``` 回车

    ```bash
    [WARNING] You are calling sigh directly. Usage of the tool name without the `fastlane` prefix is deprecated in fastlane 2.0
Please update your scripts to use `fastlane sigh resign` instead.
[21:27:40]: Path to ipa file:
    ```
    
    * 继续输入相关.ipa文件所在path路径，或者直接将文件拖入该行中，回车

    ```bash
    [20:32:26]: Available identities:
	iPhone Distribution: XXXXXXX
		XXXXXXXXXXXX
    [20:32:26]: Signing Identity:
    ```
    
    * 填写相关的证书名称，回车

    ```bash
    [20:32:26]: Signing Identity: iPhone Developer: XXXXX
    ```
    
    * 填写相关的描述文件，回车
    
    ```bash
    [20:32:36]: Path to provisioning file: XXXXXXXX
    ```
    * 提示完成

    ```bash
    [20:33:12]: Successfully signed /Users/XXX/Desktop/aaa.ipa!
    ```



