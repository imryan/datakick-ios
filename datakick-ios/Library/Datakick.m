//
//  Datakick.m
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import "Datakick.h"
#import "AFNetworking.h"

NSString * const DK_URL_BASE      = @"https://www.datakick.org/api/items";
NSString * const DK_URL_GET_ITEM  = @"https://www.datakick.org/api/items/%@";
NSString * const DK_URL_GET_QUERY = @"https://www.datakick.org/api/items?query=%@";
NSString * const DK_URL_ADD_IMAGE = @"https://www.datakick.org/api/items/%@/images";

@interface Datakick ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation Datakick

# pragma mark - Init

+ (instancetype)sharedInstance {
    static Datakick *datakick = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        datakick = [self new];
        datakick.manager = [AFHTTPSessionManager manager];
    });
    
    return datakick;
}

# pragma mark - Get

- (void)getAllItemsWithBlock:(DKGetItemsBlock)block {
    [self.manager GET:DK_URL_BASE parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (id object in responseObject) {
            Item *item = [[Item alloc] initWithGtin14:object[@"gtin14"]
                                            brandName:object[@"brand_name"]
                                                 name:object[@"name"]
                                                 size:object[@"size"]
                                               images:object[@"images"]];
            [items addObject:item];
        }
        
        block(items);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
        block(nil);
    }];
}

- (void)getItemByGtin:(NSString *)gtin14 withBlock:(DKGetItemBlock)block {
    NSString *url = [NSString stringWithFormat:DK_URL_GET_ITEM, gtin14];
    
    [self.manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        Item *item = [[Item alloc] initWithGtin14:responseObject[@"gtin14"]
                                        brandName:responseObject[@"brand_name"]
                                             name:responseObject[@"name"]
                                             size:responseObject[@"size"]
                                           images:responseObject[@"images"]];
        block(item);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
        block(nil);
    }];
}

- (void)getItemsByQuery:(NSString *)query withBlock:(DKGetItemsBlock)block {
    NSString *url = [NSString stringWithFormat:DK_URL_GET_QUERY, query];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    [self.manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (id object in responseObject) {
            Item *item = [[Item alloc] initWithGtin14:object[@"gtin14"]
                                            brandName:object[@"brand_name"]
                                                 name:object[@"name"]
                                                 size:object[@"size"]
                                               images:object[@"images"]];
            [items addObject:item];
        }
        
        block(items);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
        block(nil);
    }];
}

# pragma mark - Update

- (void)updateItemWithGtin:(NSString *)gtin14 attributes:(NSDictionary *)attributes block:(DKErrorBlock)block {
    NSString *url = [NSString stringWithFormat:DK_URL_GET_ITEM, gtin14];
    
    [self.manager PUT:url parameters:attributes success:^(NSURLSessionTask *task, id responseObject) {
        block(nil);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
        block(error);
    }];
}

@end
