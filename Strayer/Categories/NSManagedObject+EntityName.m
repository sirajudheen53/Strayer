//
//  NSManagedObject+EntityName.m
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "NSManagedObject+EntityName.h"
#import <objc/runtime.h>

@implementation NSManagedObject (EntityName)

+ (NSString *)entityName
{
    return [NSString stringWithUTF8String:class_getName([self class])];
}

@end
