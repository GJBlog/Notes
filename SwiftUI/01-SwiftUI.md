### SWiftUI

@State：用于View中的私有状态值，一般来说它修饰的都是struct类型，不应该被



### Layout

布局步骤：

1、父视图给子视图一个提议建议size

2、子视图选择自己的size

3、父视图放置子视图在自己的坐标空间中

### Data

在设计一个数据模型时，通常需要考虑以下三个问题

1、这个视图需要什么数据来完成它的工作(What data does this view need to do its job?)

2、视图将如何操作这些数据(How will this view manipulate that data?)

3、数据从何而来(Where will the data come from?)

三种工具用于创建对**ObservableObject**的依赖关系

1、**@ObservedObject**：修饰持有符合ObservableObject类型的视图的属性，使用它可以通知SwiftUI开始跟踪视图的依赖属性，需要自己维护生命周期

2、**@StateObject**：将ObservableObject的生命周期绑定到view中，被创建其的View所持有的

3、**@EnvironmentObject**：在父视图中传入model，则所有的子视图中都可以直接使用，并且不需要一层一层传递，模型必须接遵守 ObservableObject 协议



```swift
// 父视图
@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            BackgroundAndOverlay().environmentObject(Model(name: "GJ"))
        }
    }
}
// 子视图
struct SubView: View {
    @EnvironmentObject var data: Model
    var body: some View {
        Text("name = \(data.name)")
    }
}
// 定义model
class Model: ObservableObject {
    var name: String
    init(name: String) {
        self.name = name
    }
}
```







#### 相关资料

[地址](https://my.oschina.net/u/4662964/blog/4649446)

