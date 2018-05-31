//
//  KW_Extension.swift
//  Finance_Swift
//
//  Created by LKW on 2018/3/13.
//  Copyright © 2018年 Udo. All rights reserved.
//

import UIKit


class KW_Extension: NSObject {
    
}

extension NSObject {
    
    /// 获取当前类的类名
    static var classNameString: String {
        get {
            return String(describing: self);
        }
    }
    
    /// 收起键盘
    func kw_resignFirstResponder() -> Void {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder as (UIResponder) -> () -> Bool),
                                        to: nil,
                                        from: nil,
                                        for: nil);
    }
    
}


// MARK: - UIview 扩展
extension UIView {
    
    
    /// 从xib加载view
    ///
    /// - Returns: view
    public class func kw_loadViewFromNib() -> Any {
        let bundle = Bundle.init(for: self);
        return bundle.loadNibNamed(NSStringFromClass(self), owner: nil, options: nil)?.last as Any;
    }
    
    
    /// 对当前view 截屏
    ///
    /// - Returns: 截屏view
    public func kw_screenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0);
        self.layer.render(in: UIGraphicsGetCurrentContext()!);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!;
    }
    
    
    public var kw_size : CGSize {
        get {
            return self.frame.size;
        }
        set {
            var size = self.frame.size;
            size.width = kw_size.width;
            size.height = kw_size.height;
            self.frame.size = size;
        }
    }
    
    public var kw_point : CGPoint {
        get {
            return self.frame.origin;
        }
        set {
            var point = self.frame.origin;
            point.x = kw_point.x;
            point.y = kw_point.y;
            self.frame.origin = point;
        }
    }
    
    public var kw_x : CGFloat {
        get {
            return self.frame.origin.x;
        }
        set {
            var point = self.frame.origin;
            point.x = kw_x;
            self.frame.origin = point;
        }
    }
    
    public var kw_y : CGFloat {
        get {
            return self.frame.origin.y;
        }
        set {
            var point = self.frame.origin;
            point.y = kw_y;
            self.frame.origin = point;
        }
    }
    
    public var kw_height : CGFloat {
        get {
            return self.frame.height;
        }
        set {
            var frame = self.frame;
            frame.size.height = kw_height;
            self.frame = frame;
        }
    }
    
    public var kw_width : CGFloat {
        get {
            return self.frame.width;
        }
        set {
            var frame = self.frame;
            frame.size.width = kw_width;
            self.frame = frame;
        }
    }
    
    public var kw_maxX : CGFloat {
        get {
            return self.frame.maxX;
        }
    }
    
    public var kw_maxY : CGFloat {
        get {
            return self.frame.maxY;
        }
    }
    
    public var kw_minX : CGFloat {
        get {
            return self.frame.minX;
        }
    }
    
    public var kw_minY : CGFloat {
        get {
            return self.frame.minY;
        }
    }
    
    public var kw_rectEmpty : Bool {
        get {
            return self.frame.isEmpty;
        }
    }
    
    public var kw_rectNull : Bool {
        get {
            return self.frame.isNull;
        }
    }
}


extension UIColor {
    
    
    /// 获取颜色
    ///
    /// - Parameter color: 16进制颜色值
    /// - Returns: 颜色
    class func HexColor(color: KW_ColorName) -> UIColor {
        return UIColor.kw_colorWithHexString(color: color.colorName);
    }
    
    public class func kw_colorWithHexString(color: String) -> UIColor {
        
        let colorString = color.replacingOccurrences(of: "#", with: "").uppercased();
        var alpha: CGFloat = 0;
        var red: CGFloat = 0;
        var green: CGFloat = 0;
        var blue: CGFloat = 0;
        
