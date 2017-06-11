//
//  ModelController.m
//  Traffic
//
//  Created by liwei on 16/4/21.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import "StationController.h"
#import "NetAdapter.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

static StationController * class;

@implementation StationController
@synthesize sid=sid;
@synthesize name=name;
@synthesize line_id=line_id;
@synthesize lineinfo=lineinfo;
@synthesize lineresulttwo=lineresulttwo;
@synthesize delegate=delegate;

-(void)getWXSid:(NSString *)linename
{

    self.name=linename;
    
    NSString *urlstr   = [[NSString alloc]initWithFormat:@"http://shanghaicity.openservice.kankanews.com/public/bus/get"];
    
    NSURL *url = [[NSURL alloc]initWithString:urlstr];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [request setValue:@"http://shanghaicity.openservice.kankanews.com" forHTTPHeaderField:@"Origin"];
    [request setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    [request setValue:@"Mozilla/5.0 (Linux; Android 4.4.2; GT-N7100 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [request setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"zh-CN,en-US,q=0.8" forHTTPHeaderField:@"Accept-Language"];
    [request setValue:@"http://shanghaicity.openservice.kankanews.com/public/bus" forHTTPHeaderField:@"Referer"];
    [request setValue:@"shanghaicity.openservice.kankanews.com" forHTTPHeaderField:@"Host"];
    [request setHTTPShouldHandleCookies:YES];
    [request setValue:@"Hm_lpvt_6f69830ae7173059e935b61372431b35=1470656692; Hm_lvt_6f69830ae7173059e935b61372431b35=1468142024,1468411913,1469879136,1470654748; HA=1e1b3ce796155016e8de615ae21e1d555336855b; HB=MWUxYjNjZTc5NjE1NTAxNmU4ZGU2MTVhZTIxZTFkNTU1MzM2ODU1Yg==; HC=bf92e57296fe6d355b8bed0fa854e746f6b2f6f6; HD=MjAxNjA4MDg=; HG=9e6d85ec2b39b530d5bc75b8642ddec3974c6b0b; HH=5a8325e60e86222368e791b36e7442356fd92d55; HK=275558e38954bc8267e75fb7678f2f525ef5bb7c; Hm_1vt_6f69830ae7173059e935b61372431b35=eSgsNFeoaRtRBSr0Dt+sAg==; Hm_p1vt_6f69830ae7173059e935b61372431b35=eSgsNFeoaSBRBSr0Dt+8Ag==; HO=TWpBeE5qQTRNRGc9MTlNVEUyTWpJMzEyVFc5NmFXeHNZUzgxTGpBZ0tHbFFhRzl1WlRzZ1ExQlZJR2xRYUc5dVpTQlBVeUE0WHpNZ2JHbHJaU0JOWVdNZ1QxTWdXQ2tnUVhCd2JHVlhaV0pMYVhRdk5qQXdMakV1TkNBb1MwaFVUVXdzSUd4cGEyVWdSMlZqYTI4cElFMXZZbWxzWlM4eE1rWTNNQ0JOYVdOeWIwMWxjM05sYm1kbGNpODJMak11TVRZZ1RtVjBWSGx3WlM5WFNVWkpJRXhoYm1kMVlXZGxMM3BvWDBOT2FhYmFjNmM2MGNhMjNiZDc5NjRiOGVjYjBkMjEwNjg2NDM1NTI2ZWY=; HY=MjAxNjA4MDg=275558e38954bc8267e75fb7678f2f525ef5bb7c9e6d85ec2b39b530d5bc75b8642ddec3974c6b0baabac6c60ca23bd7964b8ecb0d210686435526ef; PHPSESSID=m7n12493v263tvn9thuthl2qv1; _ga=GA1.2.923484555.1457530696; _gat=1; _gscu_1404343399=63551747ghkh0814; Hm_lvt_ba907373475281ec79b64ad73e7c9a36=1463551748" forHTTPHeaderField:@"Cookie"];
    [request setValue:@"57" forHTTPHeaderField:@"Content-Length"];
    
    NSString * encodingString = [linename stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *httpBody= [[NSString alloc]initWithFormat:@"idnum=%@",encodingString ];
    
    [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"SID"];

 
}

-(void)getWXStation:(NSString *)SID
{
    NSString *url1   = [[NSString alloc]initWithFormat:@"http://shanghaicity.openservice.kankanews.com/public/bus/mes/sid/%@",sid.sid ];
    NSString * encodingString = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:encodingString];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [request setValue:@"ansoecdxc=0; Hm_1vt_6f69830ae7173059e935b61372431b35=0; HH=0; HK=0; HG=0; HA=0; HB=0; HC=0; HD=0; HY=0; HO=0; Hm_p1vt_6f69830ae7173059e935b61372431b35=0; _gat=1; Hm_lvt_6f69830ae7173059e935b61372431b35=0; Hm_lpvt_6f69830ae7173059e935b61372431b35=0; _ga=0" forHTTPHeaderField:@"Cookie"];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"LineInfo"];
}

-(void)getLineInfo:(NSString *)linename
{
    
    NSString *url1   = [[NSString alloc]initWithFormat:@"http://xxbs.sh.gov.cn:8080/weixinpage/HandlerOne.ashx?name=%@",linename ];
    NSString * encodingString = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:encodingString];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"LineInfo"];
   
}

