//
//  Datakick.h
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Item.h"

typedef void (^DKGetItemsBlock)(NSArray<Item *> * _Nullable items);
typedef void (^DKGetItemBlock)(Item * _Nullable item);
typedef void (^DKErrorBlock)(NSError * _Nullable error);

@interface Datakick : NSObject

/**
 * Returns the shared instance.
 */
+ (nonnull instancetype)sharedInstance;

/**
 * Returns up to 100 objects.
 */
- (void)getAllItemsWithBlock:(nonnull DKGetItemsBlock)block;

/**
 * Returns an Item object by its GTIN-14 identifier.
 */
- (void)getItemByGtin:(nonnull NSString *)gtin14 withBlock:(nonnull DKGetItemBlock)block;

/**
 * Returns an Item object from a query.
 */
- (void)getItemsByQuery:(nonnull NSString *)query withBlock:(nonnull DKGetItemsBlock)block;

/**
 * Updates an item in the database based on its GTIN-14 identifier.
 */
- (void)updateItemWithGtin:(nonnull NSString *)gtin14 attributes:(nonnull NSDictionary<NSString *, NSString *> *)attributes block:(nullable DKErrorBlock)block;

/**
 * Adds an image to an item by its GTIN-14 identifier.
 */
// - (void)addImageForItemWithGtin:(nonnull NSString *)gtin14 image:(nonnull UIImage *)image block:(nullable DKError)block;

@end
