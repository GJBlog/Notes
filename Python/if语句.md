### if 语句

语法：

if 条件:

​	要执行的语句

最终要之执行的语句

```python
age = 10
if age > 10:
    print("大于10")
print("结束了")
```

### If else 语句

语法：

If 条件:

​	要执行的语句

else:

​	要执行的语句

```python
age = int(input("请输入你的年龄:"))
if age > 18:
    print("您已成年, 游玩需要补票10元")
else:
    print("您不需要补票")
print("祝您游玩愉快")
```

### if elif else 语句

elif 语句可以有多个

```python
age = int(input("请输入你的年龄:"))
if age > 18:
    print("您已成年, 游玩需要补票10元")
elif age > 10:
    print("小于18且大于10")
else:
    print("您不需要补票")
print("祝您游玩愉快")
```

