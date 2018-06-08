//
//  NSObject+KW_MethodSwizzling.h
//  KW_Extension
//
//  Created by LKW on 2018/6/8.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KW_MethodSwizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector;

@end
