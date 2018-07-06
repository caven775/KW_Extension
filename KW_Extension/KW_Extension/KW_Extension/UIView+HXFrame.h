//
//  UIView+HXFrame.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HXFrame)

@property (nonatomic, assign) CGFloat kw_x;
@property (nonatomic, assign) CGFloat kw_y;

@property (nonatomic, assign) CGFloat kw_width;
@property (nonatomic, assign) CGFloat kw_height;

@property (nonatomic, assign) CGSize kw_size;
@property (nonatomic, assign) CGPoint kw_point;
@property (nonatomic, assign, readonly) CGPoint kw_selfCenter;

@property (nonatomic, assign, readonly) CGFloat kw_maxX;
@property (nonatomic, assign, readonly) CGFloat kw_maxY;

@property (nonatomic, assign, readonly) CGFloat kw_minX;
@property (nonatomic, assign, readonly) CGFloat kw_minY;

@property (nonatomic, assign, readonly) CGFloat kw_midX;
@property (nonatomic, assign, readonly) CGFloat kw_midY;

@property (nonatomic, assign, readonly) BOOL kw_rectNull;
@property (nonatomic, assign, readonly) BOOL kw_rectEmpty;

@end
