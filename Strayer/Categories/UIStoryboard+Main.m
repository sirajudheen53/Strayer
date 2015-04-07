//
//  UIStoryboard+Main.m
//  Strayer
//
//  Created by user on 07/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "UIStoryboard+Main.h"

UIStoryboard *_mainStoryboard = nil;

@implementation UIStoryboard (Main)

+ (UIStoryboard *)mainStoryBoard {
    if (!_mainStoryboard) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *storyboardName = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
        _mainStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle:bundle];
    }
    return _mainStoryboard;
}

@end
