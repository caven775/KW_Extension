//
//  KW_Screen.h
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KW_Screen : NSObject

@property (nonatomic, assign, readonly, class) CGRect bounds;
@property (nonatomic, assign, readonly, class) CGFloat width;
@property (nonatomic, assign, readonly, class) CGFloat height;
@property (nonatomic, assign, readonly, class) CGFloat topHeight;
@property (nonatomic, assign, readonly, class) CGFloat tabBarHeight;
@property (nonatomic, assign, readonly, class) CGFloat statusBarHeight;
@property (nonatomic, assign, readonly, class) CGFloat safeAreaHeightT;
@property (nonatomic, assign, readonly, class) CGFloat safeAreaHeightN;

+ (CGFloat)kw_scale_6:(CGFloat)size;
+ (CGFloat)kw_scale_5s:(CGFloat)size;

@end

