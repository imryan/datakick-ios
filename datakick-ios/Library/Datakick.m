//
//  Datakick.m
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import "Datakick.h"
#import "AFNetworking.h"

@implementation Datakick

+ (instancetype)sharedInstance {
    static Datakick *datakick = nil;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        datakick = [self new];
    });
    
    return datakick;
}

- (void)getAllItemsWithBlock:(DKGetAllItems)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:DK_URL_BASE parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (id object in responseObject) {
            Item *item = [[Item alloc] initWithGtin14:object[@"gtin14"]
                                            brandName:object[@"brandName"]
                                                 name:object[@"name"]
                                                 size:object[@"size"]
                                               images:object[@"images"]];
            [items addObject:item];
        }
        
        block(items);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"[Error] getAllItemsWithBlock: %@", error);
    }];
}

- (void)getItemByGtin:(NSString *)gtin14 withBlock:(DKGetItem)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:DK_URL_GET_ITEM, gtin14];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        Item *item = [[Item alloc] initWithGtin14:responseObject[@"gtin14"]
                                        brandName:responseObject[@"brandName"]
                                             name:responseObject[@"name"]
                                             size:responseObject[@"size"]
                                           images:responseObject[@"images"]];
        block(item);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"[Error] getItemByGtin: %@", error);
    }];
}

- (void)getItemsByQuery:(NSString *)query withBlock:(DKGetItemsQuery)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:DK_URL_GET_QUERY, query];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (id object in responseObject) {
            Item *item = [[Item alloc] initWithGtin14:object[@"gtin14"]
                                            brandName:object[@"brandName"]
                                                 name:object[@"name"]
                                                 size:object[@"size"]
                                               images:object[@"images"]];
            [items addObject:item];
        }
        
        block(items);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"[Error] getItemByQuery: %@", error);
    }];
}

@end
