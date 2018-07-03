//
//  UIScreen+HXScreen.m
//  KW_Extension
//
//  Created by 林克文 on 2018/6/12.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "UIScreen+HXScreen.h"


@implementation UIScreen (HXScreen)

+ (CGRect)hxBounds
{
    return [[self mainScreen] bounds];
}

+ (CGFloat)hxWidth
{
    return UIScreen.hxBounds.size.width;
}

+ (CGFloat)hxHeight
{
    return UIScreen.hxBounds.size.height;
}

+ (CGFloat)statusBarHeight
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

+ (CGFloat)topHeight
{
    CGFloat statusBarH = UIScreen.statusBarHeight;
    UINavigationController * navi = [self HXTopNavigationController];
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
    UITabBarController * tab = (UITabBarController *)[self HXRootViewController];;
    return tab.tabBar.frame.size.height;
}

+ (CGFloat)safeAreaHeightNoneTabBar
{
    return UIScreen.hxHeight - UIScreen.topHeight;
}

+ (CGFloat)safeAreaHeightTabBar
{
    return UIScreen.hxHeight - UIScreen.topHeight - UIScreen.tabBarHeight;
}


+ (CGFloat)hx_scale_6:(CGFloat)size
{
    return UIScreen.hxWidth * (size/375.0);
}

+ (CGFloat)hx_scale_5s:(CGFloat)size
{
    return UIScreen.hxWidth * (size/320.0);
}

+ (UINavigationController *)HXTopNavigationController
{
    UIViewController * rootViewController = [self HXRootViewController];
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)rootViewController;
    } else if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabVC = (UITabBarController *)rootViewController;
        return (UINavigationController *)[tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
    } else {
        return nil;
    }
}

+ (UIViewController *)HXRootViewController
{
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

@end
