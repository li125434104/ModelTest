//
//  MJModel.h
//  ModelTest
//
//  Created by LXJ on 15/7/28.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Main;

@interface MJModel : NSObject
@property (strong, nonatomic) NSString *base;
@property (strong, nonatomic) NSNumber *dt;
@property (strong, nonatomic) NSNumber *mainId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *visibility;
@property (strong, nonatomic) Main *main;
@property (strong, nonatomic) NSArray *weather;
@end
