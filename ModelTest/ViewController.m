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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)MJExtensionClick:(UIButton *)sender {
    NSLog(@"哈哈");
    
    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&units=imperial"];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
                               if (!connectionError) {
                                   NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:nil];
                                   MJModel *model = [MJModel objectWithKeyValues:dict];
                                   
                                   NSLog(@"%@",((Weather *)model.weather[0]).weatherId);
                                   
                               }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
