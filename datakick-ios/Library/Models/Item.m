//
//  Item.m
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithGtin14:(NSString *)gtin14
                     brandName:(NSString *)brandName
                          name:(NSString *)name
                          size:(NSString *)size
                        images:(NSArray *)images {
    
    if (self == [super init]) {
        _gtin14 = gtin14;
        _brandName = brandName;
        _name = name;
        _size = size;
        _images = [NSArray arrayWithArray:images];
    }
    
    return self;
}

@end
