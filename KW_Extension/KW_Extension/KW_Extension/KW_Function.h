//
//  KW_Function.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

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
