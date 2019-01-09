### 组件注册


#### 组件名

遵循W3c规范中的字母全小写且必须包含一个连字符。

* kebab-case (短横线分隔命名)

```vue
<!--定义组件-->
Vue.component('my-component-name', {/***/}
<!--引用组件-->
<my-component-name>
```

* PascalCase (首字母大写命名)

```vue
<!--定义组件-->
Vue.component('MyComponentName', {/***/}
<!--使用组件-->
<my-component-name> 或者 <MyComponentName>
```

###### 注意

* 直接在 DOM (即非字符串的模板) 中使用时只有 kebab-case 是有效的。

