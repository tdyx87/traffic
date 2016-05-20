//
//  InfoViewController.h
//  ViewExample
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"
#import "NetProtocol.h"
@interface InfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NetProtocol>

{
    
    LineResult * result;
    
}
@property  UITableView *lineinfoview;

@property NSString* linename;

@property NSArray * array;

@property SID* sid;
@property LineInfo *lineinfo;
@property LineResultTwo * lineresulttwo;

@property NSIndexPath * selectIndexPath;

- (IBAction)backEvent:(id)sender;

-(void)updateChecked:(id)v;

@end
