##### sourcetree的submodule在修改后无法显示的问题

-----

sourceTree，对我的submodule进行了修改，把原来的通过界面进行了删除，然后加入新的submodule，但是发现submodule那块区域，就无法显示新的内容了，什么都没有


查看.submodule里面的路径已经更新到最新的了，所以问题不在这
通过git submodule update执行命令，提示找不到原来删除的那个submodule路径，说明还有残留的配置的地方没有删掉


解决办法如下

.git文件夹下的config文件，查看内容会发现，原来的submodule配置在这个文件内依然存在
将其删除

执行
git rm --cached <这个位置跟着原来的存放路径，也就是上面update命令提示出来的那个残留路径>
————————————————
版权声明：本文为CSDN博主「iteye_3142」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/iteye_3142/article/details/82650089

[来源](https://blog.csdn.net/iteye_3142/article/details/82650089)