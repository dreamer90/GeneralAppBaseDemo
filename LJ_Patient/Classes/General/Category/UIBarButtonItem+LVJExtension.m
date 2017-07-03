//
//  UIBarButtonItem+LVJExtension.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "UIBarButtonItem+LVJExtension.h"

@implementation UIBarButtonItem (LVJExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero, [btn backgroundImageForState:UIControlStateNormal].size};
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
