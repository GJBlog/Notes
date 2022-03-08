## 表单

### 常用元素
![image-20220307010831412](/Users/guo/Notes/HTML/HTML5+CSS3/images/表单_01.png)

### form的常用属性

![image-20220309013512389](/Users/guo/Notes/HTML/HTML5+CSS3/images/form_01.png)

### get和post

![image-20220309013624957](/Users/guo/Notes/HTML/HTML5+CSS3/images/get_post_01.png)

### input常用元素

![image-20220308234743529](/Users/guo/Notes/HTML/HTML5+CSS3/images/input_常用元素.png)

* 对于radio按钮说来，同一种类型的radio、name的值要保持一致，才能实现单选功能
* 对于checkbox按钮来说，同一种类型的checkbox、name的值要保持一致

### input和label

* **label**元素一般跟**input**配合使用，用来表示**input**的标题
* **label**可以跟某个input绑定，点击label就可以激活对应的input

```html
<label for="phone1">手机：</label>
<input id="phone1" type="text" name="phone" value="666">
```

另一个种写法

```html
<label for="username">
  用户名：
	<input id="username" type="text" name="username">
</label>
```

**必须保证input中指定的id值与label中的for的值一致才有效果**

### 按钮

![image-20220309005031346](/Users/guo/Notes/HTML/HTML5+CSS3/images/按钮_01.png)

##### 去除input的Tab键选中效果

* 去除轮廓样式

```css
input {
   outline: none;
}
```

* 或者将对应标签|元素的tabindex的属性值设置为-1

### textarea

![image-20220309010319269](/Users/guo/Notes/HTML/HTML5+CSS3/images/textarea_01.png)

### select和option

![image-20220309012844264](/Users/guo/Notes/HTML/HTML5+CSS3/images/select_option_01.png)

### fieldset和legand

![image-20220309013337173](/Users/guo/Notes/HTML/HTML5+CSS3/images/fieldset_legand_01.png)

### 隐藏域type=hidden

![image-20220309074628185](/Users/guo/Notes/HTML/HTML5+CSS3/images/隐藏域_01.png)

#### 注意点

文件上传的必要条件

1、method="post"

2、enctype="multipart/form-data"

3、input要有name值