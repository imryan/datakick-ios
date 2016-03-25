//
//  Datakick.h
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

#define DK_URL_BASE      @"https://www.datakick.org/api/items"           // GET or PUT
#define DK_URL_GET_ITEM  @"https://www.datakick.org/api/items/%@"        // GET
#define DK_URL_GET_QUERY @"https://www.datakick.org/api/items?query=%@"  // GET
#define DK_URL_ADD_IMAGE @"https://www.datakick.org/api/items/%@/images" // POST


typedef void (^DKGetAllItems)(NSArray *items);
typedef void (^DKGetItem)(Item *item);
typedef void (^DKGetItemsQuery)(NSArray *items);

@interface Datakick : NSObject

/**
 * Returns the shared instance.
 */
+ (instancetype)sharedInstance;

/**
 * Returns up to 100 objects.
 */
- (void)getAllItemsWithBlock:(DKGetAllItems)block;

/**
 * Returns an Item object by its GTIN-14 identifier.
 */
- (void)getItemByGtin:(NSString *)gtin14 withBlock:(DKGetItem)block;

/**
 * Returns an Item object by a query.
 */
- (void)getItemsByQuery:(NSString *)query withBlock:(DKGetItemsQuery)block;

@end
