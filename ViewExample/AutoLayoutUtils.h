//
//  AutoLayoutUtils.h
//  CustomTable
//
//  Created by LT-LW-MAC on 16/5/18.
//  Copyright (c) 2016年 User. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AutoLayoutUtils : NSObject 


+(NSLayoutConstraint*)setWidth:(id)view width:(int)width;

+(NSLayoutConstraint*)setHeight:(id)view height:(int)height;

+(NSLayoutConstraint*)setLeft:(id)view superview:(id)superview left:(int)left;

+(NSLayoutConstraint*)setRight:(id)view superview:(id)superview right:(int)right;

+(NSLayoutConstraint*)setTop:(id)view superview:(id)superview  top:(int)top;

+(NSLayoutConstraint*)setBottom:(id)view superview:(id)superview  bottom:(int)bottom;

+(NSLayoutConstraint*)setCenterX:(id)view superview:(id)superview  x:(int)x;

+(NSLayoutConstraint*)setCenterY:(id)view superview:(id)superview  y:(int)y;



@end