//
//  AppConfig.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define TabBarHeight self.tabBarController.tabBar.frame.size.height
#define StatusBarHeihgt [[UIApplication sharedApplication] statusBarFrame].size.height
#define NavigationBarHeight self.navigationController.navigationBar.frame.size.height

// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

//灰色
#define LVJGray [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f]


// 首页
#define CarouselHeight 180

#endif /* AppConfig_h */
