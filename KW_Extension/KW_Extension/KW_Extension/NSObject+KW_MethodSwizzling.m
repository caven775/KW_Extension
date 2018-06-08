//
//  NSObject+KW_MethodSwizzling.m
//  KW_Extension
//
//  Created by LKW on 2018/6/8.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "NSObject+KW_MethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (KW_MethodSwizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector
                         bySwizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@end
