//
//  NetProtocol.h
//  Traffic
//
//  Created by liwei on 16/4/21.
//  Copyright (c) 2016年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"
@protocol NetProtocol <NSObject>


@optional
-(void)parseJson:(id)data flag:(NSString*)flag;
-(void)parseData:(id)data flag:(NSString*)flag;
-(void)returnPackData:(SID*)sid lineinfo:(LineInfo*)lineinfo results:(LineResultTwo*)result;


@end
