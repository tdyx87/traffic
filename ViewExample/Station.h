//
//  Station.m
//  Traffic
//
//  Created by LT-LW-MAC on 16/4/25.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SID : NSObject<NSCopying>

@property (copy) NSString* mes;
@property (copy) NSString* sid;

@end

@interface LineInfo : NSObject<NSCopying>

@property (copy) NSString* end_earlytime;
@property (copy) NSString* end_latetime;
@property (copy) NSString* end_stop;
@property (copy) NSString* line_id;
@property (copy) NSString* line_name;
@property (copy) NSString* start_earlytime;
@property (copy) NSString* start_latetime;
@property (copy) NSString* start_stop;

@end

 
@interface Stops : NSObject<NSCopying>

@property (copy) NSString *zdmc;
@property (copy) NSString  *stopsid;
@property (copy) NSString  *waitStatus;
@end

@interface LineResult : NSObject<NSCopying>

@property (copy) NSString *direction;
@property (nonatomic,retain) NSMutableArray  *stops;

@end

@interface LineResultTwo : NSObject<NSCopying>

@property (copy) LineResult *lineresult0;
@property (copy) LineResult *lineresult1;




@end