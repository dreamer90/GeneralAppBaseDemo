//
//  LVJTableViewModel.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "LVJTableViewModel.h"

@implementation LVJTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)headerRefreshRequestWithCallback:(callback)callback
{
    //  后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //               主线程刷新视图
            NSMutableArray *arr=[NSMutableArray array];
            
            callback(arr);
        });
    });
}

- (void )footerRefreshRequestWithCallback:(callback)callback
{
    //  后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //               主线程刷新视图
            NSMutableArray *arr=[NSMutableArray array];
            
            callback(arr);
        });
    });
}

@end
