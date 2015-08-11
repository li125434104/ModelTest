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

+ (void)requestAPIonSucceed:(NetworkSuccessBlock)successBlock onFailure:(NetworkFailureBlock)failureBlock {
    
    NetworkSuccessBlock theSuccessBlock = ^(id data) {
        successBlock(data);
    };
    
    NetworkFailureBlock theFailureBlock = ^(NSError *error) {
        failureBlock(error);
    };
    
    [LXJNetworkEngine requestDataAPI:testApi method:GET params:nil customHeaderField:nil onSuccess:theSuccessBlock onFailure:theFailureBlock];
}


@end
