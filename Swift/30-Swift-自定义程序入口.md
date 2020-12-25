## iOS程序入口

* 在AppDelegate上面默认有个@main标记(xcode12开始，xcode12之前是@UIApplicationMain)，表示编译器会自动生成入口代码(main函数代码)，自动设置为AppDelegate为App的代理
* 也可以支持删除@UIApplicationMain，自定义入口代码，新建一个main.swift文件

```swift
UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  nil,
                  NSStringFromClass(AppDelegate.self))
```

