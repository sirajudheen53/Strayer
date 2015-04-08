//
//  MenuDetails+DBOperation.m
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "Answer+DBOperation.h"
#import "NSManagedObject+EntityName.h"

@implementation Answer(DBOperation)

+(Answer *)saveAnswerDetails:(NSDictionary *)ansDict {
    
    Answer *ansObj = nil;
    int ansId = [[ansDict objectForKey:@"id"] intValue];
    NSManagedObjectContext *context = [AMPDBManager sharedManager].managedObjectContext;
    NSFetchRequest *getItem = [NSFetchRequest
                               fetchRequestWithEntityName:[Answer entityName]];
    
    getItem.predicate = [NSPredicate
                         predicateWithFormat:@"answerid == %d", ansId];
    NSArray *matchingItems = [context executeFetchRequest:getItem
                                           error:nil];
    if (matchingItems.count > 0) {
        ansObj = [matchingItems objectAtIndex:0];
    }
    else {
        ansObj = [NSEntityDescription insertNewObjectForEntityForName:[Answer entityName] inManagedObjectContext:context];
    }
    ansObj.answerText = [ansDict objectForKey:@"answerText"];
    ansObj.answerid = [NSNumber numberWithInt:ansId];
    ansObj.isCorrect = [NSNumber numberWithBool:[[ansDict objectForKey:@"isCorrectAnswer"] boolValue]];
    ansObj.rationale = [ansDict objectForKey:@"rationale"];
    ansObj.sortOrder = [NSNumber numberWithInt:[[ansDict objectForKey:@"sortOrder"] intValue]];
    [[AMPDBManager sharedManager] saveContext];
    
    return ansObj;
    
}

+ (NSArray *)fetchCorrectAnswer:(NSSet *)answerSet {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isCorrect == 1"];
    NSError *error;
    NSArray *menuDetails = [[answerSet filteredSetUsingPredicate:predicate] allObjects];
    
    return [NSMutableArray arrayWithArray:menuDetails];
}
@end
