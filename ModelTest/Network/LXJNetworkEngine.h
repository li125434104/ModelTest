//
//  LXJNetworkEngine.h
//  ModelTest
//
//  Created by LXJ on 15/8/10.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

typedef void (^NetworkSuccessBlock)(id data);
typedef void (^NetworkFailureBlock)(NSError *error);
typedef void (^NetworkMultipartBlock)(id<AFMultipartFormData> formData);

typedef enum _HttpMethod {
    GET = 0,
    POST,
    PUT,
    DELETE,
    HEAD,
    PATCH,
    POSTMUTIPART,
} HttpMethod;

#define testHost @"api.openweathermap.org"
#define testApi @"data/2.5/weather?lat=37.785834&lon=-122.406417&units=imperial"
#define orderHost @"10.128.11.140:8080/api"
#define orderList @"order/order_list.json"

@interface LXJNetworkEngine : NSObject

+ (void)requestDataAPI:(NSString *)apiPath method:(HttpMethod)method params:(NSDictionary *)params customHeaderField:(NSDictionary *)customHeaderFields onSuccess:(NetworkSuccessBlock)successBlock onFailure:(NetworkFailureBlock)failureBlock;

@end
