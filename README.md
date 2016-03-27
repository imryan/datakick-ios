datakick-ios
--
An iOS library/wrapper for the Datakick service.

Usage
--

#### Retrieving the first 100 objects

```
    [[Datakick sharedInstance] getAllItemsWithBlock:^(NSArray *items) {
        for (Item *item in items) {
            NSLog(@"%@", item.name);
        }
    }];
```

#### Retrieve items based on a query

```
    [[Datakick sharedInstance] getItemsByQuery:@"cookies" withBlock:^(NSArray *items) {
        for (Item *item in items) {
            NSLog(@"%@", item.name);
        }
    }];
```
