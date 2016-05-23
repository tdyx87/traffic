//
//  Reachability+AutoChecker.m
//  Reachability
//
//  Created by liwei on 16/5/21.
//  Copyright (c) 2016年 Apple Inc. All rights reserved.
//

#import "Reachability+AutoChecker.h"

#import "ReachabilityAutoChecker.h"


@implementation Reachability (AutoChecker)

+ (void)startCheckWithReachability:(Reachability *)reachability
{
    ReachabilityAutoChecker *checker = [ReachabilityAutoChecker sharedChecker];
    
    if (checker.reachability) {
        [checker.reachability stopNotifier];
        checker.reachability = nil;
    }
    
    checker.reachability = reachability;
    [checker.reachability startNotifier];
}

+ (BOOL)isReachable
{
    ReachabilityAutoChecker *checker = [ReachabilityAutoChecker sharedChecker];
    
    if (!checker.reachability) {
        NSLog(@"Check Reachability With No Reachability has been Set!");
        return NO;
    }
    
    NetworkStatus networkStatus = [checker networkStatus];
    
    if(networkStatus == ReachableViaWiFi)
    {
        NSLog(@"WIFI");
    }
    if(networkStatus == ReachableViaWWAN)
    {
        NSLog(@"3G");
    }
    
    BOOL connectionRequired = NO;
    connectionRequired = [checker connectionRequired];
    
#if kShouldPrintReachabilityFlags
    NSLog(@"NetworkStatus %d connectionRequired %d", networkStatus, connectionRequired);
#endif
    
    if (networkStatus)
        return YES;
    else
        return NO;
}

@end
 