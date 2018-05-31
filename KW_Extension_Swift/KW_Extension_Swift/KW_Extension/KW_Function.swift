//
//  KW_Function.swift
//  Finance_Swift
//
//  Created by LKW on 2018/3/14.
//  Copyright © 2018年 Udo. All rights reserved.
//

import UIKit

/// 常用方法集合
class KW_Function: NSObject {

}

/// 获取当前的NavigationController
///
/// - Returns: NavigationController
public func KWTopViewController() -> UINavigationController? {
    
    let rootViewController = KWRootViewController();
    if (rootViewController.isKind(of: UINavigationController.self)) == true {
        return rootViewController as? UINavigationController;
    } else if (rootViewController.isKind(of: UITabBarController.self)) == true {
        let tabVC = rootViewController as! UITabBarController;
        return (tabVC.viewControllers![tabVC.selectedIndex]) as? UINavigationController;
    } else {
        return nil;
    }
}

/// 获取rootViewController
///
/// - Returns: rootViewController
public func KWRootViewController() -> UIViewController {
    return (UIApplication.shared.delegate?.window??.rootViewController)!
}

/// 当前屏幕显示的控制器
///
/// - Returns: 控制器
public func KWCurrentVisibleViewController() -> UIViewController? {
    return kw_findVisibleViewController(from: KWRootViewController());
}

/// 找到当前屏幕显示的控制器
///
/// - Parameter from:
/// - Returns: 控制器
func kw_findVisibleViewController(from: UIViewController?) -> UIViewController? {
    guard from != nil else { return nil;}
    let presented = from!.presentedViewController;
    if presented != nil {
        return kw_findVisibleViewController(from: presented);
    }
    
    if (from?.isKind(of: UINavigationController.classForCoder()))! {
        let navigationController = from as! UINavigationController;
        if (navigationController.viewControllers.count > 0) {
            return kw_findVisibleViewController(from: navigationController.topViewController);
        }
        return navigationController;
    } else if (from?.isKind(of: UITabBarController.classForCoder()))! {
        let tabBarController = from as! UITabBarController;
        if ((tabBarController.viewControllers?.count)! > 0) {
            return kw_findVisibleViewController(from: tabBarController.selectedViewController);
        }
        return tabBarController;
    } else {
        return from;
    }
}

/// 转成json字符串
///
/// - Parameter anyObject: 转换参数
/// - Returns: json字符串
public func KWDataToJsonString(anyObject: Any?) -> String? {
    guard anyObject != nil else { return nil;}
    let jsonData = try? JSONSerialization.data(withJSONObject: anyObject!, options: .prettyPrinted);
    guard jsonData != nil else { return nil;}
    return String.init(data: jsonData!, encoding: String.Encoding.utf8);
}

/// 通过safari打开url
///
/// - Returns: 打开状态
@discardableResult public func KWOpenURL(string: String) -> Bool {
    let url = URL.init(string: string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!);
    if url == nil { return false};
    if UIApplication.shared.canOpenURL(url!) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!);
            return true;
        } else {
            return UIApplication.shared.openURL(url!);
        };
    } else {
        let alert = UIAlertView.init(title: nil,
                                     message: "打开 \(String(describing: url?.absoluteString)) 失败",
                                     delegate: nil,
                                     cancelButtonTitle: "确定");
        alert.show();
    }
    return false;
}

/// 拨打电话
///
/// - Parameter phoneNumber: 电话号码
public func KWCallTel(phoneNumber: String?) -> Void {
    
    func alert() -> Void {
        let a = UIAlertView.init(title: nil,
                                 message: "拨打 \(String(describing: phoneNumber)) 失败",
            delegate: nil,
            cancelButtonTitle: "确定");
        a.show();
    }
    
    guard phoneNumber != nil else {
        alert();
        return;
    }
    
    var numberNew = phoneNumber!.split(separator: " ").joined(separator: "");
    numberNew = numberNew.split(separator: "-").joined(separator: "");
    numberNew = "telprompt://" + numberNew;
    let numberURL = URL.init(string: numberNew);
    if UIApplication.shared.canOpenURL(numberURL!) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(numberURL!);
        } else {
            UIApplication.shared.openURL(numberURL!);
        }
    } else {
        alert();
    }
}

