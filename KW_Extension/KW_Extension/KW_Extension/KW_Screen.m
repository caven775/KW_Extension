//
//  KW_Screen.m
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "KW_Screen.h"
#import "KW_Function.h"

@implementation KW_Screen

+ (CGRect)bounds
{
    return [[UIScreen mainScreen] bounds];
}

+ (CGFloat)width
{
    return KW_Screen.bounds.size.width;
}

+ (CGFloat)height
{
    return KW_Screen.bounds.size.height;
}

+ (CGFloat)statusBarHeight
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

+ (CGFloat)topHeight
{
    CGFloat statusBarH = KW_Screen.statusBarHeight;
    UINavigationController * navi = KWTopNavigationController();
    if (navi) {
        CGFloat max = 0.0;
        CGFloat naviH = navi.navigationBar.frame.size.height;
        if (@available(iOS 11.0, *)) {
            max = MAX(navi.view.safeAreaInsets.top, statusBarH);
        }
        return max + naviH;
    }
    return statusBarH;
}

+ (CGFloat)tabBarHeight
{
    UITabBarController * tab = (UITabBarController *)KWRootViewController();
    return tab.tabBar.frame.size.height;
}

+ (CGFloat)safeAreaHeightN
{
    return KW_Screen.height - KW_Screen.topHeight;
}

+ (CGFloat)safeAreaHeightT
{
    return KW_Screen.height - KW_Screen.topHeight - KW_Screen.tabBarHeight;
}


+ (CGFloat)kw_scale_6:(CGFloat)size
{
    return KW_Screen.width * (size/375.0);
}

+ (CGFloat)kw_scale_5s:(CGFloat)size
{
    return KW_Screen.width * (size/320.0);
}

@end
