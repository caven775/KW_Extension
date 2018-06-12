//
//  KW_AppDelegateModule.h
//  KW_Extension
//
//  Created by LKW on 2018/6/11.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@protocol KW_Module <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@end


/**
 模块化管理appdelegate，在开源库FRDModuleManager的基础上扩展了一些内容
 */
@interface KW_AppDelegateModule : NSObject <KW_Module>

+ (instancetype)sharedModule;

/**
 从plist文件里获取所有模块
 plist的格式,
 module_level: 模块的启动优先级，数值越大，优先级越高
 module_name: 模块的类名
 exmple:
 (
 {
 "module_level" = 200;
 "module_name" = "KW_NotificationModule";
 },
 {
 "module_level" = 100;
 "module_name" = "KW_AppVersionModule";
 },
 {
 "module_level" = 0;
 "module_name" = "KW_UserLocationModule";
 }
 )
 @param filePath 文件路径
 */
- (void)loadModulesWithPlistFile:(NSString *)filePath;

/**
 获取所有模块

 @return 所有模块
 */
- (NSArray <id<KW_Module>>*)allModules;


@end
