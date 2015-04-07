//
//  MBMNetworkActivity.m
//  RideLeads
//
//  Created by Mobomo LLC on 06/29/2010.
//  Copyright 2010 Mobomo LLC. All rights reserved.
//

#import "MBMNetworkActivity.h"
#import "AppDelegate.h"

static int networkActivityCount = 0;
static NSTimer *hideNetworkActivityTimer = nil;

@implementation MBMNetworkActivity


+ (void)hideNetwork {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


+ (void)_pushNetworkActivity {
	[hideNetworkActivityTimer invalidate];
    if (networkActivityCount == 0) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
	networkActivityCount++;
}


+ (void)_popNetworkActivity {
	networkActivityCount = MAX(networkActivityCount - 1, 0);
    
	if (0 == networkActivityCount) {
		[hideNetworkActivityTimer invalidate];

        hideNetworkActivityTimer = [NSTimer scheduledTimerWithTimeInterval:0.3
																	target:self
																  selector:@selector(hideNetwork)
																  userInfo:nil
																   repeats:NO];
	}
}

#pragma mark Public methods

+ (void)pushNetworkActivity {
	if ([NSThread isMainThread]) {
		[self _pushNetworkActivity];
	} else {
		[self performSelectorOnMainThread:@selector(_pushNetworkActivity) withObject:nil waitUntilDone:NO];
	}
}


+ (void)popNetworkActivity {
	if ([NSThread isMainThread]) {
		[self _popNetworkActivity];
	} else {
		[self performSelectorOnMainThread:@selector(_popNetworkActivity) withObject:nil waitUntilDone:NO];
	}
}

@end
