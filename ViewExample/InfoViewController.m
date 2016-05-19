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
    
    self.navigationItem.title = @"详细信息";
    
    self.lineLable.text = (NSString*)(sid.sid);
    
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
    
    v1.firstTime.text = @"05:30";
    v1.lastTime.text = @"22:30";
    
    
    v2.firstImg.image = [UIImage imageNamed:@"traffic_sicon.png"];
    v2.lastImg.image = [UIImage imageNamed:@"traffic_micon.png"];
    
    v2.firstTime.text = @"05:30";
    v2.lastTime.text = @"22:30";
    
   
    v1.tag = 1;
    v2.tag = 2;
   
    [headView addSubview:v1 ];
    [headView addSubview:v2 ];
    
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
    
    
    
    
    
    v.selected = YES;
    [v selected2];
    
    
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
            
             lable = [NSString stringWithFormat:@"车名:%@  车牌:%@\n 距离%@站 等待时间:%@",cod,terminal,stopdis,time];
        }
        
        
       //lable = [lable stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        self.lineLable.text = lable;
        [self.lineLable setFont:[UIFont boldSystemFontOfSize:12]];
        self.lineLable.numberOfLines = 0; // 关键一句
    }
    
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"dfdsf222");
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"dfdsf");
    
    Stops * tmp = [result.stops objectAtIndex:indexPath.row];
    
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    cell.textLabel.text= tmp.zdmc;
    cell.detailTextLabel.text=tmp.stopsid;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"dfdsf111");
    
    return result.stops.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    
    NSString* stopid = [NSString stringWithFormat:@"%ld",indexPath.row+1 ];
    
    if([result.direction isEqual:@"true"])
        [[StationController Instance] getWaitTime:@"0" stopid:stopid sid:sid.sid];
    else
    {
        [[StationController Instance] getWaitTime:@"1" stopid:stopid sid:sid.sid];
    }
}

- (void)dealloc {
    [_lineinfoview release];
    [super dealloc];
}
@end
