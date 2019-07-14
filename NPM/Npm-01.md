### NPM Config

####  命令行参数

* **--foo bar**: 指代foo配置的参数为"bar"
* 使用**--flag1**而不指定任何值将值默认指代为**true**
* **--flag1 --flag2**：指将两个配置参数都设置为**true**,而**--flag1 --flag2 bar**将**flag1**设置为true,将**flag2**设置为**bar**，如果是**--flag1 --flag2 -bar**将两个配置参数都设置为**true**且**bar**被视为命令参数

#### 环境变量

* 以**npm_config_**开头的所有的环境变量都是被解释为配置参数。例如，在环境变量中放置**npm_config_foo=bar**会将**foo**配置参数设置为**bar**
* 任何没有被赋值的环境变量都是**true**
* 任何环境变量的值都不区分大小写，但是npm会优先采用小写形式值

#### Config默认值

* 使用**npm config ls -l**查看**npm**的配置参数信息

#### 配置设置

* access(访问)：值分为public(公共)和restricted(受限)，默认值是retricted(受限)
* allow-same-version：默认false


