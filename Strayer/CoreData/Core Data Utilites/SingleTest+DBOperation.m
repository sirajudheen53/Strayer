//
//  SingleTest+DBOperation.m
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "SingleTest+DBOperation.h"
#import "Utilities.h"
#import "Constants.h"

@implementation SingleTest (DBOperation)
+(SingleTest *)saveSingleTest:(NSDictionary *)data{
  
    SingleTest *singleTestObj = nil;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"SingleTest"];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"ids=%@",[data objectForKey:@"id"]];
    NSError *error = nil;
    NSArray *matches = [[AMPDBManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!matches || ([matches count] > 1))
    {
        //   Error
    }
    else if ([matches count] == 0)
    {
        singleTestObj = [NSEntityDescription insertNewObjectForEntityForName:@"SingleTest" inManagedObjectContext:[AMPDBManager sharedManager].managedObjectContext];
    }
    else
    {
        singleTestObj = [matches objectAtIndex:0];
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

    if (singleTestObj != nil){
        singleTestObj.canAccess = [data objectForKey:@"canAccess"];
        singleTestObj.comparisonTestId = [formatter numberFromString:[data objectForKey:@"comparisonTestId"]];
        singleTestObj.descriptions = [data objectForKey:@"description"];
        singleTestObj.ids = [formatter numberFromString:[data objectForKey:@"id"]];
        singleTestObj.messageBeforeTest = [data objectForKey:@"messageBeforeTest"];
        singleTestObj.missedQuestionsText = [data objectForKey:@"missedQuestionsText"];
        singleTestObj.name = [data objectForKey:@"name"];
        
        singleTestObj.peersScoredText = [data objectForKey:@"peersScoredText"];
        singleTestObj.reviewMode = [formatter numberFromString:[data objectForKey:@"reviewMode"]];
        singleTestObj.scoreRangeFrom = [formatter numberFromString:[data objectForKey:@"scoreRangeFrom"]];
        singleTestObj.scoreRangeTo = [formatter numberFromString:[data objectForKey:@"scoreRangeTo"]];
        singleTestObj.scoresByCategoryText = [data objectForKey:@"scoresByCategoryText"];

        singleTestObj.shortName = [data objectForKey:@"shortName"];
        singleTestObj.showComparison = [formatter numberFromString:[data objectForKey:@"showComparison"]];
        singleTestObj.showInstructionPage = [formatter numberFromString:[data objectForKey:@"showInstructionPage"]];
        singleTestObj.showMessageBeforeTest = [formatter numberFromString:[data objectForKey:@"showMessageBeforeTest"]];
        singleTestObj.showResultsScreen = [formatter numberFromString:[data objectForKey:@"showResultsScreen"]];
        
        singleTestObj.showSubmitScore = [formatter numberFromString:[data objectForKey:@"showSubmitScore"]];
        singleTestObj.sortOrder = [formatter numberFromString:[data objectForKey:@"sortOrder"]];
        singleTestObj.status = [formatter numberFromString:[data objectForKey:@"status"]];
        singleTestObj.testCode = [data objectForKey:@"testCode"];
        singleTestObj.type = [data objectForKey:@"type"];
        singleTestObj.typeId = [formatter numberFromString:[data objectForKey:@"typeId"]];
        singleTestObj.testLogoUrl = [data objectForKey:@"testLogo"];
        singleTestObj.expiryDate = [data[@"expiryDate"] length] > 0 ? [Utilities dateFromString:data[@"expiryDate"]] : [[NSDate date]dateByAddingTimeInterval:45*DAY_IN_SECONDS];
    }
    
    return singleTestObj;
    
}
@end
