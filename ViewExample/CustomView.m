//
//  CustomHeaderCell.cpp
//  CustomTable
//
//  Created by LT-LW-MAC on 16/5/18.
//  Copyright (c) 2016年 User. All rights reserved.
//

#include "CustomView.h"
#import "AutoLayoutUtils.h"
#import "UIColor+Hex.h"
@implementation CustomView

 
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        
        UIImageView *checkedImg = [[UIImageView alloc]init];
      [self addSubview:checkedImg];
        
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [checkedImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        NSLayoutConstraint *constraint = [AutoLayoutUtils setLeft:checkedImg superview:self left:3];
        
        [self addConstraint:constraint];
        
        constraint = [AutoLayoutUtils setCenterY:checkedImg superview:self y:0];
        [self addConstraint:constraint];
        
        constraint = [AutoLayoutUtils setTop:checkedImg superview:self top:10];
        [self addConstraint:constraint];
        
        constraint = [AutoLayoutUtils setBottom:checkedImg superview:self bottom:-10];
        [self addConstraint:constraint];

        NSLayoutConstraint *ww = [NSLayoutConstraint constraintWithItem:checkedImg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:checkedImg attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        
        [checkedImg addConstraint:ww];
        
        self.checkedImg = checkedImg;

        UILabel *station = [[UILabel alloc]init];
        
        [self addSubview:station];
        
        [station setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        station.numberOfLines = 0;
        
        self.station = station;
        
        UIImageView* firstImg = [[UIImageView alloc ]init];
        [self addSubview:firstImg];
        
        [firstImg setTranslatesAutoresizingMaskIntoConstraints:NO];

        self.firstImg = firstImg;
        
        UILabel *firstTime = [[UILabel alloc] init];
        [self addSubview:firstTime];
        [firstTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.firstTime = firstTime;
        
        UIImageView* lastImg = [[UIImageView alloc]init];
        [self addSubview:lastImg];
        
        [lastImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.lastImg = lastImg;

        UILabel*lastTime = [[UILabel alloc]init];
        [self addSubview:lastTime];
        [lastTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        self.lastTime = lastTime;
    
        NSDictionary *views = NSDictionaryOfVariableBindings( firstImg,firstTime,lastImg,lastTime,checkedImg,station);
        
        
        NSArray * cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[checkedImg]-10-[firstImg]-2-[firstTime]-30-[lastImg]-2-[lastTime]" options:0 metrics:nil views:views];
        
        [self addConstraints:cons];
        
       cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[checkedImg]-10-[station]" options:0 metrics:nil views:views];
        
        [self addConstraints:cons];
        
        
        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[station]-2-|" options:NSLayoutFormatAlignAllTop metrics:nil views:views];
        
        [self addConstraints:cons];

        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[station(45)]" options:NSLayoutFormatAlignAllTop metrics:nil views:views];
        
        [self addConstraints:cons];
        
        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[station][firstImg]-2-|" options:0 metrics:nil views:views];
        
        [self addConstraints:cons];
        
        
        ww = [NSLayoutConstraint constraintWithItem:firstImg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:firstImg attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        
        [firstImg addConstraint:ww];
        
        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[station][firstTime]-2-|" options:0 metrics:nil views:views];
        
        
        [self addConstraints:cons];
        
        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[station][lastImg]-2-|" options:0  metrics:nil views:views];
        
        
        ww = [NSLayoutConstraint constraintWithItem:lastImg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastImg attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
        
        
        [lastImg addConstraint:ww];
        
        [self addConstraints:cons];
        
        cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[station][lastTime]-2-|" options:0 metrics:nil views:views];
        
        [self addConstraints:cons];
    
    }
    
    return self;
}




-(BOOL)selected2
{
    if(self.selected)
    {
        [self setBackgroundColor:[UIColor colorWithRed:21/255.0f green:142/255.0f blue:210/255.0f alpha:1.0f]];
        
        self.checkedImg.hidden = NO;
        
    }
    else
    {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.checkedImg.hidden = YES;
        
    }
    return YES;
}

@end