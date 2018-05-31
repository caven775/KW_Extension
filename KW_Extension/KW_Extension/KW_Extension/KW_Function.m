//
//  KW_Function.m
//  KW_Extension
//
//  Created by LKW on 2018/5/31.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "KW_Function.h"

@implementation KW_Function

@end


NSString * KWEncodeBase64(id encode)
{
    if (encode == nil) { return nil;}
    NSData * encodeData = nil;
    if ([encode isKindOfClass:[NSString class]]) {
        encodeData = [(NSString *)encode dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([encode isKindOfClass:[UIImage class]]) {
        encodeData = UIImagePNGRepresentation((UIImage *)encode);
        if (encodeData == nil) { encodeData = UIImageJPEGRepresentation((UIImage *)encode, 1.0);}
    } else if ([encode isKindOfClass:[NSArray class]] || [encode isKindOfClass:[NSDictionary class]]) {
        encodeData = [NSJSONSerialization dataWithJSONObject:encode options:NSJSONWritingPrettyPrinted error:nil];
    }
    if (encodeData == nil) { return nil;}
    return [encodeData base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
}

id KWDecodeBase64(NSString * decode)
{
    if ((decode == nil || decode.length == 0 || [decode isEqual:[NSNull null]])) { return nil;}
    NSData * decodeData = [[NSData alloc] initWithBase64EncodedString:decode options:(NSDataBase64DecodingOptions)0];
    if (decodeData == nil) { return nil;}
    id decodeObj = nil;
    
    decodeObj = [[NSString alloc] initWithData:decodeData encoding:(NSStringEncoding)4];
    if (decodeObj) { return decodeObj;}
    
    decodeObj = [[UIImage alloc] initWithData:decodeData];
    if (decodeObj) { return decodeObj;}
    
    decodeObj = [NSJSONSerialization JSONObjectWithData:decodeData options:NSJSONReadingAllowFragments error:nil];
    return decodeObj;
}

UIViewController * KWRootViewController(void)
{
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

UINavigationController * KWTopNavigationController(void)
{
    UIViewController * rootViewController = KWRootViewController();
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)rootViewController;
    } else if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabVC = (UITabBarController *)rootViewController;
        return (UINavigationController *)[tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
    } else {
        return nil;
    }
}

UIViewController * KWCurrentVisibleViewController(void)
{
    return KWFindVisibleViewController(KWRootViewController());
}

UIViewController * KWFindVisibleViewController(UIViewController * from)
{
    if (from == nil) { return nil;}
    UIViewController * presented = from.presentedViewController;
    if (presented != nil) { KWFindVisibleViewController(presented);}
    
    if ([from isKindOfClass:[UINavigationController class]]) {
        UINavigationController * navi = (UINavigationController *)from;
        if ([navi viewControllers].count) {
            return KWFindVisibleViewController([navi topViewController]);
        }
        return navi;
    } else if ([from isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tab = (UITabBarController *)from;
        if (tab.viewControllers.count) {
            return KWFindVisibleViewController(tab.selectedViewController);
        }
        return tab;
    } else {
        return from;
    }
}