        switch colorString.count {
        case 3:
            alpha = 1.0;
            red = UIColor.kw_colorComponent(string: colorString, start: 0, length: 1);
            green = UIColor.kw_colorComponent(string: colorString, start: 1, length: 1);
            blue = UIColor.kw_colorComponent(string: colorString, start: 2, length: 1);
            break;
        case 4:
            alpha = UIColor.kw_colorComponent(string: colorString, start: 0, length: 1);
            red = UIColor.kw_colorComponent(string: colorString, start: 1, length: 1);
            green = UIColor.kw_colorComponent(string: colorString, start: 2, length: 1);
            blue = UIColor.kw_colorComponent(string: colorString, start: 3, length: 1);
            break;
        case 6:
            alpha = 1.0;
            red = UIColor.kw_colorComponent(string: colorString, start: 0, length: 2);
            green = UIColor.kw_colorComponent(string: colorString, start: 2, length: 2);
            blue = UIColor.kw_colorComponent(string: colorString, start: 4, length: 2);
            break;
        case 8:
            alpha = UIColor.kw_colorComponent(string: colorString, start: 0, length: 2);
            red = UIColor.kw_colorComponent(string: colorString, start: 2, length: 2);
            green = UIColor.kw_colorComponent(string: colorString, start: 4, length: 2);
            blue = UIColor.kw_colorComponent(string: colorString, start: 6, length: 2);
            break;
        default:
            
            break;
        }
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha);
    }
    
    private class func kw_colorComponent(string: String, start: NSInteger, length: NSInteger) -> CGFloat {
        
        let startIdx = string.index(string.startIndex, offsetBy: start);
        let endIdx = string.index(string.startIndex, offsetBy: start + length - 1);
        var fullHex = String(string[startIdx...endIdx]);
        if (length == 2) == false {
            fullHex = fullHex + fullHex;
        }
        var hexComponent: UInt64 = 0;
        let scanner = Scanner.init(string: fullHex);
        scanner.scanHexInt64(&hexComponent);
        
        return CGFloat.init(Double(hexComponent) / 255.0);
    }
}


extension String {
    
    ///base64 编码
    public var base64Encode: String? {
        get {
            return KWEncodeBase64(encode:self);
        }
    }
    
    ///base64 解码
    public var base64Decode: Any {
        get {
            return KWDecodeBase64(decode: self);
        }
    }
    
    /// 计算字符串的大小
    ///
    /// - Parameters:
    ///   - font: 字符串字体大小
    ///   - bold: 是否加粗
    ///   - size: 计算的size
    /// - Returns: 字符串实际的size
    func kw_stringSize(font: CGFloat, bold: Bool, size: CGSize) -> CGSize {
        let string = NSString.init(string: self);
        var ft: UIFont? = nil;
        if bold == true {
            ft = UIFont.boldSystemFont(ofSize: font);
        } else {
            ft = UIFont.systemFont(ofSize: font);
        }
        
        return string.boundingRect(with: size,
                                   options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                   attributes: [NSAttributedStringKey.font : ft!],
                                   context: nil).size;
    }
    
    /// 日期字符串转换成时间戳 (2018-03-13 16:56:30 ---> 1520931413)
    ///
    /// - Parameters:
    ///   - format: 日期格式
    /// - Returns: 时间戳
    func kw_dateStringToTimestamp(format: String) -> String {
        let dateFormatter = DateFormatter.init();
        dateFormatter.dateFormat = format;
        dateFormatter.timeZone = TimeZone.current;
        let date = dateFormatter.date(from: self);
        return String.init(format: "%.f", (date?.timeIntervalSince1970)!);
    }
    
    /// 时间戳转成日期字符串
    ///
    /// - Parameter format: 日期格式
    /// - Returns: 日期
    func kw_timestampToDateString(format: String) -> String {
        let date = Date.init(timeIntervalSince1970: Double(self)!);
        let dateFormatter = DateFormatter.init();
        dateFormatter.timeZone = TimeZone.current;
        dateFormatter.dateFormat = format;
        return dateFormatter.string(from: date);
    }
    
