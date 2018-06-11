//
//  KW_AppDelegateModule.m
//  KW_Extension
//
//  Created by LKW on 2018/6/11.
//  Copyright © 2018年 Udo. All rights reserved.
//

#import "KW_AppDelegateModule.h"

@interface KW_AppDelegateModule ()

@property (nonatomic, strong) NSMutableArray <id<KW_Module>>* modules;

@end

@implementation KW_AppDelegateModule

+ (instancetype)sharedModule
{
    static KW_AppDelegateModule * module = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        module = [[self alloc] init];
    });
    return module;
}

- (NSMutableArray<id<KW_Module>> *)modules
{
    if (!_modules) {
        _modules = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _modules;
}

- (void)loadModulesWithPlistFile:(NSString *)filePath
{
    NSArray * modules = [NSArray arrayWithContentsOfFile:filePath];
    modules = [modules sortedArrayUsingComparator:^NSComparisonResult(NSDictionary * obj1, NSDictionary * obj2) {
        NSComparisonResult x = [(NSNumber *)obj1[@"module_level"] compare:(NSNumber *)obj2[@"module_level"]];
        return (x == NSOrderedDescending) ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    for (NSDictionary * module in modules) {
        NSString * module_name = module[@"module_name"];
        if (!(!module_name.length || !module_name || [module_name isEqual:[NSNull null]])) {
            //有module_name
            Class class = NSClassFromString(module_name);
            if (class != NULL) {
                id<KW_Module> x = [[class alloc] init];
                if (x) {
                    [self.modules addObject:x];
                }
            }
        }
    }
}

- (NSArray<id<KW_Module>> *)allModules
{
    return self.modules;
}


#pragma mark -- application Launching time

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

#pragma mark -- application active

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillResignActive:application];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillTerminate:application];
        }
    }
}


#pragma mark -- application background foreground

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillEnterForeground:application];
        }
    }
}


#pragma mark -- application open URL

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options API_AVAILABLE(ios(9.0))
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:app openURL:url options:options];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application handleOpenURL:url];
        }
    }
    return YES;
}


#pragma mark -- register notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

 - (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}


#pragma mark -- receive notification

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveLocalNotification:notification];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application performFetchWithCompletionHandler:completionHandler];
        }
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
API_AVAILABLE(ios(10.0))
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
        }
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
API_AVAILABLE(ios(10.0))
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
        }
    }
}


#pragma mark -- application memoryWarning

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidReceiveMemoryWarning:application];
        }
    }
}


#pragma mark -- application backgroundURLSession

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application handleEventsForBackgroundURLSession:identifier completionHandler:completionHandler];
        }
    }
}


#pragma mark -- application other

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
API_AVAILABLE(ios(9.0))
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply NS_AVAILABLE_IOS(8_2)
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application handleWatchKitExtensionRequest:userInfo reply:reply];
        }
    }
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application NS_AVAILABLE_IOS(9_0)
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationShouldRequestHealthAuthorization:application];
        }
    }
}

- (void)application:(UIApplication *)application handleIntent:(INIntent *)intent completionHandler:(void(^)(INIntentResponse *intentResponse))completionHandler NS_AVAILABLE_IOS(11_0)
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application handleIntent:intent completionHandler:completionHandler];
        }
    }
}

- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(NSString *)extensionPointIdentifier
{
    for (id<KW_Module> module in self.modules) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application shouldAllowExtensionPointIdentifier:extensionPointIdentifier];
        }
    }
    return YES;
}


@end
