//
//  TKPriceDifference.m
//  mycoin
//
//  Created by 刘建廷 on 2018/5/27.
//  Copyright © 2018年 刘建廷. All rights reserved.
//

#import "TKPriceDifference.h"
#import "TKRequest.h"

@implementation TKPriceDifference

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static TKPriceDifference* manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[TKPriceDifference alloc] init];
    });
    return manager;
}

//获取市场深度
- (void)getDepthFromMarkets
{
    [self p_price_at_market_huobi];
}

//火币url https://api.huobipro.com/
- (void)p_price_at_market_huobi
{
    NSDictionary *parameters = @{@"symbol" : @"btcusdt",
                                 @"type" : @"step5",
                                 };
    
    @weakify(self);
    TKRequest *request = [TKRequest new];
    [request GET:@"https://api.huobipro.com/market/depth" parameters:parameters];
    request.success = ^(NSURLSessionDataTask *task, id responseObject) {
        //
        @strongify(self);
        [self p_price_at_market_okex];
    };
    request.failure = ^(NSURLSessionDataTask *task, NSError *error) {
        //
    };
}

//okex url https://www.okex.com/
- (void)p_price_at_market_okex
{
    NSDictionary *parameters = @{@"symbol" : @"btc_usdt",
                                 };
    
    TKRequest *request = [TKRequest new];
    [request GET:@"https://www.okex.com/api/v1/depth.do" parameters:parameters];
    request.success = ^(NSURLSessionDataTask *task, id responseObject) {
        //
        NSLog(@"response success:%@",responseObject);
    };
    request.failure = ^(NSURLSessionDataTask *task, NSError *error) {
        //
        NSLog(@"response failure:%@",error);
    };
}

@end
