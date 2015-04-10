//
//  MobomoAPIClient.h
//  MCR
//
//  Created by Mobomo LLC on 10/9/13.
//
//

#import "MobomoAPIClient.h"

@interface CTGAPIClient : MobomoAPIClient

+ (NSMutableDictionary*)apiDefaultParams;

+ (void)loginWithUserName:(NSString *)username password:(NSString*)password success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)getUnAuthorizedTokenWithSuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchMenusWithsuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchMenuCountWithsuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchAllQuestionsWithTsetId:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchLastQuestion:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)submitAnswerForTest:(NSDictionary *)answerDict success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchTheScoreForTheTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)goToReviewMode:(NSNumber *)testId reviewMode:(int)reviewMode success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)fetchReviewModeQuestions:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)submitPostReviewModeData:(NSDictionary *)answerDict success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)getUserPeerScoreForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock ;
+ (void)getUserScoreForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)submitUserOfflineCachedData:(NSDictionary *)offlineData success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)getUserPeerRankForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)retakeTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)getNotificationSettingsWithSuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)setNotificationSettingsWithSuccess:(NSDictionary *)offlineData success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)abimDetails:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)updatePersonalDetails:(NSString *)abimId dob:(NSString *)dob success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
+ (void)trackLinks:(NSDictionary *)link success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock;
@end
