//
//  JSWeather.m
//  ModelTest
//
//  Created by LXJ on 15/7/30.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "JSWeather.h"

@implementation JSWeather
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"weatherId",
                                                       @"description" : @"weatherDescription",
                                                       }];
}

@end