-(void)getLineStation:(NSString *)lname lineid:(NSString *)lineid
{
    NSString *url1  = [[NSString alloc]initWithFormat:@"http://xxbs.sh.gov.cn:8080/weixinpage/HandlerTwo.ashx?name=%@&lineid=%@" ,lname,lineid ];

    NSString * encodingString = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:encodingString];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"LineStation"];
}

-(void)failed
{
    if(delegate && [delegate respondsToSelector:@selector(failed)] == YES)
    {
        [delegate failed];
    }
}

-(void)getWaitTime:(NSString *)lname lineid:(NSString *)lineid stopid:(NSString *)stopid direction:(NSString *)direction
{
    
    NSString *url1  = [[NSString alloc]initWithFormat:@"http://xxbs.sh.gov.cn:8080/weixinpage/HandlerThree.ashx?name=%@&lineid=%@&stopid=%@&direction=%@" ,lname,lineid,stopid,direction ];
    
    NSString * encodingString = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:encodingString];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"WaitTime1"];
    
}

-(void)getBuss
{
    NSString *url1   = [[NSString alloc]initWithFormat:@"http://shanghaicity.openservice.kankanews.com/public/bus"];
    NSString * encodingString = [url1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [[NSURL alloc]initWithString:encodingString];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    //[request setValue:@"ansoecdxc=0; Hm_1vt_6f69830ae7173059e935b61372431b35=0; HH=0; HK=0; HG=0; HA=0; HB=0; HC=0; HD=0; HY=0; HO=0; Hm_p1vt_6f69830ae7173059e935b61372431b35=0; _gat=1; Hm_lvt_6f69830ae7173059e935b61372431b35=0; Hm_lpvt_6f69830ae7173059e935b61372431b35=0; _ga=0" forHTTPHeaderField:@"Cookie"];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"getBuss"];
}

-(void)getWaitTime:(NSString *)stoptype stopid:(NSString *)stopid sid:(NSString *)lsid
{
    
    NSString *urlstr   = [[NSString alloc]initWithFormat:@"http://shanghaicity.openservice.kankanews.com/public/bus/getStop"];
    
    NSURL *url = [[NSURL alloc]initWithString:urlstr];
    
    NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [request setValue:@"http://shanghaicity.openservice.kankanews.com" forHTTPHeaderField:@"Origin"];
    [request setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    [request setValue:@"Mozilla/5.0 (Linux; Android 4.4.2; GT-N7100 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Safari/537.36 MicroMessenger/6.3.16.49_r03ae324.780 NetType/WIFI Language/zh_CN" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [request setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"zh-CN,en-US,q=0.8" forHTTPHeaderField:@"Accept-Language"];
    
    
    NSString *referer  = [[NSString alloc]initWithFormat:@"http://shanghaicity.openservice.kankanews.com/public/bus/mes/sid/%@",lsid];
    
    
    [request setValue:referer  forHTTPHeaderField:@"Referer"];
    [request setValue:@"shanghaicity.openservice.kankanews.com" forHTTPHeaderField:@"Host"];
    [request setHTTPShouldHandleCookies:YES];
    [request setValue:@"ansoecdxc=0; Hm_1vt_6f69830ae7173059e935b61372431b35=0; HH=0; HK=0; HG=0; HA=0; HB=0; HC=0; HD=0; HY=0; HO=0; Hm_p1vt_6f69830ae7173059e935b61372431b35=0; _gat=1; Hm_lvt_6f69830ae7173059e935b61372431b35=0; Hm_lpvt_6f69830ae7173059e935b61372431b35=0; _ga=0" forHTTPHeaderField:@"Cookie"];
    [request setValue:@"57" forHTTPHeaderField:@"Content-Length"];
    
    NSString *httpBody  = [[NSString alloc]initWithFormat:@"stoptype=%@&stopid=%@.&sid=%@",stoptype,stopid,lsid];
 
    [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
    
    [[NetAdapter alloc]initWithRequest:request delegate:self flag:@"WaitTime2"];
}

-(BOOL)checkName:(NSString *)lname
{
    
    self.name=lname;
    
    NSString *re =  @"[0-9\u4e00-\u9fa5][0-9\u4e00-\u9fa5]+[\u4e00-\u9fa5]$"; //@"[/^\\d+(\\.\\d+)?$/]";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", re];
    
    BOOL ss = [emailTest evaluateWithObject:self.name];
    
    return ss;
    
}

-(void)parseLineInfo:(NSDictionary *)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        
        
        
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
    
        NSDictionary * temp =(NSDictionary*)data;
        
        LineInfo * tmp = [[LineInfo alloc]init];
        
        
        tmp.end_earlytime = [temp objectForKey:@"end_earlytime"];
        tmp.end_earlytime = [self TrimStr:tmp.end_earlytime pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.end_latetime = [temp objectForKey:@"end_latetime"];
        tmp.end_latetime = [self TrimStr:tmp.end_latetime pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.end_stop = [temp objectForKey:@"end_stop"];
        tmp.end_stop = [self TrimStr:tmp.end_stop pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.line_id = [temp objectForKey:@"line_id"];
        tmp.line_id = [self TrimStr:tmp.line_id pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.line_name = [temp objectForKey:@"line_name"];
        tmp.line_name = [self TrimStr:tmp.line_name pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.start_earlytime = [temp objectForKey:@"start_earlytime"];
        tmp.start_earlytime = [self TrimStr:tmp.start_earlytime pre:@"\n\t\t" sub:@"\n\t"];
        
        tmp.start_latetime = [temp objectForKey:@"start_latetime"];
        tmp.start_latetime = [self TrimStr:tmp.start_latetime pre:@"\n\t\t" sub:@"\n\t"];
        
        
        tmp.start_stop = [temp objectForKey:@"start_stop"];
        tmp.start_stop = [self TrimStr:tmp.start_stop pre:@"\n\t\t" sub:@"\n\t"];
        
        
        lineinfo = tmp;
        
        [self getLineStation:[self.name copy] lineid: lineinfo.line_id];
    
    }
}

-(NSString *)TrimStr:(NSString *)str pre:(NSString *)pre sub:(NSString *)sub
{
    if([str hasPrefix:pre])
    {
        str = [str substringFromIndex: [pre length]];
    }
    
    if([str hasSuffix:sub])
    {
        str = [str substringToIndex: [str length]-[sub length]];
    }
    
    return str;
}


-(void)parseLineStation:(NSDictionary *)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        
        
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary * temp =(NSDictionary*)data;
        LineResultTwo * two = [[LineResultTwo alloc]init];
        LineResult *lineresult0 = [[LineResult alloc]init];
        
        NSDictionary * result0 = [temp objectForKey:@"lineResults0"];
        NSString *direction = [result0 objectForKey:@"direction"];
        id stops =  [result0 objectForKey:@"stops"];
        lineresult0.direction = direction;
        lineresult0.stops = [NSMutableArray array];;
        if ([stops isKindOfClass:[NSArray class]]) {
            
            for(id info in stops)
            {
                
                if ([info isKindOfClass:[NSArray class]]) {
                    
                }
                else if([info isKindOfClass:[NSDictionary class]]) {
                    Stops * tmp = [[Stops alloc]init];
                    tmp.zdmc=[info objectForKey:@"zdmc"];
                    tmp.stopsid = [info objectForKey:@"id"];
                    [lineresult0.stops addObject:tmp];
                    
                }
                
                
            }
        }
        else if ([stops isKindOfClass:[NSDictionary class]]) {
            
        }
        
        LineResult *lineresult1 = [[LineResult alloc]init];
        NSDictionary * result1 = [temp objectForKey:@"lineResults1"];
        
        direction = [result1 objectForKey:@"direction"];
        stops =  [result1 objectForKey:@"stops"];
        lineresult1.direction = direction;
        lineresult1.stops = [NSMutableArray array];
        if ([stops isKindOfClass:[NSArray class]]) {
            
            for(id  info in stops)
            {
                
                if ([info isKindOfClass:[NSArray class]]) {
                    
                }
                else if([info isKindOfClass:[NSDictionary class]]) {
                    Stops * tmp = [[Stops alloc]init];
                    tmp.zdmc=[info objectForKey:@"zdmc"];
                    tmp.stopsid = [info objectForKey:@"id"];
                    [lineresult1.stops addObject:tmp];
                    
                }
                
            }
        }
        else if ([stops isKindOfClass:[NSDictionary class]]) {
            
        }
        two.lineresult0 = lineresult0;
        two.lineresult1= lineresult1;
        
        
        SID * dd = [sid copy];
        LineInfo *li = [lineinfo copy];
        
        if(delegate && [delegate respondsToSelector:@selector(returnPackData:lineinfo:results:)])
            [delegate returnPackData:dd lineinfo:li results:two];
        
    }
}

-(void)parseWXSid:(NSDictionary *)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
        
       
            NSDictionary * temp =(NSDictionary*)data;
            
            SID * tmp = [[SID alloc]init];
            
            tmp.mes = [temp objectForKey:@"mes"];
            tmp.sid = [temp objectForKey:@"sid"];
            
            sid = tmp;
    }
    if(delegate && [delegate respondsToSelector: @selector(parseWXSID)]==YES)
        [delegate parseWXSID];
}

-(void)parseWaitTime1:(NSDictionary *)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        
        
        
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
        
        
        
    }
}

-(void)parseWaitTime2:(NSDictionary *)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        
        NSDictionary * item = (NSDictionary *)[(NSArray*)data objectAtIndex:0];
        
        if(delegate && [delegate respondsToSelector:@selector(parseData:flag:)])
            [delegate parseData:item flag:@"WaitTime2"];
        
        
        
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
        
        if(delegate && [delegate respondsToSelector:@selector(parseData:flag:)])
            [delegate parseData:data flag:@"WaitTime2"];
        
    }
}

