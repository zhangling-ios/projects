//
//  ZLTableViewAlertController.m
//  Sens8
//
//  Created by Zhangling on 2016/11/11.
//  Copyright © 2015年 Zhangling. All rights reserved.
//

#import "ZLTableViewAlertController.h"
#import "UIView+Category.h"

@implementation TableViewAlertTitleView
@end
@implementation TableViewAlertActionView
@end
@implementation TableViewAlertContentView
@end
@implementation TableViewAlertCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
@implementation TableViewAlertCenterIconCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
@implementation TableViewAlertAction

+(instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction * _Nonnull))handler{
    TableViewAlertAction *action=[super actionWithTitle:title style:style handler:handler];
    action.Hander=handler;
    action.btnHeight=54;
    return action;
}
+(instancetype)actionWithIcon:(NSString *)iconName style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction * _Nonnull))handler{
    TableViewAlertAction *action=[super actionWithTitle:@"" style:style handler:handler];
    action.iconName=iconName;
    action.Hander=handler;
    action.btnHeight=54;
    return action;
}

@end

@implementation TableViewAlertModel
//+(instancetype)new{
//    TableViewAlertModel *model=[super new];
//    model
//}
-(instancetype)init{
    self=[super init];
    if (self) {
        self.tableViewAlertCellTypeOption=TableViewAlertCellTypeOptionHeaderButton|TableViewAlertCellTypeOptionHeaderButtonTinkColor|TableViewAlertCellTypeOptionDefaultContent;
        
    }
    return self;
}
@end

@interface ZLTableViewAlertController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *buttons;
@property (strong,nonatomic) NSMutableArray *customIcons;
@end

@implementation ZLTableViewAlertController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _tableViewAlertTypeOption=TableViewAlertTypeOptionDisautomaticDimension;
        _alertControllerStyle=UIAlertControllerStyleAlert;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}







