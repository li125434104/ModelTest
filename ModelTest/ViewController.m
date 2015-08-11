//
//  ViewController.m
//  ModelTest
//
//  Created by LXJ on 15/7/27.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "ViewController.h"
#import "MJModel.h"
#import "Weather.h"
#import "JSModel.h"
#import "LXJNetworkEngine.h"
#import "NetworkTestModel.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)MJExtensionClick:(UIButton *)sender {
    NSLog(@"哈哈");
    
//    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&units=imperial"];
//    
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url]
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
//                               if (!connectionError) {
//                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
//                                                                                        options:NSJSONReadingMutableContainers
//                                                                                          error:nil];
//                                   MJModel *model = [MJModel objectWithKeyValues:dict];
//                                   
//                                   NSLog(@"%@",((Weather *)model.weather[0]).weatherId);
//
//                               }
//    }];
    
    NetworkSuccessBlock successBlock = ^(id data) {
        MJModel *model = [MJModel objectWithKeyValues:data];
        NSLog(@"%@",((Weather *)model.weather[0]).weatherId);
    };
    
    NetworkFailureBlock failureBlock = ^(NSError *error) {
        NSLog(@"error%@",error);
    };
    
    [MJModel requestAPIonSucceed:successBlock onFailure:failureBlock];
}
- (IBAction)JsonModelClick:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&units=imperial"];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
                               if (!connectionError) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   
                                   JSModel *model = [[JSModel alloc] initWithDictionary:dict error:nil];
                                   
                                   NSLog(@"%@",model);
                                   
                               }
                           }];

}
- (IBAction)networkTestClick:(UIButton *)sender {
    
    NetworkSuccessBlock successBlock = ^(id data) {
        
        NSArray *temp = [data objectForKey:@"data"];
        
        for (int i = 0; i < [temp count]; i++) {
            NetworkTestModel *model = [NetworkTestModel objectWithKeyValues:temp[i]];
            [self.dataArray addObject:model];
        }
        
    };
    
    NetworkFailureBlock failureBlock = ^(NSError *error) {
        NSLog(@"error%@",error);
    };
    
    [NetworkTestModel requesetOrderListWithOrderStatus:@"0" onSucceed:successBlock onFailure:failureBlock];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
