//
//  NSArray+KW_SafeArray.m
//  KW_Extension
//
//  Created by LKW on 2018/6/8.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "NSArray+KW_SafeArray.h"
#import "NSObject+KW_MethodSwizzling.h"

@implementation NSArray (KW_SafeArray)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSPlaceholderArray");
        if (class != NULL) {
            [class methodSwizzlingWithOriginalSelector:@selector(initWithObjects:count:)
                                    bySwizzledSelector:@selector(kw_initWithObjects:count:)];
        }
    });
}

- (instancetype)kw_initWithObjects:(const id[])objects
                             count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id obj = objects[i];
        if (!obj) { obj = [NSNull null];}
        safeObjects[j] = obj;
        j++;
    }
    return [self kw_initWithObjects:safeObjects count:j];
}

@end
