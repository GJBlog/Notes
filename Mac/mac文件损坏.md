## 文件损坏

### 修复方案

1、终端设置

```shell
sudo spctl --master-disable
```

2、针对打开失败软件设置权限

```shell
sudo xattr -d com.apple.quarantine /Applications/xxxx.app
```

#### 来源

[地址](https://ssshuos.com/mac-dmg-problem/)