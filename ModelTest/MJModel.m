//
//  MJModel.m
//  ModelTest
//
//  Created by LXJ on 15/7/28.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "MJModel.h"

@implementation MJModel

+ (void)load {
    [MJModel setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"mainId" : @"id",
                };
    }];
}

+ (NSDictionary *)objectClassInArray {
    return @{
             @"weather" : @"Weather"
             };
}

@end
