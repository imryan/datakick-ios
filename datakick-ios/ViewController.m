//
//  ViewController.m
//  datakick-ios
//
//  Created by Ryan Cohen on 3/24/16.
//  Copyright © 2016 Ryan Cohen. All rights reserved.
//

#import "ViewController.h"
#import "Datakick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[Datakick sharedInstance] getAllItemsWithBlock:^(NSArray *items) {
//        for (Item *item in items) {
//            NSLog(@"%@", item.name);
//        }
//    }];
    
//    [[Datakick sharedInstance] getItemsByQuery:@"cookies" withBlock:^(NSArray *items) {
//        for (Item *item in items) {
//            NSLog(@"%@", item.name);
//        }
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
