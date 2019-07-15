# TextKit

## 概念

* 用于绘制文本的框架
* 包含 UILabel、UITextField 等控件的 UIKit 框架（用于 iOS），以及包含 NSTextView 等控件的 AppKit 框架（用于 Mac OS），都是基于 TextKit 构建。在使用上面的文本控件时，其实就是在使用 TextKit，它协同 Core Text、Core Graphics 以及 Foundation提供强大文本展示能力


## 结构

* 整体也是MVC的涉及结构，是由storage、layout、display三部分组成

### Model层

##### NSTextStorage

* 持有字符串的数据和属性信息，是```MutableAttributedString```子类

##### NSTextContainer

* 负责模型化文本布局的地理位置、区域信息

### Controller层

##### NSLayoutManager

* 控制文本的布局

### View层

##### Display

* 负责文本的展示

## 布局过程

#### 属性修正

* 确保这段文本所选择的字体支持显示文本中的所有字符，如果不支持则相应替换

#### 字形生成

#### 字形布局

#### 文本展示

    
## 完整TextKit组件结构


* Text Container 持有 Text View 的弱引用，而 Text View 通过根 Text Storage持有整个布局树结构


## 参考

* [WWDC 2018：TextKit 最佳实践](https://juejin.im/post/5b27451a51882574eb597e04)

