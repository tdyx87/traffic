//
//  InfoViewController.m
//  ViewExample
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 User. All rights reserved.
//

#import "InfoViewController.h"
#import "StationController.h"
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
    
    //lineinfoview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 500) style:UITableViewStylePlain];
    
    self.lineinfoview.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    
    lable1.text = [NSString stringWithFormat:@"%@->%@", lineinfo.start_stop ,lineinfo.end_stop];
    
    UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 40)];
    
    lable2.text = [NSString stringWithFormat:@"%@->%@", lineinfo.end_stop ,lineinfo.start_stop];;
    
    lable1.tag = 1;
    lable2.tag = 2;
    
    [self.lineinfoview.tableHeaderView addSubview:lable1 ];
     [self.lineinfoview.tableHeaderView addSubview:lable2 ];
    
    
    
    lable1.userInteractionEnabled=YES;
    lable2.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    UITapGestureRecognizer *labelTapGestureRecognizer2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [lable2 addGestureRecognizer:labelTapGestureRecognizer2];
    [lable1 addGestureRecognizer:labelTapGestureRecognizer];
    
    
    self.lineinfoview.delegate = self;
    
    self.lineinfoview.dataSource = self;
    
    result =lineresulttwo.lineresult0;
    
    
    
    //[self.view addSubview:lineinfoview];
}



-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
    UILabel *label=(UILabel*)recognizer.view;
    
    if(label.tag == 1)
    {
        result = lineresulttwo.lineresult0;
        
    }else if(label.tag == 2)
    {
        result = lineresulttwo.lineresult1;
    }
    
    [self.lineinfoview reloadData];
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
