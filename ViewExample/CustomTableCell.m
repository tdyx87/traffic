//
//  CustomTableCell.cpp
//  tableexam
//
//  Created by LT-LW-MAC on 16/5/20.
//  Copyright (c) 2016年 User. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        UILabel *stationName = [[UILabel alloc]init];
        [stationName setTranslatesAutoresizingMaskIntoConstraints:NO];
        _stationName = stationName;
        [self.contentView addSubview:stationName];
        
        
        UIImageView * separatorImg = [[UIImageView alloc]init];
        [separatorImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        _separatorImg = separatorImg;
        [self.contentView addSubview:separatorImg];
        
        UILabel *waitStatus = [[UILabel alloc]init];
        [waitStatus setTranslatesAutoresizingMaskIntoConstraints:NO];
        _waitStatus = waitStatus;
        
        waitStatus.font = [UIFont systemFontOfSize:12.0f];
        
        [self.contentView addSubview:waitStatus];
        
        
        UIImageView * waitImg = [[UIImageView alloc]init];
        [waitImg setTranslatesAutoresizingMaskIntoConstraints:NO];
        _waitImg = waitImg;
        [self.contentView addSubview:waitImg];
        
        
        //set constraint
        
        
        
        
        
        
    }
    
    return self;
}


@end