## Modernizing Grand Central Dispatch Usage

### Parallelism(并行)

```swift
DispatchQueue.concurrentPerform(1000) {
    i in /* iteration */
}
```

```objc
dispatch_apply(3, DISPATCH_APPLY_AUTO, ^(size_t i) {
    NSLog(@"%zd", i);
});
```


### concurrency(并发)