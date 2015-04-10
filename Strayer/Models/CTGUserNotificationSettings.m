//
//  CTGUserNotificationSettings.m
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "CTGUserNotificationSettings.h"
#import "Constants.h"
#import "NSDate+StringConversion.h"
#import "UserDefaultConstants.h"

@implementation CTGUserNotificationSettings

+ (instancetype)userSettingsWithWebserviceResponse:(NSDictionary *)response {
    CTGUserNotificationSettings *notificationSettings = [[CTGUserNotificationSettings alloc] init];
    notificationSettings.isVaccationModeOn = [response[@"vacation_mode"] boolValue];
    notificationSettings.questionFrequency = [response[@"question_frequency"] integerValue];
    notificationSettings.currentFrequency = [response[@"current_frequency"] integerValue];

    NSString *vacationModeUpdatedDate = response[@"updated_created_dates"][@"vacation_mode"];
    notificationSettings.vacationModeUpdatedAt = [NSDate dateFromString:vacationModeUpdatedDate
                                                             withFormat:WEBSERVICE_RESPONSE_DATE_FORMAT];
    
    NSString *questionFrequenceyUpdatedDate = response[@"updated_created_dates"][@"question_frequency"];
    notificationSettings.questionFrequencyUpdatedAt = [NSDate dateFromString:questionFrequenceyUpdatedDate
                                                                  withFormat:WEBSERVICE_RESPONSE_DATE_FORMAT];
    
    NSString *currentFrequencyUpdatedDate = response[@"updated_created_dates"][@"current_frequency"];
    notificationSettings.currentFrequencyUpdatedAt = [NSDate dateFromString:currentFrequencyUpdatedDate
                                                        withFormat:WEBSERVICE_RESPONSE_DATE_FORMAT];
    
    return notificationSettings;
}

+ (instancetype)savedUserSettingsFromStandardUserDefaults {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    CTGUserNotificationSettings *userSettings = [standardUserDefaults objectForKey:USER_SETTINGS_USER_DEFAULT_KEY];
    return userSettings;
}

- (void)saveToStandardUserDefaults {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:self forKey:USER_SETTINGS_USER_DEFAULT_KEY];
    [standardUserDefaults synchronize];
}

- (NSInteger)remainingVacationDays {
    if (self.isVaccationModeOn) {
        NSTimeInterval timeIntervalSinceVactionMadeChange = [[NSDate date] timeIntervalSinceDate:self.vacationModeUpdatedAt];
        NSInteger totalNumberOfDaysSinceVacationMadeChange = floor(timeIntervalSinceVactionMadeChange/(DAY_IN_SECONDS));
        NSInteger remainingDays = MAXIMUM_VACCATION_DAYS - totalNumberOfDaysSinceVacationMadeChange;
        return remainingDays;
    } else {
        return 0;
    }
}

@end
