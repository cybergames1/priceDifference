//
//  ViewController.m
//  mycoin
//
//  Created by 刘建廷 on 2018/5/25.
//  Copyright © 2018年 刘建廷. All rights reserved.
//

#import "ViewController.h"
#import "TKPriceDifference.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TKPriceDifference *difference = [TKPriceDifference sharedManager];
    [difference getDepthFromMarkets];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
