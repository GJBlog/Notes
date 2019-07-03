# 四、集合类型(Collection Types)

1、数组(Arrays)

* 使用有序表存储同一类型的多个值。

```swift
// 创建空数组
var someInts = [Int]()
var someInts = Array<Int>()
// 创建带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
var shoppingList: [String] = ["Eggs", "Milk"]
// 创建数组,传递集合类型
let airportCodes = [String](airports.keys)
```
* 两个数组相加创建新数组

```swift
var threeDoubles = Array(repeating: 0.0, count: 3)
var another = Array(repeating: 2.5, count: 3)
var sixDoubles = another + threeDoubles
sixDoubles: [2.5, 2.5, 2.5, 0, 0, 0]
```
* 访问和修改数组

```swift
// 数组个数
shoppingList.count
// 数组是否为空
shoppingList.isEmpty
// 数组添加成员
shoppingList.append(_:)
shoppingList += [新成员]
// 数组某个成员
shopppingList[0]
// 数组一组下标
shoppingList[4...6]
// 遍历数组
for item in shoppingList {
    print(item)
}
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
```

2、集合(Set)

* 存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
* 一个类型要想存储在集合中，必须是可哈希化。必须提供一个方法来计算它的Hash值。相等的对象哈希值(a == b, a.hashvalue == b.hashvalue)必须相同。
* Swift中所有的基本类型(String、Int、Bool、Double)都是可哈希化的
* 使用自定义的类型作为集合的值得类型或者字典的键的类型，前提是自定义的类型必须符合Swift标准库中的```Hashable```协议。符合```Hashable```协议的类型需要提供一个Int类型的可读属性```hashValue```。又因为```Hashable```协议遵循```Equatable```协议，所以遵循该协议的类型也必须提供一个```==```运算符的实现。这个```Equatable```协议要求任何遵循```==```实现的实例之间都是相等的。(例如对于a, b, c来说，```==```实现必须要满足
    * ```a``` == ```a```
    * ```a``` == ```b``` 意味着 ```b``` == ```a``` 
    * ```a``` == ```b``` &&  ```b``` == ```c``` 意味着 ```a``` == ```c```
* Set类型不能从数组字面量中被单独推出来，所以Set类型必须显示声明

```swift
// 创建空集合
var letters = Set<Character>()
// 在上下文中提供了类型信息后，可以创建空集合
letters = []
// 使用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock","chsos"]
var favoriteGenres: Set = ["rock","class"]
```

* 访问和修改一个集合

```swift
// 集合个数
favoriteGenres.count
// 集合是否为空
favoriteGenres.isEmpty
var some: Set = ["A", "B"]
// 集合添加一个新元素
some.insert("C")
// 集合删除一个新元素，如果删除的元素不存在，则返回nil,否则返回删除元素
some.remove("F")
// 集合中是否包含一个特定值
some.contains(_:)
// 遍历集合
for genre in favoriteGenres {
    print("\(genre)")
}
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
```

* 集合之间关系

    * intersection：交集
    * symmetricDifference：在两个的任何一个集合中，但是不在两个集合中
    * union：并集
    * subtracting：在a集合，不在a和b的交集中

```swift
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 9]
```

* 集合包含关系

```swift
isSubset：一个集合中的值是否也被包含在另一个集合中
isSuperset：一个集合中包含另一个集合中所有的值
isStrictSubset：如果集合B的每个元素都是A的元素，并且A至少包含一个不属于B的元素，那么集合A是另一个集合B的严格超集。
isDisjoint：两个集合是否不含有相同的值(是否没有交集)
```

3、字典(Dictionary)

* 一种存储多个相同类型的值的容器。每个值(value)都关联唯一的键(key)
* 字典中的数据项并没有具体的顺序
* 一个字典中的key类型必须遵循Hashable协议，就像Set的值类型

```swift
// 创建一个空字典
var namesOfIntergers = [Int: String]()
// 在上下文中提供了类型信息后，可以创建空字典
var namesOfIntergers = [:]
var namesOfIntergers = Dictionary<Int, String>()
// 使用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// 简写方式
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

* 访问和修改字典

```swift
// 字典个数
airports.count
// 字典是否为空
airports.isEmpty
// 使用下标方式，如果key已经存在，修改对应的value，如果key不存在，添加新数据项，不论key是否存在都返回更新后的值
airports["LHR"] = "London"
// 也可以设置或者更新特定键对应的值,如果key不存在，返回nil，如果key存在，返回更新前的值
airports.updateValue("A", forKey: "key1")
// 使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对
airports["APL"] = nil
// 也可以用来在字典中移除键值对，如果key存在，返回被移除的值，如果key不存在，返回nil
airports.removeValue(forKey: "DUB")
// 遍历字典
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow
```