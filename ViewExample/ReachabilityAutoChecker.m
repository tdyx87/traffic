//
//  ReachabilityAutoChecker.m
//  Reachability
//
//  Created by liwei on 16/5/21.
//  Copyright (c) 2016年 Apple Inc. All rights reserved.
//

#import "ReachabilityAutoChecker.h"

@implementation ReachabilityAutoChecker

@synthesize reachability;

+ (id)sharedChecker
{
    static ReachabilityAutoChecker *staticChecker = nil;
    if (!staticChecker) {
        staticChecker = [[ReachabilityAutoChecker alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:staticChecker selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        staticChecker.networkStatus = NotReachable;
        staticChecker.connectionRequired = NO;
    }
    return staticChecker;
}

- (void)reachabilityChanged:(NSNotification* )note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    self.networkStatus = [curReach currentReachabilityStatus];
    self.connectionRequired = [curReach connectionRequired];
}

@end