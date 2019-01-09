## Fetch

#### 基本请求

```js
fetch('http://gjblog.com/applicationInfo.json')
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  });
```

* 参考来源：
    * [Fetch使用](http://blog.51cto.com/zhuxianzhong/2125523)


