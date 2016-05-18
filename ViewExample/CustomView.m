//
//  CustomHeaderCell.cpp
//  CustomTable
//
//  Created by LT-LW-MAC on 16/5/18.
//  Copyright (c) 2016年 User. All rights reserved.
//

#include "CustomView.h"
#import "AutoLayoutUtils.h"
@implementation CustomView




-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIImageView *checkedImg = [[UIImageView alloc]init];
        [self addSubview:checkedImg];
        
        
        [checkedImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        NSLayoutConstraint *constraint = [AutoLayoutUtils setLeft:checkedImg superview:self left:3];
        
        [self addConstraint:constraint];
        
        constraint = [AutoLayoutUtils setCenterY:checkedImg superview:self y:0];
        [self addConstraint:constraint];
        constraint =[AutoLayoutUtils setWidth:checkedImg width:43];
        [checkedImg addConstraint:constraint];
        constraint =[AutoLayoutUtils setHeight:checkedImg height:43];
        
        [checkedImg addConstraint:constraint];
        
        self.checkedImg = checkedImg;
        
        
        UILabel *station = [[UILabel alloc]init];
        
        [self addSubview:station];
        
        [station setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSLayoutConstraint * left = [AutoLayoutUtils setLeft:station superview:self left:50];
        
        [self addConstraint:left];
        
        
        constraint = [AutoLayoutUtils setCenterY:station superview:self y:-10];
        
        [self addConstraint:constraint];
        
        self.station = station;
        
        UIImageView* firstImg = [[UIImageView alloc ]init];
        [self addSubview:firstImg];
        
        [firstImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        left = [AutoLayoutUtils setLeft:firstImg superview:self left:50];
        
        [self addConstraint:left];
        
        constraint = [AutoLayoutUtils setCenterY:firstImg superview:self y:15];
        
        [self addConstraint:constraint];
        
        self.firstImg = firstImg;
        
        UILabel *firstTime = [[UILabel alloc] init];
        [self addSubview:firstTime];
        [firstTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        left = [AutoLayoutUtils setLeft:firstTime superview:self left:83];
        
        [self addConstraint:left];
        
        constraint = [AutoLayoutUtils setCenterY:firstTime superview:self y:15];
        
        [self addConstraint:constraint];
        
        self.firstTime = firstTime;
        
        UIImageView* lastImg = [[UIImageView alloc]init];
        [self addSubview:lastImg];
        
        [lastImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        left = [AutoLayoutUtils setLeft:lastImg superview:self left:150];
        
        [self addConstraint:left];
        
        constraint = [AutoLayoutUtils setCenterY:lastImg superview:self y:15];
        
        [self addConstraint:constraint];
        
        self.lastImg = lastImg;
        
        
        UILabel*lastTime = [[UILabel alloc]init];
        [self addSubview:lastTime];
        [lastTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        left = [AutoLayoutUtils setLeft:lastTime superview:self left:183];
        
        [self addConstraint:left];
        
        constraint = [AutoLayoutUtils setCenterY:lastTime superview:self y:15];
        
        [self addConstraint:constraint];
        
        
        self.lastTime = lastTime;
    }
    
    return self;
}


@end