//
//  Weather.m
//  ModelTest
//
//  Created by LXJ on 15/7/28.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "Weather.h"

@implementation Weather

+ (void)load {
    [Weather setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"weatherDescription" : @"description",
                 @"weatherId" : @"id",
                 };
    }];
}

@end
