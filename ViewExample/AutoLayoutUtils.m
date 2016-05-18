//
//  AutoLayoutUtils.cpp
//  CustomTable
//
//  Created by LT-LW-MAC on 16/5/18.
//  Copyright (c) 2016年 User. All rights reserved.
//

#include "AutoLayoutUtils.h"

@implementation AutoLayoutUtils



+(NSLayoutConstraint*)setWidth:(id)view width:(int)width
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    
    return constraint;

}

+(NSLayoutConstraint*)setHeight:(id)view height:(int)height
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    
    return constraint;
}

+(NSLayoutConstraint*)setLeft:(id)view superview:(id)superview left:(int)left
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:left];
    
    return constraint;
}

+(NSLayoutConstraint*)setRight:(id)view superview:(id)superview right:(int)right
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:right];
    
    return constraint;
}

+(NSLayoutConstraint*)setTop:(id)view superview:(id)superview  top:(int)top
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:top];
    
    return constraint;
}

+(NSLayoutConstraint*)setBottom:(id)view superview:(id)superview  bottom:(int)bottom
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:bottom];
    
    return constraint;
}

+(NSLayoutConstraint*)setCenterX:(id)view superview:(id)superview  x:(int)x
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:x];
    return constraint;
}

+(NSLayoutConstraint*)setCenterY:(id)view superview:(id)superview  y:(int)y
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:y];
    return constraint;
}


@end