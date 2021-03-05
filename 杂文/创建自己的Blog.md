### 创建属于自己的Blog

目前主流的Blog有两种，一个是Hexo，一个是Jeklly

#### Hexo



#### jeklly

##### 它的安装非常简单，仅仅下面一行搞定

```shell
// 安装jeklly及其对应gems依赖
gem install jeklly bundler
```

##### 创建Blog

```
jeklly new XXX(Blog的名字)
```

##### 本地运行(预览)

```
cd XXX(Blog的名字)
bundle exec jekyll serve
```

##### 如何在GitHub Pages中设置自定义域名

大概有如下步骤

1、需要有域名，这里可以申请的域名有很多种，包括

* 收费DNS
* 免费DNS：[Cloudflare](https://dash.cloudflare.com/)

获取到域名后，只需要在

##### 如何获取免费域名

* 收费域名申请
* 免费域名申请：[freenom](www.freenom.com)



**注意**

* Ruby.version >= 2.4

