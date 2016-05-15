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
@property (retain, nonatomic) IBOutlet UITableView *lineinfoview;

@property NSString* linename;
@property (nonatomic) IBOutlet UILabel *lineLable;


@property SID* sid;
@property LineInfo *lineinfo;
@property LineResultTwo * lineresulttwo;

- (IBAction)backEvent:(id)sender;


@end