-(void)parseData:(id)data flag:(NSString *)flag
{
    
   
    
    NSError *error = nil;
    NSDictionary*  jsondata = [NSJSONSerialization JSONObjectWithData:(NSData*)data options:NSJSONReadingMutableLeaves error:&error];
    NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",jsondata);
   if([flag isEqual:@"SID"])
   {
       [self parseWXSid:jsondata];
   }else if([flag isEqual:@"LineInfo"])
   {
       [self parseLineInfo:jsondata];
   }else if([flag isEqual:@"LineStation"])
   {
        [self parseLineStation:jsondata];
       
   }else if([flag isEqual:@"WaitTime1"])
   {
       [self parseWaitTime1:jsondata];
       
   }else if([flag isEqual:@"WaitTime2"])
   {
       [self parseWaitTime2:jsondata];
   }
    return;
}



+(StationController*)Instance{
    
    @synchronized(self){  //为了确保多线程情况下，仍然确保实体的唯一性
        
        if (!class) {
            
            [[self alloc] init]; //该方法会调用 allocWithZone
            
        }
        
    }
    
    return class;
    
}

+(id)allocWithZone:(NSZone *)zone{
    
    @synchronized(self){
        
        if (!class) {
            
            class = [super allocWithZone:zone]; //确保使用同一块内存地址
            
            return class;
            
        }
        
    }
    
    return nil;
    
}

- (id)copyWithZone:(NSZone *)zone;{
    
    return self; //确保copy对象也是唯一
    
}


@end