/// 获取一张图片
/// 
/// - Parameters:
///   - imageName: 图片名称
///   - type: 图片类型
/// - Returns: UIImage
public func KWImage(imageName: String, type: String? = nil) -> UIImage? {
    if type != nil {
        let imagePath = KWFilePath(forResource: imageName, ofType: type!);
        guard (imagePath != nil) else { return nil;}
        return UIImage.init(contentsOfFile: imagePath!);
    }
    return UIImage.init(named: imageName);
}

/// 从文件中获取HTML字符串
///
/// - Parameter fileName: 文件名
/// - Returns: HTML字符串
public func KWReadHTMLFile(fileName: String) -> String? {
    let filePath = KWFilePath(forResource: fileName, ofType: "html");
    guard (filePath != nil) else { return nil;}
    return try? String.init(contentsOfFile: filePath!, encoding: String.Encoding.utf8);
}

/// 获取文件路径
///
/// - Parameters:
///   - forResource: 文件名
///   - ofType: 文件类型
/// - Returns: 文件路径
public func KWFilePath(forResource: String, ofType: String) -> String? {
    return Bundle.main.path(forResource: forResource, ofType: ofType);
}

/// 从标准URL中获取参数，非标准URL返回空
///
/// - Parameter url: url
/// - Returns: 参数字典
public func KWParametersFromURL(url: URL?) -> [String: String]? {
    guard url != nil else { return nil;}
    let components = URLComponents.init(url: url!, resolvingAgainstBaseURL: true);
    guard components != nil else { return nil;}
    guard components!.queryItems != nil else { return nil;}
    var parameters: [String: String] = [:];
    for item in (components?.queryItems)! {
        parameters[item.name] = item.value;
    }
    return parameters;
}

/// base64 编码
///
/// - Returns: 编码结果
public func KWEncodeBase64(encode: Any?) -> String? {
    
    guard encode != nil else { return nil;}
    //字符串编码
    let encodeString = encode as? String;
    if encodeString != nil {
        let stringData = encodeString!.data(using: String.Encoding.utf8);
        return stringData?.base64EncodedString()
    }
    
    //图片编码
    let encodeImage = encode as? UIImage;
    if encodeImage != nil {
        let imagePNGData = UIImagePNGRepresentation(encodeImage!);
        if (imagePNGData != nil) {
            return imagePNGData?.base64EncodedString();
        }
        let imageJPEGData = UIImageJPEGRepresentation(encodeImage!, 1.0);
        return imageJPEGData?.base64EncodedString()
    }
    
    //json对象编码
    let jsonData = try? JSONSerialization.data(withJSONObject: encode!, options: .prettyPrinted);
    if jsonData != nil {
        return jsonData!.base64EncodedString();
    }

    return nil;
}

/// base64 解码
///
/// - Returns: 解码结果
public func KWDecodeBase64(decode: String?) -> Any {
    guard decode != nil else { return NSNull.init();}
    let baseData = Data.init(base64Encoded: decode!);
    guard baseData != nil else { return NSNull.init();}
    
    //json对象
    let decodeDict = try? JSONSerialization.jsonObject(with: baseData!, options: .allowFragments);
    if decodeDict != nil { return decodeDict!;}
    
    //字符串
    let decodeString = String.init(data: baseData!, encoding: String.Encoding.utf8);
    if decodeString != nil { return decodeString!}
    
    //图片
    let decodeImage = UIImage.init(data: baseData!);
    if decodeImage != nil { return decodeImage!;}
    
    return NSNull.init();
}

/// 从iTunes的下载地址中获取app的AppleID
///
/// - Parameter itunesURL: iTunes的下载地址
/// - Returns: AppleID
public func KWAppleIDFromURL(itunesURL: String?) -> String? {
    guard itunesURL != nil else { return nil;}
    let url = URL.init(string: itunesURL!);
    guard (url!.host == "itunes.apple.com") else { return nil;}
    let paths = url!.path.split(separator: "/");
    
    var AppleID: String? = nil;
    
    for idx in stride(from: (paths.count - 1), through: 0, by: -1) {
        let xPath = String(paths[idx]);
        var range = xPath.kw_rangeOfString(subString: "id");
        if (range.location == NSNotFound) {
            range = xPath.kw_rangeOfString(subString: "ID");
        }
        if (range.location != NSNotFound) {
            let startIndex = xPath.index(xPath.startIndex, offsetBy: range.length);
            AppleID = String(xPath.suffix(from: startIndex));
            break;
        }
    }
    
    return AppleID;
}




