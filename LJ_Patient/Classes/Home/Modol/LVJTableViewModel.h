//
//  LVJTableViewModel.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^callback)(NSArray *array);

@interface LVJTableViewModel : NSObject

// tableView下拉刷新网络请求
- (void)headerRefreshRequestWithCallback:(callback)callback;
// tableView上拉刷新网络请求
- (void)footerRefreshRequestWithCallback:(callback)callback;

@end
