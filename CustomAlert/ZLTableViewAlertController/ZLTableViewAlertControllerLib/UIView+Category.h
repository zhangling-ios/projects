//
//  UIView+TBUIAutoTest.h
//  Sens8
//
//  Created by Zhangling on 16/9/9.
//  Copyright © 2015年 Zhangling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
-(UIBezierPath *)pathOfCheckMark;
-(UIBezierPath *)pathOfErrorMark;
-(UIBezierPath *)pathOfExclamationMark;
-(UIBezierPath *)pathOfTimeMark;
-(UIBezierPath *)pathOfRoundMarklinewidth:(CGFloat)linewidth;
-(UIImage *)imageOfView;
-(NSArray *)addConsTLBRInSuperView:(UIView *)superView constant:(CGFloat)constant;
-(NSArray *)addConsTLBRInSuperView:(UIView *)superView otherView:(UIView *)otherView constant:(CGFloat)constant;

@end
