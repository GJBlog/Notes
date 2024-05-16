## Module(模块)

通过 import 文件名来使用该文件中的内容

通常，1个文件就是1个模块，文件名就是模块名(建议全小写)

#### import

* Import 模块 as 别名

* Import 后面可以跟上多个模块名

```python
import 模块1, 模块2, ...
```

建议 import 后面只导入1个模块

* from 模块 import 名称 as 别名
* from 模块 import 名称1, 名称2, ....
* from 模块 import *

如果从不同模块导入了相同的名称，那么后导入的会覆盖掉前导入的

* 可以通过```__all__ = [名称1，名称2, ...]``` 控制 import * 的内容

#### 导入模块

##### 在1个python程序中

* 有且只有1个模块作为程序入口被直接运行，我们称为主模块(main module)
* 剩下的其他模块，只能作为辅助模块，被主模块直接或间接导入

##### 不管模块被 import 多少次

* 模块中的代码只会被执行1次
* 模块只会被初始化1次

##### 要避免循环导入

* 比如A导入B，B导入A

#### 模块的内置变量

* ```__file__```：模块的完整文件路径
* ```__name__```:  
  * 当直接执行该模块时，值为：```__main__```
  * 当被其他模块导入时：值为：模块名

#### `__name__` 使用

用于：在自定义模块文件中，编写**测试**代码，当该模块被其他模块引用时，如果没有**测试**代码不在`if __name__ == '__main__':`中，那么被引入时会被自动执行，但是当放置到`if __name__ == '__main__':`中则只会在当前模块中执行时才会运行

```python
if __name__ == '__main__':
    test1(20, 10)
```

#### `__all__`使用

用于在自定义模块中，被`__all__`指定的函数名，在其他模块中通过`import *`导入该模块时，只会导入在`__all__`列表中指定的函数，未指定的则无法使用

```python
# my_module1.py 文件
def test1(a, b):
    print(a + b)

def test2(a, b):
    print(a * b)

__all__ = ["test1", "test2"]
```

#### 注意事项

不同模块都通过 import XX方式导入相同的xx名称，那么最后通过import XX 导入的部分会覆盖掉之前导入的部分

```python
from my_module1 import test1
from my_module2 import test1

test1(10, 20) # test1实际执行的是来自my_module2中的test1函数实现
```

