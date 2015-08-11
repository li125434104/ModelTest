//
//  networkTestModel.m
//  ModelTest
//
//  Created by LXJ on 15/8/11.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "NetworkTestModel.h"

@implementation NetworkTestModel

+ (NSDictionary *)objectClassInArray {
    return @{
             @"productList" : @"productList"
             };
}

+ (void)requesetOrderListWithOrderStatus:(NSString *)orderStatus onSucceed:(NetworkSuccessBlock)successBlock onFailure:(NetworkFailureBlock)failureBlock {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{ @"userId" : @"7" ,
                                    @"clientOs" : [NSNumber numberWithInt:1],
                                    @"clientOsVersion" : @"8.4",
                                    @"appType" : [NSNumber numberWithInt:1],
                                    @"appVersion" : @"v1.0.0.38",
                                    @"phoneType" :  @"iPhone Simulator",
                                    @"ip" : @"0.0.0.0",
                                    @"netType" : @"3G",
                                    @"mac" : @"00000000",
                                    @"devId" : @"0",
                                    @"otherDevInfo" : @"otherDevInfo",
                                    @"orderStatus" : orderStatus
                                }];
    
    NetworkSuccessBlock theSuccessBlock = ^(id data) {
        successBlock(data);
    };
    
    NetworkFailureBlock theFailureBlock = ^(NSError *error) {
        failureBlock(error);
    };
    
    [LXJNetworkEngine requestDataAPI:orderList method:GET params:params customHeaderField:nil onSuccess:theSuccessBlock onFailure:theFailureBlock];
}

@end
