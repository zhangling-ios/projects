//
//  TestViewController.m
//  ZLTableViewAlertController
//
//  Created by Zhangling on 2016/11/27.
//  Copyright © 2016年 Rippleinfo. All rights reserved.
//

#import "TestViewController.h"
#import "ZLTableViewAlertController.h"
#import <UserNotifications/UserNotifications.h>

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)alertAction:(UIButton *)sender {
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
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
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    //当action的title很长时分2行显示
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个普通的Alert";
        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"jasdlkfjlkasdjflkasdjfklasdjflkasdjfklasdjflkasdjflkasdjfklasdjfalksdjfkalsdjfklasjdflaksdjflkasdjflkasjdfkasjdfklasdjfkasjdflk;asdjfkalsdfja;klsdfjalk;sdjfl;kasdjflkasdjf";
        alert.datasources=[@[model] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消asdfasdjkfhaksdjfkla;sdjflkasdjflkasdjfkl;asjdflk;asdjfklasdjf;lkaslkdfj;lkasjdf;lka" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个列表的Alert";
//        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个列表的Alert";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个列表的Alert";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个列表的Alert";
        alert.tableViewAlertTypeOption=alert.tableViewAlertTypeOption|TableViewAlertTypeOptionSingleChoose;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"这是个列表的Alert";
        alert.tableViewAlertTypeOption=alert.tableViewAlertTypeOption|TableViewAlertTypeOptionMultiChoose;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
}

- (IBAction)actionSheetAction:(UIButton *)sender {
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithIcon:@"Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithIcon:@"Image-2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithIcon:@"Image-3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    
    
    
    
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        //        alert.tableViewAlertTypeOption=TableViewAlertTypeOptionMessage;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        alert.tableViewAlertTypeOption=alert.tableViewAlertTypeOption|TableViewAlertTypeOptionSingleChoose;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    {
        ZLTableViewAlertController *alert=[[ZLTableViewAlertController alloc] initWithNibName:[ZLTableViewAlertController description] bundle:nil];
        alert.title=@"ActionSheet";
        alert.tableViewAlertTypeOption=alert.tableViewAlertTypeOption|TableViewAlertTypeOptionMultiChoose;
        alert.alertControllerStyle=UIAlertControllerStyleActionSheet;
        TableViewAlertModel *model=[TableViewAlertModel new];
        model.title=@"列表1";
        model.headerImageName=@"Image";
        model.color=[UIColor blackColor];
        TableViewAlertModel *model2=[TableViewAlertModel new];
        model2.title=@"列表2";
        model2.headerImageName=@"Image-2";
        model2.color=[UIColor blackColor];
        TableViewAlertModel *model3=[TableViewAlertModel new];
        model3.title=@"列表3";
        model3.headerImageName=@"Image-3";
        model3.color=[UIColor blackColor];
        alert.datasources=[@[model,model2,model3] mutableCopy];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert addTableViewAlertAction:[TableViewAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //action
        }]];
        [alert presentInParentViewController:self animation:YES completion:^{
            
        }];
    }
    
    
    
}

- (IBAction)notificationAlertAction:(UIButton *)sender {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0) {
        UNMutableNotificationContent *content=[[UNMutableNotificationContent alloc] init];
        content.title=@"App Push";
        content.subtitle=@"5 Seconds Before Push";
        content.body=@"fa;sldjfl'asdjflkasjdflkajsdfkljasdlkfjaslkdjfasdjasdjlasdjfajdfjfffsajfdljff";
        UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
        UNNotificationRequest *request=[UNNotificationRequest requestWithIdentifier:[[NSBundle mainBundle] bundleIdentifier] content:content trigger:trigger];
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (!error) {
                
            }
        }];
    }
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
