//
//  ZLTableViewAlertController.h
//  Sens8
//
//  Created by Zhangling on 2016/11/11.
//  Copyright © 2015年 Zhangling. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, TableViewAlertTypeOption) {
    TableViewAlertTypeOptionNone                          = 0 <<  0,
    TableViewAlertTypeOptionAutomaticDimension            = 1 <<  0,
    TableViewAlertTypeOptionDisautomaticDimension         = 1 <<  1,
    TableViewAlertTypeOptionSingleChoose                  = 1 <<  2,
    TableViewAlertTypeOptionMultiChoose                   = 1 <<  3,
    TableViewAlertTypeOptionMessage                       = 1 <<  4,
    TableViewAlertTypeOptionClickStillAlert               = 1 <<  5,
    
};

typedef NS_OPTIONS(NSUInteger, TableViewAlertCellTypeOption) {
    TableViewAlertCellTypeOptionNone                          = 0 <<  0,
    TableViewAlertCellTypeOptionHeaderButton                  = 1 <<  0,
    TableViewAlertCellTypeOptionHeaderButtonTinkColor         = 1 <<  1,
    TableViewAlertCellTypeOptionDefaultContent                = 1 <<  2,
    TableViewAlertCellTypeOptionCenterIconContent             = 1 <<  3,
    
};


@interface TableViewAlertTitleView : UIView
@property (strong, nonatomic) UIVisualEffectView *visualEffectView;
@property (strong, nonatomic) UILabel *titleLab;
@property (strong,nonatomic) UIColor *titleColor;
@property (strong,nonatomic) UIFont *titleFont;
@end
@interface TableViewAlertActionView : UIView
@end
@interface TableViewAlertContentView : UIView
@property (strong, nonatomic) UIVisualEffectView *visualEffectView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIColor *cellTitleColor;
@property (strong, nonatomic) UILabel *messageLab;
@property (strong, nonatomic) UIImageView *alertBGIcon;
@property (strong, nonatomic) NSLayoutConstraint *tableViewHeightConstraint;
@end
@interface TableViewAlertCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (strong,nonatomic) IBOutlet UIImageView *headerIcon;
@property (strong,nonatomic) IBOutlet UIButton *headerBtn;
@end
@interface TableViewAlertCenterIconCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UIImageView *headerIcon;
@property (strong,nonatomic) IBOutlet UIButton *headerBtn;
@end
@interface TableViewAlertAction : UIAlertAction
@property (strong,nonatomic)UIColor *color;
@property (copy,nonatomic)NSString *iconName;
@property (assign,nonatomic)CGFloat btnHeight;
@property (copy,nonatomic)NSString *customiconName;
@property (nonatomic,copy)void (^Hander)(TableViewAlertAction *action);
+(instancetype)actionWithIcon:(NSString *)iconName style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *))handler;

@end

@interface TableViewAlertModel : NSObject
@property (copy,nonatomic)NSString *title;
@property (strong,nonatomic)UIColor *color;
@property (copy,nonatomic)NSString *headerImageName;
@property (assign,nonatomic) TableViewAlertCellTypeOption tableViewAlertCellTypeOption;
@end

/*
 self.title 是Title  datasources  是
 */
@interface ZLTableViewAlertController : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerXCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerYCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewTopCons;
@property (weak, nonatomic) IBOutlet TableViewAlertTitleView *titleView;
@property (weak, nonatomic) IBOutlet TableViewAlertContentView *contentView;
@property (weak, nonatomic) IBOutlet TableViewAlertActionView *actionView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width240Cons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width320Cons;
@property (strong,nonatomic) NSMutableArray *datasources;
@property (strong,nonatomic) NSMutableArray *selectedIndexPaths;
@property (assign,nonatomic) UIBlurEffectStyle blurEffectStyle;
@property (strong,nonatomic) NSMutableArray *tableViewAlertActions;
@property (assign,nonatomic) UIAlertControllerStyle alertControllerStyle;
@property (assign,nonatomic) TableViewAlertTypeOption tableViewAlertTypeOption;
@property (copy,nonatomic) void (^HideBlock)(UIButton *sender);
- (void)dismissAnimation:(BOOL)flag completion:(void (^)(BOOL finished))completion;
- (void)addTableViewAlertAction:(TableViewAlertAction *)action;
-(void)presentInParentViewController:(UIViewController *)parentViewController animation:(BOOL) flag completion:(void (^)(void))completion;
-(void)resetupUI;

@end

@interface TableViewWindow : UIWindow
@property (strong,nonatomic) NSMutableArray *tableViewWindowAlertControllers;
+(instancetype)sharedInstance;
@end
@interface TableViewWindowAlertRootController : UIViewController

@end

@interface TableViewWindowAlertController : ZLTableViewAlertController
@property (assign,nonatomic,getter=isDismiss)BOOL dismiss;
-(void)presentWithAnimation:(BOOL)flag completion:(void (^)(void))completion;
@end


