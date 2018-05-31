//
//  KW_NotificationName.swift
//  Finance_Swift
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

import Foundation


/// 注册通知
enum KWNotificationName: String {
    
    case LoginSuccess
    case LogoutSuccess
    
    var Name: NSNotification.Name {
        get {
            return NSNotification.Name("KW_" + rawValue);
        }
    }
}