- (void)addTableViewAlertAction:(TableViewAlertAction *)action;{
    if (!_tableViewAlertActions) {
        _tableViewAlertActions=[NSMutableArray new];
    }
    [_tableViewAlertActions addObject:action];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


-(void)setupUI{
    switch (_alertControllerStyle) {
        case UIAlertControllerStyleActionSheet:
        {
            [NSLayoutConstraint deactivateConstraints:@[_centerXCons,_centerYCons,_width240Cons,_width320Cons]];
        }
            break;
            
        default:
        {
            [NSLayoutConstraint deactivateConstraints:@[_leftCons,_rightCons,_bottomCons]];
        }
            break;
    }
    _blurEffectStyle=UIBlurEffectStyleExtraLight;
    _containerView.layer.cornerRadius=8;
    _containerView.layer.masksToBounds=YES;
    self.view.backgroundColor=[UIColor clearColor];
    _titleView.titleLab=[[UILabel alloc] initWithFrame:CGRectZero];
    _titleView.titleLab.translatesAutoresizingMaskIntoConstraints=NO;
    [_titleView addSubview:_titleView.titleLab];
    
    _titleView.titleLab.textAlignment=NSTextAlignmentCenter;
    _titleView.titleLab.numberOfLines=0;
    _titleView.titleLab.text=self.title;
    if (self.title.length==0) {
        [_titleView.titleLab addConsTLBRInSuperView:_titleView constant:0];
        
    }else{
        [_titleView.titleLab addConsTLBRInSuperView:_titleView constant:8];
    }
    _titleView.titleLab.textColor=[UIColor blackColor];
    if (_titleView.titleColor) {
        _titleView.titleLab.textColor=_titleView.titleColor;
    }
    _titleView.titleLab.font=[UIFont systemFontOfSize:20];
    if (_titleView.titleFont) {
        _titleView.titleLab.font=_titleView.titleFont;
    }
    _titleView.titleLab.preferredMaxLayoutWidth=_containerView.bounds.size.width-2*8;
    
    _titleView.visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
    _titleView.visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
   _titleView.visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
    [_titleView insertSubview:_titleView.visualEffectView atIndex:0];
    [_titleView.visualEffectView addConsTLBRInSuperView:_titleView constant:0];
    
    

    if (_tableViewAlertTypeOption&TableViewAlertTypeOptionMessage) {
        _contentView.messageLab=[[UILabel alloc] initWithFrame:CGRectZero];
        _contentView.messageLab.translatesAutoresizingMaskIntoConstraints=NO;
        [_contentView addSubview:_contentView.messageLab];
        [_contentView.messageLab addConsTLBRInSuperView:_contentView constant:8];
        TableViewAlertModel *model=[_datasources firstObject];
        _contentView.messageLab.text=model.title;
        _contentView.messageLab.numberOfLines=0;
        _contentView.messageLab.textAlignment=NSTextAlignmentCenter;
        _contentView.messageLab.textColor=[UIColor blackColor];
        if (model.color) {
            _contentView.messageLab.textColor=model.color;
        }
        _contentView.messageLab.preferredMaxLayoutWidth=_containerView.bounds.size.width-2*8;
    }else{
        _contentView.tableView=[[UITableView alloc] initWithFrame:CGRectZero];
        _contentView.tableView.translatesAutoresizingMaskIntoConstraints=NO;
        if (_tableViewAlertTypeOption&TableViewAlertTypeOptionAutomaticDimension) {
            _contentView.tableView.rowHeight=UITableViewAutomaticDimension;
            _contentView.tableView.estimatedRowHeight=64;
        }else{
            _contentView.tableView.rowHeight=64;
        }
        _contentView.tableView.delegate=self;
        _contentView.tableView.dataSource=self;
        _contentView.tableView.backgroundColor=[UIColor clearColor];
        [_contentView.tableView registerNib:[UINib nibWithNibName:[TableViewAlertCell description] bundle:nil] forCellReuseIdentifier:[TableViewAlertCell description]];
         [_contentView.tableView registerNib:[UINib nibWithNibName:[TableViewAlertCenterIconCell description] bundle:nil] forCellReuseIdentifier:[TableViewAlertCenterIconCell description]];
        
        [_contentView addSubview:_contentView.tableView];
        _contentView.tableViewHeightConstraint=[NSLayoutConstraint constraintWithItem:_contentView.tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:320];
        if (_datasources.count==0) {
            _contentView.tableViewHeightConstraint.constant=0;
            _contentViewTopCons.constant=0;
        }
        if (self.title.length==0){
            _contentViewTopCons.constant=0;
        }
        [_contentView.tableView addConsTLBRInSuperView:_contentView constant:0];
        [_contentView addConstraint:_contentView.tableViewHeightConstraint];
    }
    
    _contentView.visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
    _contentView.visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
    _contentView.visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
    [_contentView insertSubview:_contentView.visualEffectView atIndex:0];
    [_contentView.visualEffectView addConsTLBRInSuperView:_contentView constant:0];
    
    UIButton *tempBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    if (!_buttons) {
        _buttons=[NSMutableArray new];
    }
    if (!_customIcons) {
        _customIcons=[NSMutableArray new];
    }
    switch (_tableViewAlertActions.count) {
        case 1:
        {
            TableViewAlertAction *action=[_tableViewAlertActions objectAtIndex:0];
            UIButton *btn= [[UIButton alloc] initWithFrame:CGRectZero];
            btn.translatesAutoresizingMaskIntoConstraints=NO;
            [btn setTitle:action.title forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
            [_actionView addSubview:btn];
            [btn setTitleColor:tempBtn.titleLabel.textColor forState:UIControlStateNormal];
            if (action.color) {
                [btn setTitleColor:action.color forState:UIControlStateNormal];
            }
            [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            NSLayoutConstraint *heightC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeHeight multiplier:0 constant:action.btnHeight];
            [_actionView addConstraint:heightC];
            [btn addConsTLBRInSuperView:_actionView constant:0];
            UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
            visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
            visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
            [_actionView insertSubview:visualEffectView belowSubview:btn];
            [visualEffectView addConsTLBRInSuperView:_actionView otherView:btn constant:0];
            ;
            if (action.customiconName) {
                UIButton *customIcon=[[UIButton alloc] initWithFrame:CGRectZero];
                customIcon.translatesAutoresizingMaskIntoConstraints=NO;
                [visualEffectView.contentView addSubview:customIcon];
                NSLayoutConstraint *customIconHeightC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
                [_actionView addConstraint:customIconHeightC];
                NSLayoutConstraint *customIconWidthC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
                [_actionView addConstraint:customIconWidthC];
                NSLayoutConstraint *customIconCenterXC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
                [_actionView addConstraint:customIconCenterXC];
                NSLayoutConstraint *customIconCenterYC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
                [_actionView addConstraint:customIconCenterYC];
                 customIcon.layer.cornerRadius = 25;
                customIcon.layer.masksToBounds=YES;
                [_customIcons addObject:customIcon];
                customIcon.userInteractionEnabled=NO;
                [customIcon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
                customIcon.layer.borderWidth=4;
                customIcon.layer.borderColor=[UIColor whiteColor].CGColor;
                customIcon.backgroundColor=[UIColor colorWithRed:((float)((0xffd57c & 0xFF0000) >> 16))/255.0 green:((float)((0xffd57c & 0xFF00) >> 8))/255.0 blue:((float)(0xffd57c & 0xFF))/255.0 alpha:1.0];
            }
            
            [_buttons addObject:btn];
            
        }
            break;
        case 2:
        {
            TableViewAlertAction *action=[_tableViewAlertActions objectAtIndex:0];
            TableViewAlertAction *action2=[_tableViewAlertActions objectAtIndex:1];
            BOOL half=YES;
            if (([self computeBtnWidth:action.title]>=_contentView.bounds.size.width||[self computeBtnWidth:action2.title]>=_contentView.bounds.size.width)||_alertControllerStyle==UIAlertControllerStyleActionSheet) {
                half=NO;
            }
            switch (_alertControllerStyle) {
                case UIAlertControllerStyleAlert:
                {
                    
                }
                    break;
                    
                default:
                {
                    
                }
                    break;
            }
            if (!half) {
                __block UIView *anchorView=_actionView;
                [_tableViewAlertActions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    TableViewAlertAction *action=obj;
                    UIButton *btn= [[UIButton alloc] initWithFrame:CGRectZero];
                    [_buttons addObject:btn];
                    btn.translatesAutoresizingMaskIntoConstraints=NO;
                    [btn setTitle:action.title forState:UIControlStateNormal];
                    [btn setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
                    [_actionView addSubview:btn];
                    [btn setTitleColor:tempBtn.titleLabel.textColor forState:UIControlStateNormal];
                    if (action.color) {
                        [btn setTitleColor:action.color forState:UIControlStateNormal];
                    }
                    btn.tag=idx;
                    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
                    NSLayoutConstraint *heightC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeHeight multiplier:0 constant:action.btnHeight];
                    [_actionView addConstraint:heightC];
                    NSLayoutConstraint *l=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
                    NSLayoutConstraint *r=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
                    [_actionView addConstraint:l];
                    [_actionView addConstraint:r];
                    if (idx==0) {
                        NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
                        [_actionView addConstraint:t];
                    }else{
                        NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:anchorView attribute:NSLayoutAttributeBottom multiplier:1 constant:.5];
                        [_actionView addConstraint:t];
                    }
                    
                    if (idx==_tableViewAlertActions.count-1) {
                        NSLayoutConstraint *b=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
                        [_actionView addConstraint:b];
                    }
                    UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
                    visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
                    visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
                    [_actionView insertSubview:visualEffectView belowSubview:btn];
                    [visualEffectView addConsTLBRInSuperView:_actionView otherView:btn constant:0];
                    if (action.customiconName) {
                        UIButton *customIcon=[[UIButton alloc] initWithFrame:CGRectZero];
                        customIcon.translatesAutoresizingMaskIntoConstraints=NO;
                        [visualEffectView.contentView addSubview:customIcon];
                        NSLayoutConstraint *customIconHeightC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
                        [_actionView addConstraint:customIconHeightC];
                        NSLayoutConstraint *customIconWidthC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
                        [_actionView addConstraint:customIconWidthC];
                        NSLayoutConstraint *customIconCenterXC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterXC];
                        NSLayoutConstraint *customIconCenterYC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterYC];
                        customIcon.layer.cornerRadius = 25;
                        customIcon.layer.masksToBounds=YES;
                        [_customIcons addObject:customIcon];
                        customIcon.userInteractionEnabled=NO;
                        [customIcon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
                        customIcon.layer.borderWidth=4;
                        customIcon.layer.borderColor=[UIColor whiteColor].CGColor;
                        customIcon.backgroundColor=[UIColor colorWithRed:((float)((0xffd57c & 0xFF0000) >> 16))/255.0 green:((float)((0xffd57c & 0xFF00) >> 8))/255.0 blue:((float)(0xffd57c & 0xFF))/255.0 alpha:1.0];
                    }
                    anchorView=btn;
                }];
            }else{
                
                UIButton *btn= [[UIButton alloc] initWithFrame:CGRectZero];
                [_buttons addObject:btn];
                [btn setTitleColor:tempBtn.titleLabel.textColor forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
                if (action.color) {
                    [btn setTitleColor:action.color forState:UIControlStateNormal];
                }
                btn.tag=0;
                [_actionView addSubview:btn];
                btn.translatesAutoresizingMaskIntoConstraints=NO;
                [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
                NSLayoutConstraint *heightC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeHeight multiplier:0 constant:action.btnHeight];
                [btn setTitle:action.title forState:UIControlStateNormal];
                [_actionView addConstraint:heightC];
                
                UIButton *btn2= [[UIButton alloc] initWithFrame:CGRectZero];
                [_buttons addObject:btn2];
                [btn2 setTitleColor:tempBtn.titleLabel.textColor forState:UIControlStateNormal];
                [btn2 setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
                if (action2.color) {
                    [btn2 setTitleColor:action2.color forState:UIControlStateNormal];
                }
                btn2.tag=1;
                [btn2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
                [btn2 setTitle:action2.title forState:UIControlStateNormal];
                [_actionView addSubview:btn2];
                btn2.translatesAutoresizingMaskIntoConstraints=NO;
                NSLayoutConstraint *heightC2=[NSLayoutConstraint constraintWithItem:btn2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeHeight multiplier:0 constant:action2.btnHeight];
                [btn2 setTitle:action2.title forState:UIControlStateNormal];
                [_actionView addConstraint:heightC2];
                
                NSLayoutConstraint *widthC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:btn2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
                [_actionView addConstraint:widthC];
                
                NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
                NSLayoutConstraint *b=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
                NSLayoutConstraint *l=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
                NSLayoutConstraint *r=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btn2 attribute:NSLayoutAttributeLeading multiplier:1 constant:-.5];
                NSLayoutConstraint *t2=[NSLayoutConstraint constraintWithItem:btn2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
                NSLayoutConstraint *b2=[NSLayoutConstraint constraintWithItem:btn2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
                NSLayoutConstraint *r2=[NSLayoutConstraint constraintWithItem:btn2 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
                
                [_actionView addConstraint:t];
                [_actionView addConstraint:b];
                [_actionView addConstraint:l];
                [_actionView addConstraint:r];
                
                [_actionView addConstraint:t2];
                [_actionView addConstraint:b2];
                [_actionView addConstraint:r2];
                
                {
                    UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
                    visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
                    visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
                    [_actionView insertSubview:visualEffectView belowSubview:btn];
                    [visualEffectView addConsTLBRInSuperView:_actionView otherView:btn constant:0];
                    if (action.customiconName) {
                        UIButton *customIcon=[[UIButton alloc] initWithFrame:CGRectZero];
                        customIcon.translatesAutoresizingMaskIntoConstraints=NO;
                        [visualEffectView.contentView addSubview:customIcon];
                        NSLayoutConstraint *customIconHeightC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
                        [_actionView addConstraint:customIconHeightC];
                        NSLayoutConstraint *customIconWidthC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
                        [_actionView addConstraint:customIconWidthC];
                        NSLayoutConstraint *customIconCenterXC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterXC];
                        NSLayoutConstraint *customIconCenterYC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterYC];
                        customIcon.layer.cornerRadius = 25;
                        customIcon.layer.masksToBounds=YES;
                        [_customIcons addObject:customIcon];
                        [customIcon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
                        customIcon.userInteractionEnabled=NO;
                        customIcon.layer.borderWidth=4;
                        customIcon.layer.borderColor=[UIColor whiteColor].CGColor;
                        customIcon.backgroundColor=[UIColor colorWithRed:((float)((0xffd57c & 0xFF0000) >> 16))/255.0 green:((float)((0xffd57c & 0xFF00) >> 8))/255.0 blue:((float)(0xffd57c & 0xFF))/255.0 alpha:1.0];
                    }
                }
                
                {
                    UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
                    visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
                    visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
                    [_actionView insertSubview:visualEffectView belowSubview:btn2];
                    [visualEffectView addConsTLBRInSuperView:_actionView otherView:btn2 constant:0];
                    if (action.customiconName) {
                        UIButton *customIcon=[[UIButton alloc] initWithFrame:CGRectZero];
                        customIcon.translatesAutoresizingMaskIntoConstraints=NO;
                        [visualEffectView.contentView addSubview:customIcon];
                        NSLayoutConstraint *customIconHeightC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
                        [_actionView addConstraint:customIconHeightC];
                        NSLayoutConstraint *customIconWidthC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
                        [_actionView addConstraint:customIconWidthC];
                        NSLayoutConstraint *customIconCenterXC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterXC];
                        NSLayoutConstraint *customIconCenterYC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
                        [_actionView addConstraint:customIconCenterYC];
                        customIcon.layer.cornerRadius = 25;
                        customIcon.layer.masksToBounds=YES;
                        [_customIcons addObject:customIcon];
                        [customIcon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
                        customIcon.userInteractionEnabled=NO;
                        customIcon.layer.borderWidth=4;
                        customIcon.layer.borderColor=[UIColor whiteColor].CGColor;
                        customIcon.backgroundColor=[UIColor colorWithRed:((float)((0xffd57c & 0xFF0000) >> 16))/255.0 green:((float)((0xffd57c & 0xFF00) >> 8))/255.0 blue:((float)(0xffd57c & 0xFF))/255.0 alpha:1.0];
                    }
                }
            }
            
            
            
        }
            break;
            
        default:
        {
            __block UIView *anchorView=_actionView;
            [_tableViewAlertActions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                TableViewAlertAction *action=obj;
                UIButton *btn= [[UIButton alloc] initWithFrame:CGRectZero];
                [_buttons addObject:btn];
                btn.translatesAutoresizingMaskIntoConstraints=NO;
                [btn setTitle:action.title forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
                [btn setTitleColor:tempBtn.titleLabel.textColor forState:UIControlStateNormal];
                
                if (action.color) {
                    [btn setTitleColor:action.color forState:UIControlStateNormal];
                }
                btn.tag=idx;
                [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
                [_actionView addSubview:btn];
                
                NSLayoutConstraint *heightC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeHeight multiplier:0 constant:action.btnHeight];
                [_actionView addConstraint:heightC];
                NSLayoutConstraint *l=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
                NSLayoutConstraint *r=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
                
                [_actionView addConstraint:l];
                [_actionView addConstraint:r];
                if (idx==0) {
                    NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
                    [_actionView addConstraint:t];
                }else{
                    NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:anchorView attribute:NSLayoutAttributeBottom multiplier:1 constant:0.5];
                    [_actionView addConstraint:t];
                }
                
                if (idx==_tableViewAlertActions.count-1) {
                    NSLayoutConstraint *b=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_actionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
                    [_actionView addConstraint:b];
                    
                }
                UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc] initWithFrame:CGRectZero];
                visualEffectView.effect=[UIBlurEffect effectWithStyle:_blurEffectStyle];
                visualEffectView.translatesAutoresizingMaskIntoConstraints=NO;
                [_actionView insertSubview:visualEffectView belowSubview:btn];
                [visualEffectView addConsTLBRInSuperView:_actionView otherView:btn constant:0];
                if (action.customiconName) {
                    UIButton *customIcon=[[UIButton alloc] initWithFrame:CGRectZero];
                    customIcon.translatesAutoresizingMaskIntoConstraints=NO;
                    [visualEffectView.contentView addSubview:customIcon];
                    NSLayoutConstraint *customIconHeightC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
                    [_actionView addConstraint:customIconHeightC];
                    NSLayoutConstraint *customIconWidthC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeWidth multiplier:0 constant:50];
                    [_actionView addConstraint:customIconWidthC];
                    NSLayoutConstraint *customIconCenterXC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
                    [_actionView addConstraint:customIconCenterXC];
                    NSLayoutConstraint *customIconCenterYC=[NSLayoutConstraint constraintWithItem:customIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:visualEffectView.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
                    [_actionView addConstraint:customIconCenterYC];
                    [_customIcons addObject:customIcon];
                    customIcon.layer.cornerRadius = 25;
                    customIcon.layer.masksToBounds=YES;
                    customIcon.layer.borderWidth=4;
                    [customIcon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
                    customIcon.userInteractionEnabled=NO;
                    customIcon.layer.borderColor=[UIColor whiteColor].CGColor;
                    customIcon.backgroundColor=[UIColor colorWithRed:((float)((0xffd57c & 0xFF0000) >> 16))/255.0 green:((float)((0xffd57c & 0xFF00) >> 8))/255.0 blue:((float)(0xffd57c & 0xFF))/255.0 alpha:1.0];
                }
                anchorView=btn;
            }];
        }
            break;
    }
    [_containerView updateConstraints];
    [_containerView layoutIfNeeded];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}


-(CGFloat)computeBtnWidth:(NSString *)title{
    UIButton *btn= [[UIButton alloc] initWithFrame:CGRectZero];
    [self.view addSubview:btn];
    btn.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint *heightC=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0 constant:64];
    [btn setTitle:title forState:UIControlStateNormal];
    [self.view addConstraint:heightC];
    [btn updateConstraints];
    [btn layoutIfNeeded];
    CGFloat width=btn.bounds.size.width;
    [btn removeFromSuperview];
    return width;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datasources.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewAlertModel *model=[_datasources objectAtIndex:indexPath.row];
    if (model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionDefaultContent) {
        TableViewAlertCell *cell=[tableView dequeueReusableCellWithIdentifier:[TableViewAlertCell description] forIndexPath:indexPath];
        cell.backgroundColor=[UIColor clearColor];
        cell.titleLab.text=model.title;
        if (model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionHeaderButton) {
            [cell.headerBtn setImage:[UIImage imageNamed:model.headerImageName] forState:UIControlStateNormal];
            if (model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionHeaderButtonTinkColor) {
                cell.headerBtn.tintColor=model.color;
            }else{
                cell.headerBtn.backgroundColor=model.color;
            }
        }else{
            cell.headerIcon.image=[UIImage imageNamed:model.headerImageName];
        }
        if ((_tableViewAlertTypeOption&TableViewAlertTypeOptionSingleChoose)||(_tableViewAlertTypeOption&TableViewAlertTypeOptionMultiChoose)) {
            if (_selectedIndexPaths.count==0) {
                cell.accessoryType=UITableViewCellAccessoryNone;
            }else{
                if ([_selectedIndexPaths containsObject:indexPath]) {
                    cell.accessoryType=UITableViewCellAccessoryCheckmark;
                }else{
                    cell.accessoryType=UITableViewCellAccessoryNone;
                }
            }
            
        }else{
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _contentView.tableViewHeightConstraint.constant=_contentView.tableView.contentSize.height;
            [_contentView layoutIfNeeded];
        });
        
        return cell;
    }else if(model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionCenterIconContent){
        TableViewAlertCenterIconCell *cell=[tableView dequeueReusableCellWithIdentifier:[TableViewAlertCenterIconCell description] forIndexPath:indexPath];
        cell.backgroundColor=[UIColor clearColor];
        if (model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionHeaderButton) {
            [cell.headerBtn setImage:[UIImage imageNamed:model.headerImageName] forState:UIControlStateNormal];
            if (model.tableViewAlertCellTypeOption&TableViewAlertCellTypeOptionHeaderButtonTinkColor) {
                cell.headerBtn.tintColor=model.color;
            }else{
                cell.headerBtn.backgroundColor=model.color;
            }
        }else{
            cell.headerIcon.image=[UIImage imageNamed:model.headerImageName];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ((_tableViewAlertTypeOption&TableViewAlertTypeOptionSingleChoose)||(_tableViewAlertTypeOption&TableViewAlertTypeOptionMultiChoose)) {
        if (!_selectedIndexPaths) {
            _selectedIndexPaths=[NSMutableArray new];
        }
        
        if (_tableViewAlertTypeOption&TableViewAlertTypeOptionSingleChoose) {
            if (![_selectedIndexPaths containsObject:indexPath]) {
                [_selectedIndexPaths removeAllObjects];
                [_selectedIndexPaths addObject:indexPath];
            }else{
                
            }
        }else if(_tableViewAlertTypeOption&TableViewAlertTypeOptionMultiChoose){
            if (![_selectedIndexPaths containsObject:indexPath]) {
                [_selectedIndexPaths addObject:indexPath];
            }else{
                [_selectedIndexPaths removeObject:indexPath];
            }
        }
        
    }
    [_contentView.tableView reloadData];
}

-(void)clickButton:(UIButton *)sener{
    TableViewAlertAction *action=[_tableViewAlertActions objectAtIndex:sener.tag];
    action.Hander(action);
    [self dismissAnimation:YES completion:^(BOOL finished) {
        
    }];
}
- (IBAction)dismissAction:(UIButton *)sender {
    if (_HideBlock) {
        _HideBlock(sender);
    }
    [self dismissAnimation:YES completion:^(BOOL finished) {
        
    }];
    
}

- (void)dismissAnimation:(BOOL)flag completion:(void (^)(BOOL finished))completion{
    if (flag) {
        [UIView animateWithDuration:.25 animations:^{
            self.containerView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.25 animations:^{
                self.containerView.alpha=0;
            } completion:^(BOOL finished) {
                [self willMoveToParentViewController:nil];
                [self.view removeFromSuperview];
                [self removeFromParentViewController];
                completion(finished);
            }];
        }];
    }else{
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        completion(YES);
    }
    
}

-(NSMutableArray *)selectedIndexPaths{
    if (!_selectedIndexPaths) {
        _selectedIndexPaths=[NSMutableArray new];
    }
    return _selectedIndexPaths;
}

-(void)presentInParentViewController:(UIViewController *)parentViewController animation:(BOOL) flag completion:(void (^ __nullable)(void))completion{
    [parentViewController.view addSubview:self.view];
    [parentViewController.view bringSubviewToFront:self.view];
    self.view.frame=parentViewController.view.bounds;
    [parentViewController addChildViewController:self];
    [self didMoveToParentViewController:parentViewController];
    if (flag) {
        self.containerView.transform=CGAffineTransformMakeScale(1.2,1.2);
        [UIView animateWithDuration:.25 animations:^{
            self.containerView.transform=CGAffineTransformMakeScale(1,1);
        } completion:^(BOOL finished) {
        }];
        
    }
}

-(void)resetupUI{
    [_buttons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TableViewAlertAction *action=[_tableViewAlertActions objectAtIndex:idx];
        [obj setTitle:action.title forState:UIControlStateNormal];
        [obj setImage:[UIImage imageNamed:action.iconName] forState:UIControlStateNormal];
        if (action.color) {
            [obj setTitleColor:action.color forState:UIControlStateNormal];
        }
        UIButton *icon=[_customIcons objectAtIndex:idx];
        [icon setImage:[UIImage imageNamed:action.customiconName] forState:UIControlStateNormal];
    }];
    [_contentView.tableView reloadData];
    _titleView.titleLab.text=self.title;
    [_containerView updateConstraintsIfNeeded];
    [_containerView layoutIfNeeded];
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

#import "AppRootViewController.h"

@implementation TableViewWindowAlertRootController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



#pragma mark - UIViewControllerRotation
-(BOOL)shouldAutorotate{// Support Autorotate InterfaceOrientations
    if ([[AppRootViewController sharedInstance] needChangeOrientationViewController]) {
        return YES;
    }
    return [[[UIApplication sharedApplication] keyWindow].rootViewController shouldAutorotate];
}





-(UIInterfaceOrientationMask)supportedInterfaceOrientations{//Support InterfaceOrientation
    return [[[UIApplication sharedApplication] keyWindow].rootViewController supportedInterfaceOrientations];
}


-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{//First InterfaceOrientation
    
    return [UIApplication sharedApplication].statusBarOrientation;
}

-(BOOL)prefersStatusBarHidden{
    return [[[UIApplication sharedApplication] keyWindow].rootViewController prefersStatusBarHidden];
}

@end

@implementation TableViewWindow
+(instancetype)sharedInstance{
    static TableViewWindow *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.hidden=NO;
        sharedInstance.backgroundColor=[UIColor clearColor];
        sharedInstance.bounds=[UIScreen mainScreen].bounds;
        sharedInstance.windowLevel=UIWindowLevelAlert;
        sharedInstance.rootViewController=[[TableViewWindowAlertRootController alloc] init];
        sharedInstance.tableViewWindowAlertControllers=[NSMutableArray new];
        
    });
    return sharedInstance;
}
@end

