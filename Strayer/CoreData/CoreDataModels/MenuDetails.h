//
//  MenuDetails.h
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, SingleTest;

@interface MenuDetails : NSManagedObject

@property (nonatomic, retain) NSNumber * badgeCount;
@property (nonatomic, retain) NSNumber * canAccess;
@property (nonatomic, retain) NSNumber * correctCount;
@property (nonatomic, retain) NSString * iconImageUrl;
@property (nonatomic, retain) NSNumber * ids;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * remainingCount;
@property (nonatomic, retain) NSNumber * requireLogin;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSNumber * testId;
@property (nonatomic, retain) NSNumber * testMode;
@property (nonatomic, retain) NSNumber * totalCount;
@property (nonatomic, retain) NSNumber * wrongCount;
@property (nonatomic, retain) SingleTest *hasSingleTest;
@property (nonatomic, retain) NSSet *question;
@end

@interface MenuDetails (CoreDataGeneratedAccessors)

- (void)addQuestionObject:(Question *)value;
- (void)removeQuestionObject:(Question *)value;
- (void)addQuestion:(NSSet *)values;
- (void)removeQuestion:(NSSet *)values;

@end
