# 04-HTML表单
###一、
1. 按钮
    * 普通按钮：value设置标题，配合JS完成操作\

    ```html
    <input type="button" value="我是按钮" onclick="alert(123);">
    ```
    * 图片按钮：src设置图片，配合JS完成操作

    ```html
    <input type="image" src="a.png">
    ```
    * 重置按钮：用于清空表单中已经填写好的数据，可以通过修改value,改变按钮标题
    
    ```html
    <input type="reset" value="清空">
    ```
    * 提交按钮：将表单中填写好的数据，提交到远程服务器。注意点：
        - 需要给form表单添加一个action的属性，通过这个action属性指定需要提交到的服务器地址
        - 需要给提交到服务器的表单元素添加一个name属性

    * 隐藏域：配合提交按钮将一些数据默默提交到服务器。
    
    ```html
    <input type="hidden" name="上传字段" value="值">
    ``` 
2. Label标签
    * 默认情况下文字和输入框没有关联，通过关联文字和输入框，点击文字就可以让输入框获得焦点。
    * 绑定的格式：
        1. 将文字利用label标签包裹起来
        2. 给输入框添加一个id属性
        3. 在label标签中通过for属性和输入框中的id进行绑定

        ```html
        第一种方式
            <label for="account">账号：</label>
            <input type="text" name="userName" id="account">
        第二种方式
            <label>
                账号：<input type="text">
            </label>
        ```
3. datalist标签：给输入框绑定待选项
    datalist格式：
    
    ```html
    <input type="text" list="绑定属性值">
    <datalist id="绑定属性值">
        <option></option>
        <option></option>
        <option></option>
    </datalist>
    ```
    给输入框绑定待选列表
    
    1. 给datalist列表标签添加一个id属性
    2. 给输入框添加一个list属性，将datalist的id对应的值赋值给list属性即可。
4. select标签：用于定义下拉列表
    格式：
    
    ```html
        <select>
        <optgroup label="分组名称">
        <option>列表数据</option>
        </optgroup>
    </select>
    ```
注意点：
    * 下拉列表不能输入内容，只能选择列表中内容
    * 给option标签添加selected属性指定列表中的默认选项
    * 给option标签中包裹一层optgroup标签来给下拉列表中的数据分类

5. textarea标签：定义一个多行输入框
    格式：
    
    ```html
    <textarea>
    </textarea>
    ```
注意点：
    * 默认情况下输入框可以无限换行
    * 默认情况下输入框有自己的宽度和高度
    * 可以通过cols和rows来指定输入框的宽度和高度，但是依然可以无限制输入
    * 默认情况下输入框是可以手动拉伸的

6. input标签中
    * name  值代表对应服务器端字段值
    * value 值代表的是对应服务器端字段对应的值
    * 单选框和多选框中的name值都需要制定相同的name值

7. fieldset标签：可以给表单添加一个边框
    legend可以给边框指定一个标题
    
    ```html
        <fieldset>
        <legend>注册页面</legend>
    ```
8. video标签：播放视频
    格式1：
    
    ```html
    <video src="">
    </video>
    ```
    格式2：(为了兼容浏览器对视频格式的支持)
    video支持三种视频格式，可以把三种格式都通过source标签指定给video标签，那么浏览器在播放视频时他会从中选择一种自己支持的格式来播放
    
    ```html
    <video>
        <source src="sb1.webm" type="video/webm"></source>
        <source src="sb1.mp4" type="video/mp4"></source>
        <source src="sb1.ogg" type="video/ogg"></source>
    </video>
    ```
    
    属性
     * src：指定video标签需要播放的视频地址
     * autoplay：指定video标签是否需要自动播放
     * controls：指定video标签是否需要显示控制条
     * poster：指定video标签视频没有播放之前显示的占位图片
     * loop：常见于广告视频，指定video标签视频播放完毕之后是否需要循环播放
     * preload：预加载视频，但是需要注意preload和autoplay相冲，如果设置了autoplay属性，那么preload属性就会失效
     * muted：静音
     * width/height：同img标签
9. audio标签：播放音频
    格式1：
    
    ```html
        <audio src="">
        </audio>
    ```
    格式2：
    
    ```html
    <audio>
        <source src="" type="">
    </audio>
    ```
    
    注意点：
    audio标签的使用已基本上跟video标签是一样的，除了有三个属性不能用，分别是height、width、poster
    
    
10. 详情和概要标签：利用summary标签来描述概要信息，利用details标签来描述详情信息，默认情况下是折叠展示。
        格式：
        
    ```html
    <details>
        <summary>概要信息</summary>
        详情信息
    </details>
    ```
        
11. marquee标签：跑马灯效果
    格式：
    
    ```html
    <marquee behavior="" direction="">
        郭杰
    </marquee>
    ```
    属性：
    * direction：设置滚动的方向(left、right、up、down)
    * scrollamount：设置滚动属性，值越大越快
    * loop：设置滚动次数，默认是-1，也是无线滚动
    * behavior：设置滚动类型，slide滚动到边界就停止，alternater滚动到边界就弹回

12. HTML5废弃的标签
    b、u、i、s 都被废弃
    替换的有语义的标签为：
    b --> strong：定义重要性强调的文字
    u --> ins(inserted)：定义插入的文字
    i --> em(emphasized)：定义强调的文字
    s --> del(deleted)：定义被删除的文字

13. 字符实体
    在HTML中不能在浏览器中直接显示出来的，就必须要通过字符实体来显示出来。
    * \&nbsp;表示一个空格，一个\&nbsp;就是一个空格，有多少个\&nbsp;就有多少个空格
    * \&lt;：表示<(less than)
    * \&gt;：表示>(greater than)
    * \&copy;：表示版权符号

    



