//
//  AppRootViewController.m
//  ZLTableViewAlertController
//
//  Created by Zhangling on 2016/11/27.
//  Copyright © 2016年 Rippleinfo. All rights reserved.
//

#import "AppRootViewController.h"
AppRootViewController *sharedAppRootViewController=nil;

@interface AppRootViewController ()

@end

@implementation AppRootViewController

+(AppRootViewController *)sharedInstance{
    if (sharedAppRootViewController) {
        return sharedAppRootViewController;
    }else{
        return nil;
    }
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



#pragma mark - statusBar
//需要跟新状态栏延时的ViewController 返回即可
- (UIViewController *)childViewControllerForStatusBarStyle{
    return nil;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark - UIViewControllerRotation
-(BOOL)shouldAutorotate{// Support Autorotate InterfaceOrientations
    if ([self needChangeOrientationViewController]) {
        if ([[self needChangeOrientationViewController] respondsToSelector:@selector(shouldAutorotate)]) {
            return [[self needChangeOrientationViewController] shouldAutorotate];
        }
        return YES;
    }
    return  NO;
}



-(UIInterfaceOrientationMask)supportedInterfaceOrientations{//Support InterfaceOrientation
    if ([self needChangeOrientationViewController]) {
        return UIInterfaceOrientationMaskPortrait+UIInterfaceOrientationMaskLandscapeLeft+UIInterfaceOrientationMaskLandscapeRight;
    }
    return UIInterfaceOrientationMaskPortrait;
}

//需要转屏的ViewController 此方法返回即可
-(UIViewController*)needChangeOrientationViewController
{
    return nil;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{//First InterfaceOrientation
    return UIInterfaceOrientationPortrait;
}

-(BOOL)prefersStatusBarHidden{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
