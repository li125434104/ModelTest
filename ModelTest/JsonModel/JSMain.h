//
//  JSMain.h
//  ModelTest
//
//  Created by LXJ on 15/7/30.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "JSONModel.h"

@interface JSMain : JSONModel

@property (strong, nonatomic) NSNumber *humidity;
@property (strong, nonatomic) NSNumber *pressure;
@property (strong, nonatomic) NSNumber *temp;
@property (strong, nonatomic) NSNumber *temp_max;
@property (strong, nonatomic) NSNumber *temp_min;

@end
