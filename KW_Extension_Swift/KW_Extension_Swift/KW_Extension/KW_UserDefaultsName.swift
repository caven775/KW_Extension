//
//  KW_UserDefaultsName.swift
//  Finance_Swift
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

import Foundation


/// 注册UserDefaultsName
enum KWUserDefaultsName: String {
    case    token
    case    sessionID
    
    
    var defaultsName: String {
        return "KW_UserDefaults_" + rawValue;
    }
}
