//
//  NSDate+StringConversion.m
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "NSDate+StringConversion.h"

@implementation NSDate (StringConversion)

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:dateString];
}

@end
