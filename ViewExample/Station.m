//
//  Station.m
//  Traffic
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@implementation SID

@synthesize mes=mes;
@synthesize sid=sid;

- (id)copyWithZone:(NSZone *)zone{
    
    
    
    
    SID *tmpsid = [[[self class] allocWithZone:zone]  init];
    
    tmpsid->mes = [mes copyWithZone:zone];
    
    tmpsid ->sid  = [sid copyWithZone:zone];
    
    return tmpsid;
    
}



@end

@implementation LineInfo


@synthesize end_earlytime= end_earlytime;
@synthesize end_latetime =end_latetime;
@synthesize end_stop= end_stop;
@synthesize line_id= line_id;
@synthesize line_name= line_name;
@synthesize start_earlytime= start_earlytime;
@synthesize start_latetime= start_latetime;
@synthesize start_stop= start_stop;

- (id)copyWithZone:(NSZone *)zone{
    
    
    
    
    LineInfo *tmpsid = [[[self class] allocWithZone:zone]  init];
    
    tmpsid->end_earlytime = [end_earlytime copyWithZone:zone];
    
    tmpsid ->end_latetime  = [end_latetime copyWithZone:zone];
    
    tmpsid ->end_stop  = [end_stop copyWithZone:zone];
    
    tmpsid ->line_id  = [line_id copyWithZone:zone];
    tmpsid ->line_name  = [line_name copyWithZone:zone];
    
    tmpsid ->start_earlytime  = [start_earlytime copyWithZone:zone];
    
    tmpsid ->start_latetime  = [start_latetime copyWithZone:zone];
    
    tmpsid ->start_stop  = [start_stop copyWithZone:zone];
    
    return tmpsid;
    
}


@end


@implementation Stops

@synthesize   zdmc=zdmc;
@synthesize   stopsid=stopsid;

- (id)copyWithZone:(NSZone *)zone{
    
    
    
    
    Stops *tmpsid = [[Stops allocWithZone:zone]  init];
    
    tmpsid->zdmc = [zdmc copyWithZone:zone];
    
    tmpsid ->stopsid  = [stopsid copyWithZone:zone];
    
    return tmpsid;
    
}


@end


@implementation LineResult

@synthesize direction=direction;
@synthesize stops=stops;

- (id)copyWithZone:(NSZone *)zone{
    
    LineResult *tmpsid = [[LineResult allocWithZone:zone]  init];
    
    tmpsid->direction = [direction copyWithZone:zone];
    
    tmpsid ->stops  = [stops mutableCopy];
    
    return tmpsid;
    
}


@end


@implementation LineResultTwo

@synthesize lineresult0 = lineresult0;
@synthesize lineresult1 =lineresult1;


- (id)copyWithZone:(NSZone *)zone{
    
    
    
    
    LineResultTwo *tmpsid = [[LineResultTwo allocWithZone:zone]  init];
    
    tmpsid->lineresult0 = [lineresult0 copyWithZone:zone];
    
    tmpsid ->lineresult0  = [lineresult0 copyWithZone:zone];
    
    return tmpsid;
    
}


@end