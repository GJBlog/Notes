# 模板语法

因为Vue是基于HTML的模板语法，所以开发者可以声明式的将DOM绑定至底层Vue实例的数据。

在底层，Vue会将模板编译成虚拟DOM渲染函数。结合着响应系统，Vue能够智能的计算出最少需要重新渲染多少组件，并把DOM操作次数减到最少。

除了模板语法，也可以直接写渲染函数，使用JSX语法。

## 插值

* 使用Mustache语法(双大括号)方式

    ```html
    <div>{{message}}</div>
    或者
    <div v-text="message"></div> 
    ```
数据对象上message的值会始终让页面上显示保持更新。

* 显示原生HTML文本，标签不生效

    ```html
    <div v-html="rawHtml"></div>
    ```
该div的内容将会显示数据对象上rawHtml的值

## 指令

是指带有**v-**前缀的特殊特性。常见的有如下指令

* v-if

    ```html
    <p v-if="show"></p>
    ```
    通过在数据对象中对show值的控制，来决定当前p标签是否在页面上被渲染。
    
* v-else、v-else-if

    ```html
    <div v-if="show"></div>
    <p v-else></p>
    <span v-else-if="XXX"></span>
    ```
    上面三个指令再使用时中间必须紧挨着，不能插进其他标签语句。
    
## 缩写

* **v-bind**缩写

    ```html
    <!--完整写法-->
    <div v-bind:class="XX"></div>
    <!--缩写-->
    <div :class=""></div>
    ```

* **v-on**缩写

    ```html
    <!--完整写法-->
    <div v-on:click="handleDivClick"></div>
    <!--缩写-->
    <div @click="handleDivClick"></div>
    ```
## javaScript表达式

表达式允许在所属的Vue实例的数据作用域下座位javaScript被解析，但是每个绑定都只能包含单个表达式

```html
<!-- 这是语句，不是表达式,❌ -->
{{ var a = 1 }}

<!-- 流控制也不会生效，请使用三元表达式，❌ -->
{{ if (ok) { return message } }}
```

