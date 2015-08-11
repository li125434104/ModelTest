//
//  LXJNetworkEngine.m
//  ModelTest
//
//  Created by LXJ on 15/8/10.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "LXJNetworkEngine.h"

@implementation LXJNetworkEngine

+ (void)requestDataAPI:(NSString *)apiPath method:(HttpMethod)method params:(NSDictionary *)params customHeaderField:(NSDictionary *)customHeaderFields onSuccess:(NetworkSuccessBlock)successBlock onFailure:(NetworkFailureBlock)failureBlock {
    
    NSURL *baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",orderHost]];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    if (customHeaderFields) {
        [customHeaderFields enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
            [manager.requestSerializer setValue:object forHTTPHeaderField:key];
        }];
    }
    
    void (^theAFHTTPRequestOperationSuccess)(AFHTTPRequestOperation *operation, id responseObject) = ^void (AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"\nAPI:%@ \nParams:%@ \nJSON: %@", operation.request.URL.absoluteString, params, responseObject);
        successBlock(responseObject);
    };

    void (^theAFHTTPRequestOperationFailure)(AFHTTPRequestOperation *operation, NSError *error) = ^void(AFHTTPRequestOperation *operation, NSError *error) {
        if (operation.response.statusCode >= 400 && operation.response.statusCode < 500){
            id errResp = operation.responseObject;
            NSLog(@"Error %ld: %@", (long)operation.response.statusCode, error);
            if (errResp){
                successBlock(errResp);
            } else {
                failureBlock(error);
            }
        } else {
            NSLog(@"Error %ld: %@", (long)operation.response.statusCode, error);
            failureBlock(error);
        }
    };

    switch (method) {
        case GET:
            [manager GET:apiPath parameters:params success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
            break;
        case POST:
            [manager POST:apiPath parameters:params success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
            break;
        case PUT:
            [manager PUT:apiPath parameters:params success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
            break;
        case DELETE:
            [manager DELETE:apiPath parameters:params success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
            break;
        case HEAD:
            [manager HEAD:apiPath parameters:params success:^(AFHTTPRequestOperation *operation){} failure:theAFHTTPRequestOperationFailure];
            break;
        case PATCH:
            [manager PATCH:apiPath parameters:params success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
            break;
        case POSTMUTIPART:
        {
            NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:params[@"param"]];
            
            for (NSString *key in [params allKeys]) {
                if ([key isEqualToString:@"block"] || [key isEqualToString:@"param"]) {
                    continue;
                }
                
                [mutableDic setObject:[params objectForKey:key] forKey:key];
            }
            
            [manager POST:apiPath parameters:mutableDic constructingBodyWithBlock:params[@"block"] success:theAFHTTPRequestOperationSuccess failure:theAFHTTPRequestOperationFailure];
        }
            
            break;
        default:
            break;
    }

}

@end
