//
//  networkTestModel.h
//  ModelTest
//
//  Created by LXJ on 15/8/11.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXJNetworkEngine.h"

@interface NetworkTestModel : NSObject

@property (assign, nonatomic) int       orderStatus;//订单状态
@property (strong, nonatomic) NSString  *orderId;//订单编号
@property (strong, nonatomic) NSString  *actionId;
@property (strong, nonatomic) NSString  *buyerId;
@property (strong, nonatomic) NSString  *sellerId;
@property (strong, nonatomic) NSNumber  *orderType;
@property (strong, nonatomic) NSString  *orderStatusDesc;
@property (strong, nonatomic) NSString  *productNum;
@property (strong, nonatomic) NSString  *titlePrice;
@property (strong, nonatomic) NSString  *afterSaleId;
@property (strong, nonatomic) NSString  *shipFee;
@property (assign, nonatomic) BOOL      hasLogistics;

@property (strong, nonatomic) NSMutableArray *productList;

+ (void)requesetOrderListWithOrderStatus:(NSString *)orderStatus onSucceed:(NetworkSuccessBlock)successBlock onFailure:(NetworkFailureBlock)failureBlock;

@end
