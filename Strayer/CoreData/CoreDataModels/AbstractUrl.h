//
//  AbstractUrl.h
//  Strayer
//
//  Created by user on 08/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface AbstractUrl : NSManagedObject

@property (nonatomic, retain) NSNumber * abstractId;
@property (nonatomic, retain) NSString * reference;
@property (nonatomic, retain) NSString * referenceUrl;
@property (nonatomic, retain) Question *question;

@end
