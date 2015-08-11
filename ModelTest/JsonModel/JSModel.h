//
//  JSModel.h
//  ModelTest
//
//  Created by LXJ on 15/7/30.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "JSONModel.h"
#import "JSMain.h"
#import "JSWeather.h"

@interface JSModel : JSONModel
@property (strong, nonatomic) NSString *base;
@property (strong, nonatomic) NSNumber *dt;
@property (strong, nonatomic) NSNumber *mainId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *visibility;
@property (strong, nonatomic) JSMain   *main;
@property (strong, nonatomic) NSArray <JSWeather>* weather;



@end
