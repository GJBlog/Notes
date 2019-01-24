# Redux-logger

#####1、使用方式
#######1、引用'redux-logger',导入函数 createLogger,创建logger

```js
import { createLogger } from 'redux-logger'
const logger = createLogger({
    //…………options
})

```

#######2、使用默认引入方式

```js
import logger from 'redux-logger'
const store = createState(
    reducers,
    applyMiddleware(thunkMiddleware,logger)
)
```