    /// 日期格式转换 （如 2018-03-13 16:56:30 --> 2018-03-13）
    ///
    /// - Parameters:
    ///   - format: 原始格式
    ///   - toFormat: 目标格式
    /// - Returns: 新的日期格式
    func kw_dateToDate(format: String, toFormat: String) -> String {
        
        let timestamp = self.kw_dateStringToTimestamp(format: format);
        
        return timestamp.kw_timestampToDateString(format: toFormat);
    }
    
    /// 获取今天的时间戳或者日期 (默认不返回时间戳, 默认返回 年月日 2018-03-13)
    ///
    /// - Parameters:
    ///   - timestamp: 是否返回时间戳
    ///   - format: 返回日期时的时间格式
    /// - Returns: 相应条件的字符串
    static func kw_todayDate(timestamp: Bool = false, format: String = "yyyy-MM-dd") -> String {
        let time = (Date.timeIntervalBetween1970AndReferenceDate + Date.timeIntervalSinceReferenceDate);
        let timestampString = String.init(format: "%.f", time);
        if timestamp == true {
            return timestampString;
        } else {
            return timestampString.kw_timestampToDateString(format: format);
        }
    }
    
    /// 检验是否为手机号
    ///
    /// - Returns: bool
    func kw_isPhoneNumber() -> Bool {
        let regex = "^134[0-8]\\d{7}$|^13[^4]\\d{8}$|^14[5-9]\\d{8}$|^15[^4]\\d{8}$|^16[6]\\d{8}$|^17[0-8]\\d{8}$|^18[\\d]{9}$|^19[8,9]\\d{8}$";
        return self.kw_predicateWithString(regex: regex);
    }
    
    /// 检验是否为身份证号码
    ///
    /// - Returns: bool
    func kw_isIDCard() -> Bool {
        return self.kw_predicateWithString(regex: "^(\\d{14}|\\d{17})(\\d|[xX])$");
    }
    
    /// 判断是否为数字
    ///
    /// - Returns: bool
    func kw_isNumber() -> Bool {
        return self.kw_predicateWithString(regex: "^[0-9]+(\\.[0-9]{1,2})?$");
    }
    
    /// 正则函数
    ///
    /// - Parameter regex: 正则表达式
    /// - Returns: bool
    func kw_predicateWithString(regex: String) -> Bool {
        if self.isEmpty { return false;}
        let predicate = NSPredicate.init(format: "SELF MATCHES%@", regex);
        return predicate.evaluate(with: self);
    }
    
    /// 根据NSRange截取子串
    ///
    /// - Parameter range: range
    /// - Returns: 子串
    func kw_subStringWithRange(range: NSRange) -> String {
        guard ((range.length + range.location) <= self.count) else { return "";}
        let startIndex = self.index(self.startIndex, offsetBy: range.location);
        let endIndex = self.index(startIndex, offsetBy: range.length);
        let subString = self.prefix(upTo: endIndex);
        let string = String(subString.suffix(from: startIndex));
        return string;
    }
    
    /// 获取子串的NSRange
    ///
    /// - Parameter subString: 子串
    /// - Returns: range
    func kw_rangeOfString(subString: String) -> NSRange {
        let nString = NSString.init(string: self);
        return nString.range(of: subString);
    }
    
