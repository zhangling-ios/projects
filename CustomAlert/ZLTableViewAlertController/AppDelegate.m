//
//  AppDelegate.m
//  ZLTableViewAlertController
//
//  Created by Zhangling on 2016/11/27.
//  Copyright © 2016年 Rippleinfo. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLTableViewAlertController.h"




@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([UIDevice currentDevice].systemVersion.floatValue>=10.0) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound)
                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                  // Enable or disable features based on authorization.
                              }];
    }
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    TableViewWindowAlertController *alert=[[TableViewWindowAlertController alloc] initWithNibName:[TableViewWindowAlertController description] bundle:nil];
    alert.title=@"这是个普通的Alert";
    alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
    TableViewAlertModel *model=[TableViewAlertModel new];
    model.title=@"jasdlkfjlkasdjflkasdjfklasdjflkasdjfklasdjflkasdjflkasdjfklasdjfalksdjfkalsdjfklasjdflaksdjflkasdjflkasjdfkasjdfklasdjfkasjdflk;asdjfkalsdfja;klsdfjalk;sdjfl;kasdjflkasdjf";
    alert.datasources=[@[model] mutableCopy];
    [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
    [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
   [alert presentWithAnimation:YES completion:^{
       
   }];
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    TableViewWindowAlertController *alert=[[TableViewWindowAlertController alloc] initWithNibName:[TableViewWindowAlertController description] bundle:nil];
    alert.title=@"这是个普通的Alert";
    alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
    TableViewAlertModel *model=[TableViewAlertModel new];
    model.title=@"jasdlkfjlkasdjflkasdjfklasdjflkasdjfklasdjflkasdjflkasdjfklasdjfalksdjfkalsdjfklasjdflaksdjflkasdjflkasjdfkasjdfklasdjfkasjdflk;asdjfkalsdfja;klsdfjalk;sdjfl;kasdjflkasdjf";
    alert.datasources=[@[model] mutableCopy];
    [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
    [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //action
    }]];
    [alert presentWithAnimation:YES completion:^{
        
    }];
}





#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ZLTableViewAlertController"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
