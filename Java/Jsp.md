## JSP

*  JSP 是 JavaServer Pages 的简称，是一种动态网页技术标准
#### 指令

*  `<%@ page %>` : 配置当前页面信息
* `<% include %>`: 包含其他页面
* `<% taglib %>`: 导入标签库

#### 嵌入Java代码

* `<% Java代码 %>`

#### 输出

* `<%= 需要输出的内容 %>` 等价于out.prite(需要输出的内容)

#### 注释

* `<%-- 注释内容 --%>`
* HTM、CSS、JS注释照常使用

#### 声明

* `<%! 声明成员变量、方法 %>`