使用

1、打印某个plist文件的内容

```shell
# 打印所有
/usr/libexec/PlistBuddy  -c 'Print' Info.plist
# 打印某一个key：CFBundleIdentifier
/usr/libexec/PlistBuddy  -c 'Print :CFBundleIdentifier' Info.plist
```

2、打印keychain中安装的所有证书

```shell
security find-identity -v -p codesigning
```



总结流程

1、获取新的BundleID对应的描述文件，修改文件名称为embedded.mobileprovision

```shell
# mv 旧的描述文件 新的描述文件
mv 127c5eed-5319-48af-8d21-0886a95d78d3.mobileprovision embedded.mobileprovision
```

2、从 mobileprovision 中提取出完整权限文件

```shell
security cms -D -i embedded.mobileprovision > entitlements_full.plist
```

3、从完整权限文件中提取签名需要的权限文件

```shell
/usr/libexec/PlistBuddy -x -c  'Print:Entitlements' entitlements_full.plist > entitlements.plist
```

4、修改App包中info.plist的BundleID值为描述文件对应的值

```shell
/usr/libexec/PlistBuddy  -c 'set :CFBundleIdentifier 新的BundleID值' Payload/TestDemo1.app/Info.plist
```

5、替换embedded.mobileprovision 文件

```shell
cp -i embedded.mobileprovision Payload/TestDemo1.app/embedded.mobileprovision
```

6、针对App中的Framework、App的二进制文件重新签名（这里可能存在其他action要签名的情况）

```shell
codesign --continue -f -s "Apple Development: 641102478@qq.com (R7A9V9A39N)" --entitlements entitlements.plist Payload/TestDemo1.app
```

7、验证签名是否正确

```shell
codesign --verify Payload/TestDemo1.app
```

8、打包ipa

```shell
zip -ry newTest.ipa Payload/TestDemo1.app
```

9、安装ipa到当前连接的设备

```shell
ideviceinstaller -i newTest.ipa
```

