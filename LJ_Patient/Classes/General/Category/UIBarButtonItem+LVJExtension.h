//
//  UIBarButtonItem+LVJExtension.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LVJExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
