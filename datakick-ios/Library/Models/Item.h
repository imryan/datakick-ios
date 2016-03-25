//
//  Item.h
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *gtin14;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSArray *images;

- (instancetype)initWithGtin14:(NSString *)gtin14
                     brandName:(NSString *)brandName
                          name:(NSString *)name
                          size:(NSString *)size
                        images:(NSArray *)images;

@end
