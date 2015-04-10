//
//  UIAlertView+Common.m
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "UIAlertView+Common.h"

@implementation UIAlertView (Common)

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
}

@end
