//
//  AppRootViewController.h
//  ZLTableViewAlertController
//
//  Created by Zhangling on 2016/11/27.
//  Copyright © 2016年 Rippleinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppRootViewController : UIViewController
+(AppRootViewController *)sharedInstance;
-(UIViewController*)needChangeOrientationViewController;
@end
