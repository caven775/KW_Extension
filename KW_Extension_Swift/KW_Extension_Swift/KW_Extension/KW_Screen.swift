//
//  KW_Screen.swift
//  Finance_Swift
//
//  Created by LKW on 2018/5/29.
//  Copyright © 2018年 Udo. All rights reserved.
//

import UIKit


/// 屏幕尺寸类
class KW_Screen: NSObject {

    /// 屏幕尺寸
    static var bounds: CGRect {
        get {
            return UIScreen.main.bounds;
        }
    }
    
    /// 屏幕宽度
    static var width: CGFloat {
        get {
            return KW_Screen.bounds.size.width;
        }
    }
    
    /// 屏幕高度
    static var height: CGFloat {
        get {
            return KW_Screen.bounds.size.height;
        }
    }
    
    /// 状态栏高度
    static var statusBarHeight: CGFloat {
        get {
            return UIApplication.shared.statusBarFrame.size.height;
        }
    }
    
    /// 页面顶部的高度
    /// 1、有navigation时，是导航栏高度+状态栏高度
    /// 2、没有navigation时，是状态栏高度
    static var topHeight: CGFloat {
        get {
            let statusBarHeight = KW_Screen.statusBarHeight;
            let navigationController = KWTopViewController();
            if (navigationController != nil) {
                var maxHeight: CGFloat = 0.0;
                let height: CGFloat = (navigationController?.navigationBar.kw_height)!;
                if #available(iOS 11.0, *) {
                    maxHeight = max((navigationController?.view.safeAreaInsets.top)!, statusBarHeight);
                }
                return (maxHeight + height);
            }
            return statusBarHeight;
        }
    }
    
    /// tabBar的高度
    static var tabBarHeight: CGFloat {
        get {
            let tabBarController = KWRootViewController() as! UITabBarController;
            return tabBarController.tabBar.kw_height;
        }
    }

    /// 页面的真实显示高度，有tabBar时
    /// 除去状态栏、导航栏、tabBar，页面的高度
    static var safeAreaHeightT: CGFloat {
        get {
            return (KW_Screen.height - KW_Screen.topHeight - KW_Screen.tabBarHeight);
        }
    }
    
    /// /// 页面的真实显示高度，没有tabBar时
    /// 除去状态栏、导航栏，页面的高度
    static var safeAreaHeightN: CGFloat {
        get {
            return (KW_Screen.height - KW_Screen.topHeight);
        }
    }
    
    /// 以iphone 6 为基准的比例计算
    ///
    /// - Parameter size: iphone6 时的尺寸
    /// - Returns: 相对应的比例尺寸
    static func kw_scale_6(size: CGFloat) -> CGFloat {
        return KW_Screen.width * (size / 375.0);
    }
    
    /// 以iphone 5s 为基准的比例计算
    ///
    /// - Parameter size: iphone5s 时的尺寸
    /// - Returns: 相对应的比例尺寸
    func kw_scale_5s(size: CGFloat) -> CGFloat {
        return KW_Screen.width * (size / 320.0);
    }
    
}
