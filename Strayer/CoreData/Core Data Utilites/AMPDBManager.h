//
//  AMPDBManager.h
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface AMPDBManager : NSObject
{
    NSManagedObjectContext *context;
}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (NSManagedObjectContext *)getCurrentContext;

-(BOOL) save;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+(AMPDBManager *)sharedManager;
@end
