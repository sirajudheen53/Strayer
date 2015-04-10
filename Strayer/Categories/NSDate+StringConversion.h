//
//  NSDate+StringConversion.h
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (StringConversion)

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;

@end
