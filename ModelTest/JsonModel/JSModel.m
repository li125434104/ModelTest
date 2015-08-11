//
//  JSModel.m
//  ModelTest
//
//  Created by LXJ on 15/7/30.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "JSModel.h"

@implementation JSModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"mainId",
                                                       
                                                       }];
}


@end
