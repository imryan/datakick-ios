datakick-ios
--
An iOS library/wrapper for the Datakick service.

Usage
--
Usage is simple. All values are returned through completion blocks.

Each `Item` object holds a few basic attributes:
* `gtin14`
* `brandName`
* `name`
* `size`
* `images` an NSArray that contains URL strings to images.

##### Retrieving the first 100 objects

```
[[Datakick sharedInstance] getAllItemsWithBlock:^(NSArray *items) {
    for (Item *item in items) {
        NSLog(@"%@", item.name);
    }
}];
```

##### Retrieving an Item object by its GTIN-14 identifier

```
[[Datakick sharedInstance] getItemByGtin:@"000000000000" withBlock:^(Item *item) {
    NSLog(@"Item: %@", item.name);
}];
```

##### Retrieving an Item object from a query

```
[[Datakick sharedInstance] getItemsByQuery:@"cookies" withBlock:^(NSArray *items) {
    for (Item *item in items) {
        NSLog(@"%@", item.name);
    }
}];
```

##### Updating an Item object
Just pass it an `NSDictionary` and fill it with any of these optional parameters:

* brand_name
* name
* size
* ingredients
* serving_size
* servings_per_container
* calories
* fat_calories
* fat
* saturated_fat
* trans_fat
* polyunsaturated_fat
* monounsaturated_fat
* cholesterol
* sodium
* potassium
* carbohydrate
* fiber
* sugars
* protein
* author
* format
* publisher
* pages
* alcohol_by_volume

```
NSDictionary *attributes = @{
                             @"brand_name" : @"The Best Brand Co.",
                             @"name"       : @"Demo",
                             @"size"       : @"40 oz."
                             };

[[Datakick sharedInstance] updateItemWithGtin:@"000000000000" attributes:attributes block:^(NSError *error) {
    if (error) NSLog(@"Error: %@", error);
}];
