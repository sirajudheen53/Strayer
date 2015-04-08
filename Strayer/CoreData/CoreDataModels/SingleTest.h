//
//  SingleTest.h
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MenuDetails;

@interface SingleTest : NSManagedObject

@property (nonatomic, retain) NSNumber * canAccess;
@property (nonatomic, retain) NSNumber * comparisonTestId;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSDate * expiryDate;
@property (nonatomic, retain) NSNumber * ids;
@property (nonatomic, retain) NSString * messageBeforeTest;
@property (nonatomic, retain) NSString * missedQuestionsText;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * numberOfTries;
@property (nonatomic, retain) NSString * peersScoredText;
@property (nonatomic, retain) NSNumber * reviewMode;
@property (nonatomic, retain) NSNumber * scoreRangeFrom;
@property (nonatomic, retain) NSNumber * scoreRangeTo;
@property (nonatomic, retain) NSString * scoresByCategoryText;
@property (nonatomic, retain) NSString * shortName;
@property (nonatomic, retain) NSNumber * showComparison;
@property (nonatomic, retain) NSNumber * showInstructionPage;
@property (nonatomic, retain) NSNumber * showMessageBeforeTest;
@property (nonatomic, retain) NSNumber * showResultsScreen;
@property (nonatomic, retain) NSNumber * showSubmitScore;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * testCode;
@property (nonatomic, retain) NSString * testLogoUrl;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * typeId;
@property (nonatomic, retain) MenuDetails *hasMenuDetails;

@end
