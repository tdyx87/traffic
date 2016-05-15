//
//  NetAdapter.h
//  Traffic
//
//  Created by liwei on 16/4/21.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#ifndef __Traffic__NetAdapter__
#define __Traffic__NetAdapter__

#import <UIKit/UIKit.h>
#import "NetProtocol.h"


@interface NetAdapter : NSObject 

@property  NSURLConnection * conn;

@property   NSMutableData * responseData;

@property NSString* flag;

@property id<NetProtocol>  delegate;

-(id)initWithURL:(NSString*)urlstr delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag;
-(id)initWithURLPost:(NSString*)urlstr delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag;

-(id)initWithRequest:(NSURLRequest*)request delegate:(id<NetProtocol>)thedelegate flag:(NSString*)theflag;


@end






#endif /* defined(__Traffic__NetAdapter__) */