@interface TableViewWindowAlertController ()

@end



@implementation TableViewWindowAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)presentWithAnimation:(BOOL)flag completion:(void (^)(void))completion{
    [TableViewWindow sharedInstance].hidden=NO;
    if (self.isDismiss) {
        [self presentInParentViewController:[TableViewWindow sharedInstance].rootViewController animation:YES completion:completion];
    }else{
        if ([TableViewWindow sharedInstance].tableViewWindowAlertControllers.count>0) {
            TableViewWindowAlertController *dismissAlert=(TableViewWindowAlertController *)[[TableViewWindow sharedInstance].tableViewWindowAlertControllers lastObject] ;
            dismissAlert.dismiss=YES;
            [dismissAlert automaticDismiss];
        }
        [[TableViewWindow sharedInstance].tableViewWindowAlertControllers addObject:self];
        [self presentInParentViewController:[TableViewWindow sharedInstance].rootViewController animation:YES completion:completion];
        
    }
}

-(void)clickButton:(UIButton *)sener{
    TableViewAlertAction *action=[self.tableViewAlertActions objectAtIndex:sener.tag];
    action.Hander(action);
    if (self.tableViewAlertTypeOption&TableViewAlertTypeOptionClickStillAlert) {
        return;
    }
    [[TableViewWindow sharedInstance].tableViewWindowAlertControllers removeObject:self];
    [UIView animateWithDuration:.25 animations:^{
        self.containerView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.25 animations:^{
            self.containerView.alpha=0;
        } completion:^(BOOL finished) {
            [self willMoveToParentViewController:nil];
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            
            if ([TableViewWindow sharedInstance].tableViewWindowAlertControllers.count==0) {
                [TableViewWindow sharedInstance].hidden=YES;
            }else{
                TableViewWindowAlertController *realert=[[TableViewWindow sharedInstance].tableViewWindowAlertControllers lastObject];
                [realert presentWithAnimation:YES completion:^{
                    
                }];
            }
            
        }];
    }];
}

- (IBAction)dismissAction:(UIButton *)sender {
    [[TableViewWindow sharedInstance].tableViewWindowAlertControllers removeObject:self];
    [self dismissAnimation:YES completion:^(BOOL finished) {
        if (self.HideBlock) {
            self.HideBlock(sender);
        }
        if ([TableViewWindow sharedInstance].tableViewWindowAlertControllers.count==0) {
            [TableViewWindow sharedInstance].hidden=YES;
        }else{
            TableViewWindowAlertController *realert=[[TableViewWindow sharedInstance].tableViewWindowAlertControllers lastObject];
            [realert presentWithAnimation:YES completion:^{
                
            }];
        }
    }];
    
}

-(void)automaticDismiss{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}
@end
