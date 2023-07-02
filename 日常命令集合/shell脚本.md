## Shell脚本

sh脚本可以通过sh、bash、source 命令名来执行sh脚本文件

```shell
# test.sh中
cd ~/Desktop
ls -l
```

#### sh bash

* 当前shell 环境会启动一个紫禁城来执行脚本文件，执行后返回到父进程的shell环境
* 执行cd时，在子进程中会进入到cd的目录，但是在父进程中环境并没有改变，也就是书记目录没有改变

#### source

* 在当前的shell环境喜爱执行脚本文件
* 执行cd后会跳转到cd的目录
* source可以用一个点"."来替代，比如：". test.sh"，经过验证，在Mac中需要 ./test.sh 才可以