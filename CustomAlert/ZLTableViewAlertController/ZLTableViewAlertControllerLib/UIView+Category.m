//
//  UIView+TBUIAutoTest.m
//  Sens8
//
//  Created by Zhangling on 16/9/9.
//  Copyright © 2015年 Zhangling. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

@implementation UIView (Category)


- (UIBezierPath *)pathOfCheckMark{
    UIBezierPath* checkMarkPath = [UIBezierPath bezierPath];
    [checkMarkPath moveToPoint: CGPointMake(self.frame.size.width/3.1578, self.frame.size.width/2)];
    [checkMarkPath addLineToPoint: CGPointMake(self.frame.size.width/2.0618, self.frame.size.width/1.57894)];
    [checkMarkPath moveToPoint: CGPointMake(self.frame.size.width/2.0618, self.frame.size.width/1.57894)];
    [checkMarkPath addLineToPoint: CGPointMake(self.frame.size.width/1.3953, self.frame.size.width/2.7272)];
    return checkMarkPath;
}

-(UIBezierPath *)pathOfErrorMark{
    UIBezierPath* errorMarkPath = [UIBezierPath bezierPath];
    [errorMarkPath moveToPoint: CGPointMake(self.frame.size.width/3, self.frame.size.width/3)];
    [errorMarkPath addLineToPoint: CGPointMake(self.frame.size.width*2/3, self.frame.size.width*2/3)];
    [errorMarkPath moveToPoint: CGPointMake(self.frame.size.width*2/3, self.frame.size.width/3)];
    [errorMarkPath addLineToPoint: CGPointMake(self.frame.size.width/3, self.frame.size.width*2/3)];
    return errorMarkPath;
}

-(UIBezierPath *)pathOfExclamationMark{
    UIBezierPath* exclamationMarkPath = [UIBezierPath bezierPath];
    [exclamationMarkPath moveToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width*2/10)];
    [exclamationMarkPath addLineToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width*6/10)];
    [exclamationMarkPath moveToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width*7/10)];
    [exclamationMarkPath addLineToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width*7.5/10)];
    return exclamationMarkPath;
}

-(UIBezierPath *)pathOfTimeMark{
    UIBezierPath* exclamationMarkPath = [UIBezierPath bezierPath];
    [exclamationMarkPath moveToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width/4)];
    [exclamationMarkPath addLineToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width/2)];
    [exclamationMarkPath moveToPoint: CGPointMake(self.frame.size.width/2, self.frame.size.width/2)];
    [exclamationMarkPath addLineToPoint: CGPointMake(self.frame.size.width*3/4, self.frame.size.width/2)];
    return exclamationMarkPath;
}
-(UIBezierPath *)pathOfRoundMarklinewidth:(CGFloat)linewidth{
    UIBezierPath* path =[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.width/2) radius:self.frame.size.width/2-2*linewidth startAngle:.0f endAngle:M_PI*6/4 clockwise:YES];
    return path;
}



-(NSArray *)addConsTLBRInSuperView:(UIView *)superView constant:(CGFloat)constant;{
    NSMutableArray *mArr=[NSMutableArray new];
    NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1 constant:constant];
    NSLayoutConstraint *b=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:-constant];
    NSLayoutConstraint *l=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeading multiplier:1 constant:constant];
    NSLayoutConstraint *r=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-constant];
    [mArr addObject:t];
    [mArr addObject:l];
    [mArr addObject:b];
    [mArr addObject:r];
    [superView addConstraint:t];
    [superView addConstraint:l];
    [superView addConstraint:b];
    [superView addConstraint:r];
    return [mArr copy];
}

-(NSArray *)addConsTLBRInSuperView:(UIView *)superView otherView:(UIView *)otherView constant:(CGFloat)constant{
    NSMutableArray *mArr=[NSMutableArray new];
    NSLayoutConstraint *t=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeTop multiplier:1 constant:constant];
    NSLayoutConstraint *b=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeBottom multiplier:1 constant:-constant];
    NSLayoutConstraint *l=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeLeading multiplier:1 constant:constant];
    NSLayoutConstraint *r=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-constant];
    [mArr addObject:t];
    [mArr addObject:l];
    [mArr addObject:b];
    [mArr addObject:r];
    [superView addConstraint:t];
    [superView addConstraint:l];
    [superView addConstraint:b];
    [superView addConstraint:r];
    return [mArr copy];
}


-(UIImage *)imageOfView{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}







@end
