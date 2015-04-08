//
//  MenuDetails+DBOperation.h
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "MenuDetails.h"
#import "AMPDBManager.h"
#import "SingleTest+DBOperation.h"

@interface MenuDetails (DBOperation)
+(MenuDetails *)saveMenuDetails:(NSDictionary *)data andCountArray:(NSMutableArray *)countArray;
+ (NSMutableArray *)fetchAllMenuDetails;
+(void)removeMenuDetails:(NSDictionary *)data;
@end
