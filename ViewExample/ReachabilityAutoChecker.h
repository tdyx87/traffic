//
//  ReachabilityAutoChecker.h
//  Reachability
//
//  Created by liwei on 16/5/21.
//  Copyright (c) 2016年 Apple Inc. All rights reserved.
//

#import "Reachability.h"


@interface ReachabilityAutoChecker : NSObject

@property (nonatomic, retain) Reachability  *reachability;
@property (nonatomic, assign) NetworkStatus networkStatus;
@property (nonatomic, assign) BOOL          connectionRequired;


+ (id)sharedChecker;
@end