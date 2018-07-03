//
//  UIScreen+HXScreen.h
//  KW_Extension
//
//  Created by 林克文 on 2018/6/12.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (HXScreen)

@property (nonatomic, assign, readonly, class) CGRect hxBounds;
@property (nonatomic, assign, readonly, class) CGFloat hxWidth;
@property (nonatomic, assign, readonly, class) CGFloat hxHeight;
@property (nonatomic, assign, readonly, class) CGFloat topHeight;
@property (nonatomic, assign, readonly, class) CGFloat tabBarHeight;
@property (nonatomic, assign, readonly, class) CGFloat statusBarHeight;
@property (nonatomic, assign, readonly, class) CGFloat safeAreaHeightTabBar;
@property (nonatomic, assign, readonly, class) CGFloat safeAreaHeightNoneTabBar;

+ (CGFloat)hx_scale_6:(CGFloat)size;
+ (CGFloat)hx_scale_5s:(CGFloat)size;

@end
