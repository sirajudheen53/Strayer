//
//  MobomoAPIClient.m
//  MCR
//
//  Created by Mobomo LLC on 10/9/13.
//  Copyright (c) 2013 Mobomo LLC. All rights reserved.
//

#import "MobomoAPIClient.h"
#import "Constants.h"
#import "MBProgressHUD.h"
#import "CTGAppDelegate.h"

@implementation MobomoAPIClient

#pragma mark - Singleton MobomoAPIClient method

// Singleton method


+ (MobomoAPIClient*)client {
    
    static MobomoAPIClient *client = nil;
    static dispatch_once_t onceInst;
    
    dispatch_once(&onceInst, ^{
        
        client = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        
        client.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [client.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:
                                                              @"application/json",
                                                              @"text/json",
                                                              @"text/javascript",
                                                              @"text/plain",
                                                              @"text/html",
                                                              @"application/x-www-form-urlencoded", nil]];
        
    });
    
    return client;
}

- (NSString*)apiURLWithMethod:(NSString*)method {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", BASE_URL, method];
    return url;
}

// This function sends an GET API call to the server
- (void)commandWithGETMethod:(NSString *)method params:(NSMutableDictionary*)params success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    [self GET:method parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // success! :)
        [MBMNetworkActivity popNetworkActivity];
        successBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // failure! :(
        [MBMNetworkActivity popNetworkActivity];
        failureBlock(error);
    }];
}

// This function sends an POST API call to the server
- (void)commandWithPOSTMethod:(NSString *)method params:(NSMutableDictionary*)params success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    [self POST:[self apiURLWithMethod:method] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // success! :)
        [MBMNetworkActivity popNetworkActivity];
        NSDictionary *dictionary = responseObject;
        if (![[dictionary valueForKey:@"_responseCode"] isEqualToNumber:@200]) {
            failureBlock(responseObject);
        }
        else{
            successBlock(responseObject);
        }
        [MBProgressHUD hideAllHUDsForView:[CTGAppDelegate application].window animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // failure! :(
        [MBMNetworkActivity popNetworkActivity];
        [MBProgressHUD hideAllHUDsForView:[CTGAppDelegate application].window animated:YES];
        failureBlock(error);
    }];
}

@end