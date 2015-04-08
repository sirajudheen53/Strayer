//
//  MenuDetails+DBOperation.h
//  AscoMocPulse
//
//  Created by Akhildas on 13/10/14.
//  Copyright (c) 2014 Mobomo. All rights reserved.
//

#import "Answer.h"
#import "AMPDBManager.h"

@interface Answer(DBOperation)
+(Answer *)saveAnswerDetails:(NSDictionary *)ansDict;
+ (NSArray *)fetchCorrectAnswer:(NSSet *)answerSet;
@end
