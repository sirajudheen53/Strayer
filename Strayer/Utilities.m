//
//  Utilities.m
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

//Date methods
static NSArray *dateFormats = nil;
static NSString *kSQLiteDateFormat = @"yyyy/MM/dd HH:mm:ss Z";
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString*)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *result = [formatter stringFromDate:date];
    return result;
}

+ (NSArray *)dateFormats {
    if (!dateFormats) {
        dateFormats = [[NSArray alloc] initWithObjects:
                       kSQLiteDateFormat,
                       @"MMM-YYYY",
                       @"yyyy-MM-dd",
                       @"yyyy-12",
                       @"yyyy/MM/dd",
                       @"yyyy/MM/dd",
                       @"yyyy/MM/dd HH:mm:ss",
                       @"yyyy/MM/dd HH:mm a",
                       @"yyyy-MM-dd HH:mm:ss Z",
                       @"yyyy-MM-dd HH:mm:ss K",
                       @"yyyy-MM-dd HH:mm:ss ZZ",
                       @"MM/dd/yyyy",
                       @"MM/dd/yyyy HH:mm:ss Z",
                       @"h:mm a",
                       @"hh:mm a",
                       @"yyyy/MM/dd HH:mm:ss Z",
                       @"yyyy/MM/dd hh:mm:ss",
                       @"yyyy/MM/dd hh:mm a",
                       @"MM/dd/yyyy hh:mm a",
                       @"yyyy-MM-dd hh:mm a",
                       @"yyyy-MM-dd HH:mm:ss",
                       @"yyyy-MM-dd'T'hh:mm:ss",
                       nil];
    }
    return dateFormats;
}

//To get date as NSDate from NSString with the specified format.
+ (NSDate *)dateFromString:(NSString *)dateString {
    if (!dateString) {
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    NSDate *date;
    for (NSString *format in [self dateFormats]) {
        [formatter setDateFormat:format];
        date = [formatter dateFromString:dateString];
        if (date) {
            return date;
        }
    }
    
    return nil;
}


@end
