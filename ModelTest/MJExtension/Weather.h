//
//  Weather.h
//  ModelTest
//
//  Created by LXJ on 15/7/28.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
@property (strong, nonatomic) NSString *weatherDescription;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSNumber *weatherId;
@property (strong, nonatomic) NSString *main;

@end
