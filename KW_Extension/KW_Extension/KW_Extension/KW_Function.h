//
//  KW_Function.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG
# define KWLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] " fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define KWLog(...);
#endif

typedef NS_ENUM(NSInteger, HXSortArrayType) {
    HXSortArrayAscending,
    HXSortArrayDescending
};

@interface KW_Function : NSObject

@end

/**
 base64 编码

 @param encode 编码对象
 @return 编码结果字串
 */
FOUNDATION_EXTERN NSString * KWEncodeBase64(id encode);

/**
 base64 解码

 @param decode 解码对象
 @return 解码结果
 */
FOUNDATION_EXTERN id KWDecodeBase64(NSString * decode);

/**
 获取根控制器

 @return 根控制器
 */
FOUNDATION_EXTERN UIViewController * KWRootViewController(void);

/**
 获取当前的NavigationController

 @return NavigationController
 */
FOUNDATION_EXTERN UINavigationController * KWTopNavigationController(void);

/**
 当前屏幕显示的控制器

 @return 控制器
 */
FOUNDATION_EXTERN UIViewController * KWCurrentVisibleViewController(void);

/**
 找到当前屏幕显示的控制器

 @param from 来源
 @return 目标
 */
FOUNDATION_EXTERN UIViewController * KWFindVisibleViewController(UIViewController * from);

/**
 从url中获取参数，必须为标准url

 @param url url
 @return 参数字典
 */
FOUNDATION_EXTERN NSDictionary * KWParametersFromURL(NSString * url);

/**
 给url追加参数

 @param baseURL url
 @param parameters 参数
 @return url
 */
FOUNDATION_EXTERN NSURL * KWParametersToURL(NSString * baseURL, NSDictionary * parameters);

/**
 获取最大数

 @param number 比较参数
 @param ... 参数列表
 @return 最大值
 */
FOUNDATION_EXTERN NSNumber * HXMAX(NSNumber * number, ...);

/**
 获取最小数

 @param number 比较参数
 @param ... 参数列表
 @return 最小值
 */
FOUNDATION_EXTERN NSNumber * HXMIN(NSNumber * number, ...);

/**
 数组排序

 @param array 排序数组
 @param sortType 排序方式
 @return 排序结果
 */
FOUNDATION_EXTERN NSArray * HXSortArray(NSArray * array, HXSortArrayType sortType);

/**
 简化NSString 的 initWithFormat

 @param format format
 @param ... 参数
 @return NSString
 */
FOUNDATION_EXTERN NSString * HXSS(NSString * format, ...);


