//
//  CTGUserNotificationSettings.h
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QuestionFrequency) {
    twoQuestionEveryOtherDay,
    fiveQuestionEveryOtherDay
};

@interface CTGUserNotificationSettings : NSObject

@property (nonatomic, assign) BOOL isVaccationModeOn;
@property (nonatomic, assign) QuestionFrequency questionFrequency;
@property (nonatomic, assign) QuestionFrequency currentFrequency;
@property (nonatomic, strong) NSDate *currentFrequencyUpdatedAt;
@property (nonatomic, strong) NSDate *questionFrequencyUpdatedAt;
@property (nonatomic, strong) NSDate *vacationModeUpdatedAt;

/**
 This function will create UserSettings with respect to provided webservice response.
 
 @param response - Dictionary with predefined keys in Strayer webservice doc
 
**/
+ (instancetype)userSettingsWithWebserviceResponse:(NSDictionary *)response;

/**
 This function will search previously saved user settings from NSUserDefaults. Then returm if any found for the key 'userSettingsUserDefaultsKey'
**/

+ (instancetype)savedUserSettingsFromStandardUserDefaults;

- (void)saveToStandardUserDefaults;

- (NSInteger)remainingVacationDays;

@end
