//
//  LVJTableViewProtocol.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ScrollViewContentSizeDelegate <NSObject>
// 通过scrollViewOffset 控制轮播图
- (void)scrollViewDidChangeScroll:(UIScrollView *)scrollView;

@end
@interface LVJTableViewProtocol : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , weak) id<ScrollViewContentSizeDelegate> delegate;

@end
