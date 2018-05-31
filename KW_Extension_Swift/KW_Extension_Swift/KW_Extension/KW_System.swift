//
//  KW_System.swift
//  Finance_Swift
//
//  Created by LKW on 2018/5/29.
//  Copyright © 2018年 Udo. All rights reserved.
//

import UIKit
import AdSupport

/// 系统信息类
class KW_System: NSObject {

    /// 获取app的版本号
    static var appVersion: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String;
        }
    }
    
    /// 获取app的build版本号
    static var appBuildVersion: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String;
        }
    }
    
    /// 获取当前项目的项目名
    static var projectName: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String;
        }
    }
    
    /// 获取当前app的bundleIdentifier
    static var bundleIdentifier: String {
        get {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String;
        }
    }
    
    ///// 获取当前设备系统版本号
    static var deviceVersion: String {
        get {
            return UIDevice.current.systemVersion;
        }
    }
    
    /// 获取一个UUID
    static var UUID: String? {
        get {
            return UIDevice.current.identifierForVendor?.uuidString;
        }
    }
    
    /// 获取IFAF
    static var IDFA: String {
        get {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString;
        }
    }
    
    /// 获取设备名称，如iPhone 5s iPhone 6 iPhone 6s ....
    static var iPhoneName: String {
        get {
            return KW_System.kw_iPhoneName();
        }
    }
    
    /// 获取设备名称，如iphone 5s iphone 6 iphone 6s ....
    ///
    /// - Returns: 设备名称
    private static func kw_iPhoneName() -> String {
        var systemInfo: utsname = utsname.init();
        uname(&systemInfo);
        let machineMirror = Mirror.init(reflecting: systemInfo.machine);
        let identifier = machineMirror.children.reduce("") { (identifier, element) -> String in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)));
        }
    
        switch identifier {
            case "iPod1,1":  return "iPod Touch 1"
            case "iPod2,1":  return "iPod Touch 2"
            case "iPod3,1":  return "iPod Touch 3"
            case "iPod4,1":  return "iPod Touch 4"
            case "iPod5,1":  return "iPod Touch (5 Gen)"
            case "iPod7,1":   return "iPod Touch 6"
            
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":  return "iPhone 4"
            case "iPhone4,1":   return "iPhone 4s"
            case "iPhone5,1":   return "iPhone 5"
            case  "iPhone5,2":  return "iPhone 5 (GSM+CDMA)"
            case "iPhone5,3":  return "iPhone 5c (GSM)"
            case "iPhone5,4":  return "iPhone 5c (GSM+CDMA)"
            case "iPhone6,1":  return "iPhone 5s (GSM)"
            case "iPhone6,2":  return "iPhone 5s (GSM+CDMA)"
            case "iPhone7,2":  return "iPhone 6"
            case "iPhone7,1":  return "iPhone 6 Plus"
            case "iPhone8,1":  return "iPhone 6s"
            case "iPhone8,2":  return "iPhone 6s Plus"
            case "iPhone8,4":  return "iPhone SE"
            case "iPhone9,1":   return "iPhone 7"
            case "iPhone9,2":  return "iPhone 7 Plus"
            case "iPhone9,3":  return "iPhone 7"
            case "iPhone9,4":  return "iPhone 7 Plus"
            case "iPhone10,1","iPhone10,4":   return "iPhone 8"
            case "iPhone10,2","iPhone10,5":   return "iPhone 8 Plus"
            case "iPhone10,3","iPhone10,6":   return "iPhone X"
            
            case "iPad1,1":   return "iPad"
            case "iPad1,2":   return "iPad 3G"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":   return "iPad 2"
            case "iPad2,5", "iPad2,6", "iPad2,7":  return "iPad Mini"
            case "iPad3,1", "iPad3,2", "iPad3,3":  return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":   return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":   return "iPad Air"
            case "iPad4,4", "iPad4,5", "iPad4,6":  return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":  return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":  return "iPad Mini 4"
            case "iPad5,3", "iPad5,4":   return "iPad Air 2"
            case "iPad6,3", "iPad6,4":  return "iPad Pro 9.7"
            case "iPad6,7", "iPad6,8":  return "iPad Pro 12.9"
            case "AppleTV2,1":  return "Apple TV 2"
            case "AppleTV3,1","AppleTV3,2":  return "Apple TV 3"
            case "AppleTV5,3":   return "Apple TV 4"
            case "i386", "x86_64":   return "Simulator"
            default:  return identifier
        }
    }
    
}


