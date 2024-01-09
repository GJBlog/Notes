## iOS-符号化

### 具体操作步骤

##### 在 iOS 15以前

##### 1、查找 symbolicatecrash工具


```
find /Applications/Xcode.app -name symbolicatecrash
```

##### 2、使用方式

```shell
./symbolicatecrash crashFilePath dsymPath > crashSymbolFilePath
```

##### 在 iOS 15以后

##### 1、查找 CrashSymbolicator 工具

```shell
find /Applications/Xcode.app -name CrashSymbolicator -type f
```

##### 2、使用方式

```shell
python3 CrashSymbolicator.py -d /dSYMs -o /xxxSymbo.crash -p /xxxCrash.ips
```

##### 参考来源

* https://www.jianshu.com/p/921366b3390d
* [CrashSymbolicator](https://juejin.cn/post/7030619552211795982#heading-3)
* [通过ips分析crash](https://www.jianshu.com/p/3e8723fff641)
* [官方Crash文件分析](https://developer.apple.com/documentation/xcode/examining-the-fields-in-a-crash-report)

