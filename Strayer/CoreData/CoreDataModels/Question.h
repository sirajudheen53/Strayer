//
//  Question.h
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AbstractUrl, Answer, MenuDetails;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * caseBgField;
@property (nonatomic, retain) NSString * detailText;
@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSNumber * isMissed;
@property (nonatomic, retain) NSDate * notificationFireDate;
@property (nonatomic, retain) NSNumber * qnId;
@property (nonatomic, retain) NSNumber * questionType;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *abrstractUrl;
@property (nonatomic, retain) NSSet *answer;
@property (nonatomic, retain) MenuDetails *test;
@property (nonatomic, retain) Answer *userAnswer;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addAbrstractUrlObject:(AbstractUrl *)value;
- (void)removeAbrstractUrlObject:(AbstractUrl *)value;
- (void)addAbrstractUrl:(NSSet *)values;
- (void)removeAbrstractUrl:(NSSet *)values;

- (void)addAnswerObject:(Answer *)value;
- (void)removeAnswerObject:(Answer *)value;
- (void)addAnswer:(NSSet *)values;
- (void)removeAnswer:(NSSet *)values;

@end
