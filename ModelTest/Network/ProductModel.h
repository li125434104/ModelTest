//
//  productModel.h
//  ModelTest
//
//  Created by LXJ on 15/8/11.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXJNetworkEngine.h"

@interface ProductModel : NSObject

@property (assign, nonatomic) int productCount;
@property (strong, nonatomic) NSString *productId;        // 商品id
@property (strong, nonatomic) NSString *productImage;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productParams;
@property (strong, nonatomic) NSString *productPrice;
@property (strong, nonatomic) NSString *orderItemId;
@property (assign, nonatomic) BOOL hasComment;
@property (strong, nonatomic) NSString *afterSaleStatus;
@property (strong, nonatomic) NSString *afterSaleStatusDesc;
@property (assign, nonatomic) BOOL returnGoodsForSevenDays;
@property (assign, nonatomic) BOOL changeGoodsForFifteenDays;


@end