    /// 对字符串格式化
    ///
    /// - Parameters:
    ///   - format: 格式化样式 如“###.00”
    ///   - roundingMode: 小数位的保留
    ///   NumberFormatter.RoundingMode.down         不做四舍五入，只做截取处理
    ///   NumberFormatter.RoundingMode.up           做四舍五入
    ///   NumberFormatter.RoundingMode.ceiling      向上进一位 当为正数时，向远离0的地方进位，当为负数时，向离靠近0的地方进位
    ///   NumberFormatter.RoundingMode.floor        当为负数数时，向远离0的地方进位，当为正数时，向离靠近0的地方进位
    ///   NumberFormatter.RoundingMode.halfEven     向最接近的整数，如果多个整数等距离靠近那个数，就选择一个偶数
    ///   NumberFormatter.RoundingMode.halfDown     向最接近的整数舍入，或如果等距离则向零
    ///   NumberFormatter.RoundingMode.halfUp       向最接近的整数舍入，或如果等距离，则离开零
    /// - Returns: 格式化字符串
    func kw_formatString(format: String, roundingMode: NumberFormatter.RoundingMode = .down) -> String {
        let number = NSNumber.init(value: Double(self)!);
        let formatter = NumberFormatter.init();
        formatter.positiveFormat = format;
        formatter.roundingMode = roundingMode;
        let formatString = formatter.string(from: number);
        guard formatString != nil else { return self;}
        return formatString!;
    }
}


extension NotificationCenter {
    static func kw_post(notification: KWNotificationName, userInfo: [AnyHashable: Any]? = nil, object: Any? = nil) -> Void {
        NotificationCenter.default.post(name: notification.Name, object: object, userInfo: userInfo);
    }
}

extension UserDefaults {
    
    static func kw_setValue(key: KWUserDefaultsName, object: Any?) -> Void {
        UserDefaults.standard.set(object, forKey: key.defaultsName);
        UserDefaults.standard.synchronize();
    }
    
    static func kw_setBool(key: KWUserDefaultsName, bool: Bool) -> Void {
        UserDefaults.standard.set(bool, forKey: key.defaultsName);
        UserDefaults.standard.synchronize();
    }

    static func kw_setInt(key: KWUserDefaultsName, int: Int) -> Void {
        UserDefaults.standard.set(int, forKey: key.defaultsName);
        UserDefaults.standard.synchronize();
    }

    static func kw_string(key: KWUserDefaultsName) -> String {
        let string = UserDefaults.standard.string(forKey: key.defaultsName);
        return (string == nil) ? "" : string!;
    }
    
    static func kw_bool(key: KWUserDefaultsName) -> Bool {
        return UserDefaults.standard.bool(forKey: key.defaultsName);
    }
    
    static func kw_int(key: KWUserDefaultsName) -> Int {
        return UserDefaults.standard.integer(forKey: key.defaultsName);
    }
}

extension UIFont {
    
    public class var font_8: UIFont {
        return UIFont.systemFont(ofSize: 8);
    }
    
    public class var font_9: UIFont {
        return UIFont.systemFont(ofSize: 9);
    }
    
    public class var font_10: UIFont {
        return UIFont.systemFont(ofSize: 10);
    }
    
    public class var font_11: UIFont {
        return UIFont.systemFont(ofSize: 11);
    }
    
    public class var font_12: UIFont {
        return UIFont.systemFont(ofSize: 12);
    }
    
    public class var font_13: UIFont {
        return UIFont.systemFont(ofSize: 13);
    }
    
    public class var font_14: UIFont {
        return UIFont.systemFont(ofSize: 14);
    }
    
    public class var font_15: UIFont {
        return UIFont.systemFont(ofSize: 15);
    }
    
    public class var font_16: UIFont {
        return UIFont.systemFont(ofSize: 16);
    }
    
    public class var font_17: UIFont {
        return UIFont.systemFont(ofSize: 17);
    }
    
    public class var font_18: UIFont {
        return UIFont.systemFont(ofSize: 18);
    }
    
    public class var font_19: UIFont {
        return UIFont.systemFont(ofSize: 19);
    }
    
    public class var font_20: UIFont {
        return UIFont.systemFont(ofSize: 20);
    }
}


extension Array {

    /// base64 编码
    public var base64Encode: String? {
        get {
            return KWEncodeBase64(encode: self);
        }
    }
}


extension Dictionary {
    
    /// base64 编码
    public var base64Encode: String? {
        get {
            return KWEncodeBase64(encode: self);
        }
    }
}

