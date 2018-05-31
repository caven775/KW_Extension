//
//  UIView+KW_ViewFrame.m
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "UIView+KW_ViewFrame.h"

@implementation UIView (KW_ViewFrame)

- (CGFloat)kw_x
{
    return self.frame.origin.x;
}

- (void)setKw_x:(CGFloat)kw_x
{
    CGRect frame = self.frame;
    frame.origin.x = kw_x;
    self.frame = frame;
}

- (void)setKw_y:(CGFloat)kw_y
{
    CGRect frame = self.frame;
    frame.origin.y = kw_y;
    self.frame = frame;
}

- (CGFloat)kw_y
{
    return self.frame.origin.y;
}

- (CGFloat)kw_width
{
    return CGRectGetWidth(self.frame);
}

- (void)setKw_width:(CGFloat)kw_width
{
    CGRect frame = self.frame;
    frame.size.width = kw_width;
    self.frame = frame;
}

- (void)setKw_height:(CGFloat)kw_height
{
    CGRect frame = self.frame;
    frame.size.height = kw_height;
    self.frame = frame;
}

- (CGFloat)kw_height
{
    return CGRectGetHeight(self.frame);
}

- (CGSize)kw_size
{
    return self.frame.size;
}

- (void)setKw_size:(CGSize)kw_size
{
    CGRect frame = self.frame;
    frame.size.width = kw_size.width;
    frame.size.height = kw_size.height;
    self.frame = frame;
}

- (CGPoint)kw_point
{
    return self.frame.origin;
}

- (void)setKw_point:(CGPoint)kw_point
{
    CGRect frame = self.frame;
    frame.origin.x = kw_point.x;
    frame.origin.y = kw_point.y;
    self.frame = frame;
}

- (CGPoint)kw_selfCenter
{
    return CGPointMake(self.kw_width/2, self.kw_height/2);
}

- (CGFloat)kw_maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)kw_maxY
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)kw_minX
{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)kw_minY
{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)kw_midX
{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)kw_midY
{
    return CGRectGetMidY(self.frame);
}

- (BOOL)kw_rectEmpty
{
    return CGRectIsEmpty(self.frame);
}

- (BOOL)kw_rectNull
{
    return CGRectIsNull(self.frame);
}

@end
