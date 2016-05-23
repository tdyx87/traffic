//
//  ModelController.h
//  Traffic
//
//  Created by liwei on 16/4/21.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetProtocol.h"
#import "Station.h"

@interface StationController : NSObject <NetProtocol>

-(BOOL)checkName:(NSString*)name;
-(void)getWXSid:(NSString*)linename;
-(void)getLineInfo:(NSString*)linename;
-(void)getWaitTime:(NSString*)stoptype stopid:(NSString*)stopid sid:(NSString*)sid;
-(void)getLineStation:(NSString*)name lineid:(NSString*)lineid;
-(void)getWaitTime:(NSString*)name lineid:(NSString*)lineid stopid:(NSString*)stopid direction:(NSString*)direction;
-(void)getWXStation:(NSString*)SID;

-(void)parseLineStation:(NSDictionary *)data;
-(void)parseWXSid:(NSDictionary *)data;
-(void)parseLineInfo:(NSDictionary *)data;
-(void)parseWaitTime2:(NSDictionary *)data;
-(void)parseWaitTime1:(NSDictionary*)data;
-(NSString*)TrimStr:(NSString*)str pre:(NSString*)pre sub:(NSString*)sub;


-(void)getBuss;


+(StationController*)Instance;

@property id<NetProtocol>  delegate;
@property SID* sid;
@property LineInfo *lineinfo;
@property LineResultTwo * lineresulttwo;
@property (copy) NSString *name;
@property NSString *line_id;

@end

