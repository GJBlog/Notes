## 手动下载Xcode SDK

1、先安装显示xcode SDK list 的组件

```shell
brew install xcodesorg/made/xcodes
```

2、执行该组件

```shell
xcodes runtimes --include-betas
```

3、使用Apple官方安装命令

```shell
xcodes runtimes install "iOS 16.4"
```

#### 参考来源

1、[组件地址](https://github.com/actions/runner-images/issues/8402)

2、[Apple工具文档](https://github.com/XcodesOrg/xcodes/tree/1.4.1#install-runtimes-)
