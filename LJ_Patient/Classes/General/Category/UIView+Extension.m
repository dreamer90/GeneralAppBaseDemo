//
//  UIBarButtonItem+LVJExtension.h
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/27.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setLvj_x:(CGFloat)lvj_x
{
    CGRect frame = self.frame;
    frame.origin.x = lvj_x;
    self.frame = frame;
}

- (void)setLvj_y:(CGFloat)lvj_y
{
    CGRect frame = self.frame;
    frame.origin.y = lvj_y;
    self.frame = frame;
}

- (void)setLvj_width:(CGFloat)lvj_width
{
    CGRect frame = self.frame;
    frame.size.width = lvj_width;
    self.frame = frame;
}

- (void)setLvj_height:(CGFloat)lvj_height
{
    CGRect frame = self.frame;
    frame.size.height = lvj_height;
    self.frame = frame;
}

- (CGFloat)lvj_x
{
    return self.frame.origin.x;
}

- (CGFloat)lvj_y
{
    return self.frame.origin.y;
}

- (CGFloat)lvj_width
{
    return self.frame.size.width;
}

- (CGFloat)lvj_height
{
    return self.frame.size.height;
}

- (void)setLvj_centerX:(CGFloat)lvj_centerX
{
    CGPoint center = self.center;
    center.x = lvj_centerX;
    self.center = center;
}

- (void)setLvj_centerY:(CGFloat)lvj_centerY
{
    CGPoint center = self.center;
    center.y = lvj_centerY;
    self.center = center;
}

- (CGFloat)lvj_centerX
{
    return self.center.x;
}

- (CGFloat)lvj_centerY
{
    return self.center.y;
}
@end
