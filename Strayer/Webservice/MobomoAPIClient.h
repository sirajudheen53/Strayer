//
//  MobomoAPIClient.h
//  MCR
//
//  Created by Mobomo LLC on 10/9/13.
//  Copyright (c) 2013 Mobomo LLC. All rights reserved.
//

#import "AFNetworking.h"
#import "MBMNetworkActivity.h"
#import "AFHTTPRequestOperationManager.h"

// The web locations of the service

// PRODUCTION



//#define APIHost @"http://10.2.0.31:3000/apis/"
#define APIVersion @"v1.51i"

typedef void (^APIClientSuccessCallback) (id response);
typedef void (^APIClientFailureCallback) (id error);

@interface MobomoAPIClient : AFHTTPRequestOperationManager

+ (MobomoAPIClient*)client;

- (void)commandWithGETMethod:(NSString *)method params:(NSMutableDictionary*)params success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;

- (void)commandWithPOSTMethod:(NSString *)method params:(NSMutableDictionary*)params success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
@end