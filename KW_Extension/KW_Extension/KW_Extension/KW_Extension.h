//
//  KW_Extension.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KW_Function.h"
#import "UIView+KW_ViewFrame.h"

@interface KW_Extension : NSObject

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

/**
 从xib加载view

 @return view
 */
+ (instancetype)kw_loadFromNib;

/**
 对当前view 截屏

 @return 截屏view
 */
- (UIImage *)kw_screenShot;


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

@property (nonatomic, assign, readonly) BOOL isEmpty;

@property (nonatomic, copy, readonly) NSString * base64Encode;

@property (nonatomic, copy, readonly) NSString * base64DecodeString;

@property (nonatomic, strong, readonly) UIImage * base64DecodeImage;

@property (nonatomic, strong, readonly) NSArray * base64DecodeArray;

@property (nonatomic, strong, readonly) NSDictionary * base64DecodeDictionary;


@end

