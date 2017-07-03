//
//  LVJTabBar.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "LVJTabBar.h"

@implementation LVJTabBar

- (nonnull instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *publishButton = [[UIButton alloc] init];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:publishButton];
        [publishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            UIImage * image = [publishButton backgroundImageForState:UIControlStateNormal];
            make.size.mas_equalTo(image.size);
        }];
        
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)publishClick
{
    if ([self.btnDelegate respondsToSelector:@selector(publishButtonClick)]) {
        [self.btnDelegate publishButtonClick];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 原来的4个
    CGFloat width = self.lvj_width / 5;
    int index = 0;
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) continue;
        control.lvj_width = width;
        control.lvj_x = index > 1 ? width * (index + 1) : width * index;
        index++;
    }
}

@end
