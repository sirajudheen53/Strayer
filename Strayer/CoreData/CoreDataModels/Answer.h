//
//  Answer.h
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSNumber * answerid;
@property (nonatomic, retain) NSString * answerText;
@property (nonatomic, retain) NSNumber * isCorrect;
@property (nonatomic, retain) NSString * rationale;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) Question *question;

@end
