# Effective Objective-C 2.0

#####一、对象所占内存总是分配在堆空间中(heap space),而不是在栈上(stack)
#####二、
* 编译单元内(.m文件)中声明内部使用的常亮时：k+常量名称

```
static const NSTimeInterval kAnimationDuration = 0.3;
```

* 在头文件中声明全局的时：类名+常量名称

```
//.h
UIKIT_EXTERN NSString *const ViewControllerConstant;
//.m
UIKIT_EXTERN NSString *const ViewControllerConstant = @"VALUE";
```
#####三、枚举

######四、


#####二十一、



