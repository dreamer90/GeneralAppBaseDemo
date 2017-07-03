//
//  LVJTabBar.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PublishButtonDelegate <NSObject>

- (void)publishButtonClick;

@end
@interface LVJTabBar : UITabBar

@property (nonatomic , weak)id<PublishButtonDelegate>btnDelegate;
@end
