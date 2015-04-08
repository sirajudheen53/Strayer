//
//  SingleTest+DBOperation.h
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "SingleTest.h"
#import "AMPDBManager.h"

@interface SingleTest (DBOperation)
+(SingleTest *)saveSingleTest:(NSDictionary *)data;
@end
