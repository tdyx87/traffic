//
//  NetAdapter.cpp
//  Traffic
//
//  Created by liwei on 16/4/21.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import "NetAdapter.h"


@implementation NetAdapter

@synthesize conn=conn;
@synthesize responseData=responseData;
@synthesize delegate=delegate;
@synthesize flag=flag;
-(id)initWithURL:(NSString *)urlstr delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag
{
    self = [super init];
    if (self) {
        
        NSURL *url = [[NSURL alloc]initWithString:urlstr];
        NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
        conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        delegate = thedelegate;
        flag=theflag;
        responseData = [[NSMutableData alloc] init];
    }
    return self;
}



-(id)initWithRequest:(NSURLRequest *)request delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag
{
    self = [super init];
    if (self) {
        
        conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        delegate = thedelegate;
        /*
        if([request.HTTPMethod isEqual: @"POST"])
        {
            NSString * value = [[NSString alloc]init];
            NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
            for (NSHTTPCookie *cookie in [cookieJar cookies]) {
                value = [value stringByAppendingFormat:@"%@=%@;",cookie.name,cookie.value ];
                }
            [request setValue:value forHTTPHeaderField:@"Cookie"];
        
            NSLog(@"%@",value);
            
        }*/
        flag=theflag;
        responseData = [[NSMutableData alloc] init];
        
    }
    return self;
}



-(id)initWithURLPost:(NSString *)urlstr delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag
{
    self = [super init];
    if (self) {
        
        NSURL *url = [[NSURL alloc]initWithString:urlstr];
        
        NSMutableURLRequest * request =  [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60];
        
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
        [request setValue:@"ansoecdxc=0; Hm_1vt_6f69830ae7173059e935b61372431b35=0; HH=0; HK=0; HG=0; HA=0; HB=0; HC=0; HD=0; HY=0; HO=0; Hm_p1vt_6f69830ae7173059e935b61372431b35=0; _gat=1; Hm_lvt_6f69830ae7173059e935b61372431b35=0; Hm_lpvt_6f69830ae7173059e935b61372431b35=0; _ga=0" forHTTPHeaderField:@"Cookie"];
        [request setValue:@"57" forHTTPHeaderField:@"Content-Length"];
        NSString *httpBody=@"idnum=630%E8%B7%AF";
        
        [request setHTTPBody:[httpBody dataUsingEncoding:NSUTF8StringEncoding]];
        conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];

        delegate = thedelegate;
        
        flag=theflag;
        responseData = [[NSMutableData alloc] init];
        
    }
    return self;
}




-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (connection != conn) {
        
        return;
    }
    
    NSLog(@"%@",error);
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if(conn != connection)
    {
        return;
    }
    [responseData appendData:data];
} 
-(void)parseDic:(NSDictionary *)data
{
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (connection != conn) {
        return;
    }
    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *http = (NSHTTPURLResponse*)response;
        const int status = [http statusCode];
        
        if (status < 200 || status >= 300) {
            
            [conn cancel];
            
            
            NSLog(@"%d",status);
            return;
        }
    }
    [responseData setLength:0];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (connection != conn) {
        
        return;
    }
    
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
       //NSLog(@"cookie%@", cookie);
    }
    
    [delegate parseData:responseData flag:flag];
    
    //[delegate parseJson:responseData flag:flag];
}



@end