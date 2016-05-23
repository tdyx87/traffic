//
//  Reachability+AutoChecker.h
//  Reachability
//
//  Created by liwei on 16/5/21.
//  Copyright (c) 2016年 Apple Inc. All rights reserved.
//

#import "Reachability.h"

@interface Reachability (AutoChecker)

+ (void)startCheckWithReachability:(Reachability *)reachability;
+ (BOOL)isReachable;

@end
