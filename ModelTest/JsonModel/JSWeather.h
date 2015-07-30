//
//  JSWeather.h
//  ModelTest
//
//  Created by LXJ on 15/7/30.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "JSONModel.h"

@protocol JSWeather @end

@interface JSWeather : JSONModel

@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSNumber *weatherId;
@property (strong, nonatomic) NSString *main;

@end
