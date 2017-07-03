//
//  LVJTabBarViewController.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "LVJTabBarViewController.h"
#import "LVJHomeViewController.h"
#import "LVJDoctorViewController.h"
#import "LVJHealthViewController.h"
#import "LVJReportViewController.h"
#import "LVJMineViewController.h"
#import "LVJNavigationController.h"
#import "LVJTabBar.h"

@interface LVJTabBarViewController ()<PublishButtonDelegate>

@end

@implementation LVJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /*
     // 替换tabbar
     LVJTabBar * tabbar = [[LVJTabBar alloc] init];
     tabbar.btnDelegate = self;
     [self setValue:tabbar forKeyPath:@"tabBar"];
     */
    
    
    // 1.初始化子控制器
    LVJHomeViewController *home = [[LVJHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    LVJDoctorViewController *doctor = [[LVJDoctorViewController alloc] init];
    [self addChildVc:doctor title:@"医生团队" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    LVJHealthViewController *health = [[LVJHealthViewController alloc] init];
    [self addChildVc:health title:@"记录" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    
    LVJReportViewController *report = [[LVJReportViewController alloc] init];
    [self addChildVc:report title:@"服务" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    LVJMineViewController *mine = [[LVJMineViewController alloc] init];
    [self addChildVc:mine title:@"个人中心" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

- (void)publishButtonClick{

    LVJHealthViewController *health = [[LVJHealthViewController alloc] init];
    [self presentViewController:health animated:YES completion:nil];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = LVJGray;
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    LVJNavigationController *nav = [[LVJNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
