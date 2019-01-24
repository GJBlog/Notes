# 01-CSS标签
一、基础
1、好处：

* 不需要记忆哪些属性属于哪个标签
* 当需求变更时我们不需要修改大量的代码就可以满足需求
* 在前端开发中CSS只有一个作用，就是修改样式 

2、格式：
    
```html
<style type="test/css">
    标签名称 {
                属性名称：属性值;
                ……
            }
</style>
```
3、注意点：

* style标签必须写在head标签的开始标签和结束标签之间
* style标签中的type属性其实可以不用写，默认就是type="text/css"
* 设置样式时必须按照固定的格式来设置。key: value;其中;不能省略，除非是最后一行

4、文字属性：

* 设置文字样式属性，格式：font-style: italic;
        
   * 取值：
       normal:正常的，默认
       italic:倾斜的
   * 快捷键：
       fs  font-style: italic;
       fsn font-style: normal;
            
* 设置文字粗细属性，格式：font-weight: bold;

   * 取值：
       bold：加粗
       bolder：更加粗
       lighter：细线，默认
       100-900之间整百的数字
   * 快捷键： 
       fw  font-weight;
       fwb font-weight:bold;
            
* 设置文字大小属性，格式：font-size: 30px;

   * 单位：px(像素 pixel)
   * 注意点：通过font-size 设置大小一定要待上单位，即px
   * 快捷键：
       fz   font-size:;
       fz30 font-size: 3opx;
            
* 设置文字字体属性，格式：font-family："开楷体"
        
   * 注意点：
       * 如果取值是中文，需要用双引号或者单引号括起来
       * 设置的字体必须是用户电脑中已经安装的字体
       * 如果设置的字体不存在，而不想使用默认的字体来显示可以添加备选方案，
         格式：
         font-family:"字体1","备选方案1",…………;
       * 如果想给中文和英文分别单独设置字体，可以
         结论：
         但凡是中文字体，里面都包含英文
         但凡是英文字体，里面不包含英文
         中文字体可以处理英文，而英文字体不能处理中文
       * 常见的字体有：
         中文：宋体、黑体、微软雅黑
         英文：Times New Roman / Arial
   * 快捷键：
       ff font-family:; 
       
* 设置字体简写形式：font：style weight size family;
   * 注意点：
       * style可以省略、weight可以省略、style和weight的位置可以交换
       * size不能省略、family不能省略，size一定要写在family的前边，而且size和family必须写在所有属性的最后 
            
    5、 文字其余属性
    
   * 文本装饰属性
       * 格式：text-decoration：underline;
       * 取值：underline下划线、line-through删除线、overline上划线、none无
       * 快捷键：取每个单词的首字母
        
   * 文本水平对齐属性
       * 格式：text-align：right；
       * 取值：left、center、right
       * 快捷键：同上
        
   * 文本缩进属性  
       * 格式：text-indent:2em；
       * 取值：2em,其中em是单位，一个em代表缩进一个文字的宽度
       * 快捷键：同上
    
         
        
                

    



