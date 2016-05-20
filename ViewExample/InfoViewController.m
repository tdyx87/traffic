//
//  InfoViewController.m
//  ViewExample
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 User. All rights reserved.
//

#import "InfoViewController.h"
#import "StationController.h"
#import "CustomView.h"
#import "AutoLayoutUtils.h"

#import "CustomTableCell.h"
@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize sid=sid;
@synthesize lineinfo=lineinfo;
@synthesize lineresulttwo=lineresulttwo;

@synthesize linename=linename;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
    
    self.lineinfoview =  [[UITableView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    
    [self.lineinfoview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    self.lineinfoview.separatorInset = UIEdgeInsetsMake(0, 2,0, 2);
    
    
    [self.view addSubview:self.lineinfoview];
    
    /*
    if ([_lineinfoview respondsToSelector:@selector(setSeparatorInset:)]) {
        [_lineinfoview setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_lineinfoview respondsToSelector:@selector(setLayoutMargins:)]) {
        [_lineinfoview setLayoutMargins:UIEdgeInsetsZero];
    }
    
    */
    
    
    NSDictionary *views =NSDictionaryOfVariableBindings(_lineinfoview);
    
    
    NSArray * cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_lineinfoview]-10-|" options:0 metrics:nil views:views];
    
    [self.view  addConstraints:cons];
    
    cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[_lineinfoview]-20-|" options:0 metrics:nil views:views];
    
    [self.view  addConstraints:cons];
    
    self.navigationItem.title = @"详细信息";
    
    [StationController Instance].delegate = self;
    
    UIView *headView = [[UIView alloc]init];

    [headView setBackgroundColor:[UIColor redColor]];
    
    CustomView *v1 = [[CustomView alloc]init];
    
    [v1 setTranslatesAutoresizingMaskIntoConstraints:NO];;
    CustomView *v2 = [[CustomView alloc]init];
    [v2 setTranslatesAutoresizingMaskIntoConstraints:NO];;
    v1.checkedImg.image = [UIImage imageNamed:@"traffic_okicon"];
    v2.checkedImg.image = [UIImage imageNamed:@"traffic_okicon"];
    v1.station.text = [NSString stringWithFormat:@"%@->%@", lineinfo.start_stop ,lineinfo.end_stop];
    v2.station.text = [NSString stringWithFormat:@"%@->%@", lineinfo.end_stop ,lineinfo.start_stop];

    v1.firstImg.image = [UIImage imageNamed:@"traffic_sicon.png"];
    v1.lastImg.image = [UIImage imageNamed:@"traffic_micon.png"];
    
    v1.firstTime.text = lineinfo.start_earlytime;
    v1.lastTime.text = lineinfo.start_latetime;
    
    
    v2.firstImg.image = [UIImage imageNamed:@"traffic_sicon.png"];
    v2.lastImg.image = [UIImage imageNamed:@"traffic_micon.png"];
    
    v2.firstTime.text = lineinfo.end_earlytime;
    v2.lastTime.text = lineinfo.end_latetime;
    
   
    v1.tag = 1;
    v2.tag = 2;
   
    [headView addSubview:v1 ];
    [headView addSubview:v2 ];
    
    
    self.array = [ [NSArray alloc]initWithObjects:v1,v2, nil]; //[NSArray arrayWithObjects:v1, v2,nil];
    
    
    
    [self updateChecked:v1];
    
    
    headView.userInteractionEnabled = YES;
    v1.userInteractionEnabled = YES;
    v2.userInteractionEnabled = YES;
    [headView setTranslatesAutoresizingMaskIntoConstraints:YES];
 
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    UITapGestureRecognizer *labelTapGestureRecognizer2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    
    
    [v1 addGestureRecognizer:labelTapGestureRecognizer2];
    [v2 addGestureRecognizer:labelTapGestureRecognizer];
    
    [headView addConstraint:[NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [headView addConstraint:[NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [headView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[v1(39)]-2-[v2(==v1)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(v1,v2)]];
    
    headView.frame = CGRectMake(0, 0, self.lineinfoview.frame.size.width, 80) ;
    
    self.lineinfoview.tableHeaderView = headView;
    
    
    self.lineinfoview.delegate = self;
    
    self.lineinfoview.dataSource = self;
    
    result =lineresulttwo.lineresult0;
    
    
    
    
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.lineinfoview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20]];
    
    
    
}



-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
    
    CustomView * v = (CustomView*)recognizer.view;
    
    if(v.tag == 1)
    {
        result = lineresulttwo.lineresult0;
    }else if(v.tag == 2)
    {
        result = lineresulttwo.lineresult1;
    }
    
    [self.lineinfoview reloadData];

    [self updateChecked:v];
    
}


-(void)updateChecked:(id)v
{
    CustomView* cv = (CustomView*)v;
    if(cv.selected == NO)
    {
        [cv setSelected:YES];
        [cv selected2];
        for(CustomView * temp in self.array)
        {
            if(temp != cv)
            {
                [temp setSelected:NO];
                [temp selected2];
            }
        }
    }
    
    self.selectIndexPath = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"sdasdsad");
    
}


- (IBAction)backEvent:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)parseData:(id)data flag:(NSString *)flag
{
    
    NSError *error = nil;
    NSDictionary*  jsondata = (NSDictionary*)data;
    
    NSString * lable = nil;
    
    if ([jsondata isKindOfClass:[NSArray class]]) {
        
    }
    else if ([jsondata isKindOfClass:[NSDictionary class]]) {
        
        id attributes = [jsondata objectForKey:@"@attributes"];
        
        
        if(attributes == nil)
        {
            NSString * error = (NSString * )[jsondata objectForKey:@"error"];
            
            if([error isEqual:@"-2" ])
            {
                lable = @"等待发车";
                
                
            }
            
        }
        else
        {
            NSString * cod =  [attributes objectForKey:@"cod"];
            
            id terminal = [jsondata objectForKey:@"terminal"];
            
            
            id stopdis = [jsondata objectForKey:@"stopdis"];
            
            
            id distance = [jsondata objectForKey:@"distance"];
            
            id time = [jsondata objectForKey:@"time"];
            
            lable = [NSString stringWithFormat:@"车牌:%@ 距离%@站 等待时间:%@",terminal,stopdis,time];
        }
        
        
        CustomTableCell * cell = (CustomTableCell *)[self.lineinfoview cellForRowAtIndexPath:self.selectIndexPath];
        cell.waitStatus.text = lable;
        
        
       //lable = [lable stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
       // self.lineLable.text = lable;
       // [self.lineLable setFont:[UIFont boldSystemFontOfSize:12]];
       // self.lineLable.numberOfLines = 0; // 关键一句
    }
    
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Stops * tmp = [result.stops objectAtIndex:indexPath.row];
    
    
    NSString *cellId = @"cell";
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(!cell)
    {
        cell = [[CustomTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.layer.masksToBounds = YES;
    
    cell.stationName.text = tmp.zdmc;
    
    cell.waitImg.image = [UIImage imageNamed:@"traffic_shu.png"];
    
    cell.waitStatus.text = tmp.waitStatus;
    
    
    UILabel * stationName = cell.stationName;
    UILabel * waitStatus = cell.waitStatus;
    UIImageView * waitImg = cell.waitImg;
    
    
    NSDictionary * views =  NSDictionaryOfVariableBindings(stationName,waitStatus,waitImg);
    
    
    NSArray * cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[stationName(30)]-8-[waitImg(23)]" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:cons];
    
    cons = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[stationName(30)][waitStatus(40)]" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:cons];
    
    cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[stationName]" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:cons];
    
    cons = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[waitImg(25)]-2-[waitStatus]" options:0 metrics:nil views:views];
    
    [cell.contentView addConstraints:cons];
    
    
    
    //UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
  ///  cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //cell.textLabel.text= tmp.zdmc;
    //cell.detailTextLabel.text=tmp.stopsid;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return result.stops.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* stopid = [NSString stringWithFormat:@"%ld",indexPath.row+1 ];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([result.direction isEqual:@"true"])
        [[StationController Instance] getWaitTime:@"0" stopid:stopid sid:sid.sid];
    else
    {
        [[StationController Instance] getWaitTime:@"1" stopid:stopid sid:sid.sid];
    }
    
    self.selectIndexPath = indexPath;
    
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(self.selectIndexPath == nil)
    {
        return 30.0f;
    }
    else if(self.selectIndexPath != nil && self.selectIndexPath == indexPath)
    {
        return 70.0f;
    }
    return 30.0f;
}


- (void)dealloc {
    [_lineinfoview release];
    [super dealloc];
}
@end
