//
//  KW_Extension.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KW_Extension : NSObject

@end

@interface UIDevice (HXDeviceInfo)

@property (nonatomic, copy, readonly, class) NSString * UUID;
@property (nonatomic, copy, readonly, class) NSString * appVersion;
@property (nonatomic, copy, readonly, class) NSString * appBuildVersion;
@property (nonatomic, copy, readonly, class) NSString * projectName;
@property (nonatomic, copy, readonly, class) NSString * bundleIdentifier;
@property (nonatomic, copy, readonly, class) NSString * deviceVersion;

@end


@interface NSObject (KW_Object)

/**
 获取当前类的类名
 */
@property (nonatomic, copy, class, readonly) NSString * kClassName;

/**
 收起键盘
 */
- (void)kw_resignFirstResponder;

@end


@interface UIView (KW_View)


@property (nonatomic, copy, readonly) NSArray <UIView *>* allSubViews;


/**
 对当前view 截屏

 @return 截屏view
 */
- (UIImage *)kw_screenShot;

/**
 获取所有子view

 @return views
 */
- (NSArray *)kw_allSubViews;

@end


@interface UIColor (KW_Color)

/**
 获取颜色

 @param hexString 颜色值
 @return 颜色
 */
+ (UIColor *)KWColorWithHexString:(NSString *)hexString;

@end


@interface NSString (KW_String)

/**
 字符串是否为空
 */
@property (nonatomic, assign, readonly) BOOL isEmpty;

@property (nonatomic, assign, readonly) BOOL isPhoneNumber;
@property (nonatomic, assign, readonly) BOOL isIDCard;
@property (nonatomic, assign, readonly) BOOL isNumber;

/**
 base64字符串 解码
 */
@property (nonatomic, strong, readonly) id base64Decode;

/**
 base64 编码
 */
@property (nonatomic, copy, readonly) NSString * base64Encode;

/**
 字符串的size

 @param font 字体大小
 @param size 计算size
 @param bold 是否加粗
 @return 实际size
 */
- (CGSize)kw_sizeWithFont:(CGFloat)font size:(CGSize)size bold:(BOOL)bold;

/**
 日期字符串转换成时间戳 (2018-03-13 16:56:30 ---> 1520931413)

 @param format 日期格式
 @return 时间戳
 */
- (NSString *)kw_dateStringToTimestamp:(NSString *)format;

/**
 时间戳转成日期字符串

 @param format 日期格式
 @return 日期
 */
- (NSString *)kw_timestampToDateString:(NSString *)format;

/**
 日期格式转换 （如 2018-03-13 16:56:30 --> 2018-03-13）

 @param format 原始格式
 @param anotherFormat 目标格式
 @return 新的日期格式
 */
- (NSString *)kw_dateToAnotherDate:(NSString *)format toFormat:(NSString *)anotherFormat;

/**
 获取今天的日期

 @param format 日期格式
 @return 今天的日期
 */
+ (NSString *)kw_todayDate:(NSString *)format;

/**
 正则函数

 @param regex 正则表达式
 @return bool
 */
- (BOOL)kw_predicateWithString:(NSString *)regex;

/**
 对字符串格式化

 @param format 格式化样式 如“###.00”
 @param mode 小数位的保留
 NSNumberFormatterRoundCeiling                  向上进一位 当为正数时，向远离0的地方进位，当为负数时，向离靠近0的地方进位
 NSNumberFormatterRoundFloor                    当为负数数时，向远离0的地方进位，当为正数时，向离靠近0的地方进位
 NSNumberFormatterRoundDown                     不做四舍五入，只做截取处理
 NSNumberFormatterRoundUp                       四舍五入
 NSNumberFormatterRoundHalfEven                 向最接近的整数，如果多个整数等距离靠近那个数，就选择一个偶数
 NSNumberFormatterRoundHalfDown                 向最接近的整数舍入，或如果等距离则向零
 NSNumberFormatterRoundHalfUp                   向最接近的整数舍入，或如果等距离，则离开零
 @return 格式化字符串
 */
- (NSString *)kw_format:(NSString *)format roundingMode:(NSNumberFormatterRoundingMode)mode;

/**
 从标准url中获取参数

 @return 参数字典
 */
- (nullable NSDictionary *)kw_parametersFromURL;

/**
 获取字符串中所有指定子串的range

 @param subString 查找的子串
 @return NSArray <NSValue *>
 */
- (NSArray <NSValue *>*)hx_allRangesWithSubString:(NSString *)subString;

@end


@interface NSArray (KW_Array)

@property (nonatomic, strong, readonly) id anyObject;
@property (nonatomic, copy, readonly) NSString * base64Encode;

- (NSArray *)kw_allObjects;

@end


@interface NSDictionary (KW_Dictionary)

@property (nonatomic, copy, readonly) NSString * base64Encode;

@end


@interface NSDateFormatter (KW_DateFormatter)

@property (nonatomic, strong, readonly, class) NSDateFormatter * kDateFormatter;

@end


@interface UIAlertController (HXAlert)

- (void)hx_addActions:(NSArray <UIAlertAction *>*)actions;

- (void)hx_show;

@end


@interface UIViewController (HXPresentViewController)


@end



