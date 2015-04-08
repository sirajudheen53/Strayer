//
//  MenuDetails+DBOperation.m
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "MenuDetails+DBOperation.h"

@implementation MenuDetails(DBOperation)

+(MenuDetails *)saveMenuDetails:(NSDictionary *)data andCountArray:(NSMutableArray *)countArray{
    MenuDetails *menuObject = nil;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MenuDetails"];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"ids = %d",[[data objectForKey:@"id"] intValue]];
    NSError *error = nil;
    NSArray *matches = [[AMPDBManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if ([matches count] > 0)
    {
        menuObject = [matches objectAtIndex:0];
    }
    else
    {
        menuObject = [NSEntityDescription insertNewObjectForEntityForName:@"MenuDetails" inManagedObjectContext:[AMPDBManager sharedManager].managedObjectContext];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    menuObject.name = [data objectForKey:@"name"];
    menuObject.ids = [formatter numberFromString:[data objectForKey:@"id"]];
    menuObject.canAccess = [data objectForKey:@"canAccess"];
    menuObject.requireLogin = [formatter numberFromString:[data objectForKey:@"requireLogin"]];
    menuObject.hasSingleTest = [SingleTest saveSingleTest:[[data objectForKey:@"singleTest"] firstObject]];
    
    for (NSDictionary *countDict in countArray) {
        NSString *testId = [NSString stringWithFormat:@"%@",[menuObject.hasSingleTest valueForKey:@"ids"]];
        if ([[countDict valueForKey:@"testId"]isEqualToString:testId]) {
            
            int badgeCount = 0;
            menuObject.testId = [[countDict valueForKey:@"testId"]isKindOfClass:[NSNumber class]]?[countDict valueForKey:@"testId"]:[formatter numberFromString:[countDict valueForKey:@"testId"]];
            menuObject.remainingCount = [[countDict valueForKey:@"remainingCount"]isKindOfClass:[NSNumber class]]?[countDict valueForKey:@"remainingCount"]:[formatter numberFromString:[countDict valueForKey:@"remainingCount"]];
            menuObject.correctCount = [[countDict valueForKey:@"correctCount"]isKindOfClass:[NSNumber class]]?[countDict valueForKey:@"correctCount"]:[formatter numberFromString:[countDict valueForKey:@"correctCount"]];
            menuObject.wrongCount = [[countDict valueForKey:@"wrongCount"]isKindOfClass:[NSNumber class]]?[countDict valueForKey:@"wrongCount"]:[formatter numberFromString:[countDict valueForKey:@"wrongCount"]];
            badgeCount = [countDict[@"notificationCount"] intValue];
            badgeCount = MIN(badgeCount, [menuObject.remainingCount intValue]);
            menuObject.badgeCount = [NSNumber numberWithInt:badgeCount];
            menuObject.totalCount = [[countDict valueForKey:@"totalQuestions"]isKindOfClass:[NSNumber class]]?[countDict valueForKey:@"totalQuestions"]:[formatter numberFromString:[countDict valueForKey:@"totalQuestions"]];
        }
        
        menuObject.sortOrder = [NSNumber numberWithInt:[data[@"sortOrder"] intValue]];
    }
    
    [[AMPDBManager sharedManager] saveContext];
    
    return menuObject;
    
}

+ (NSMutableArray *)fetchAllMenuDetails{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MenuDetails"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES]];
    NSError *error;
    NSArray *menuDetails = [[AMPDBManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return [NSMutableArray arrayWithArray:menuDetails];
}

+(void)removeMenuDetails:(NSDictionary *)data {
   
    MenuDetails *menuObject = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MenuDetails"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"ids = %d",[[data objectForKey:@"id"] intValue]];
    NSError *error = nil;
    NSArray *matches = [[AMPDBManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if ([matches count] > 0)
    {
        menuObject = [matches objectAtIndex:0];
        [[AMPDBManager sharedManager].managedObjectContext deleteObject:menuObject];
    }
    
}
@end
