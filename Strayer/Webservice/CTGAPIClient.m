//
//  MobomoAPIClient.m
//  MCR
//
//  Created by Mobomo LLC on 10/9/13.
//
//

#import "CTGAPIClient.h"
#import "WebserviceConstants.h"

@implementation CTGAPIClient


+ (NSMutableDictionary*)apiDefaultParams {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"apiType"] = API_TYPE;
    if (API_AUTH_TOKEN) {
        params[@"authToken"] = API_AUTH_TOKEN;
    }

    return params;
}

+ (void)loginWithUserName:(NSString *)username password:(NSString*)password success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:username forKey:@"username"];
    [params setObject:password forKey:@"password"];
    [params setObject:[NSString stringWithFormat:@"%@ %@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] localizedModel]]  forKey:@"deviceInfo"];
    [params setObject:[[UIDevice currentDevice] model] forKey:@"deviceType"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:LOGIN_URL
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}
+ (void)getUnAuthorizedTokenWithSuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:COURSE_ID forKey:@"courseId"];
    [params setObject:[NSString stringWithFormat:@"%@ %@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] localizedModel]]  forKey:@"deviceInfo"];
    [params setObject:[[UIDevice currentDevice] model] forKey:@"deviceType"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:UN_AUTHORIZED_URL
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}
+ (void)fetchMenusWithsuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_MENU_URL
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
}
+ (void)fetchMenuCountWithsuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_MENU_COUNT_URL
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}
+ (void)fetchAllQuestionsWithTsetId:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_ALL_QUESTIONS_URL
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)fetchLastQuestion:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_Last_Question
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
    
}

+ (void)submitAnswerForTest:(NSDictionary *)answerDict success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
  
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    
    [params addEntriesFromDictionary:answerDict];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Test_Submit_Answer
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
    
}

+ (void)fetchTheScoreForTheTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_Test_Score
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
}

+ (void)goToReviewMode:(NSNumber *)testId reviewMode:(int)reviewMode success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    [params setObject:[NSString stringWithFormat:@"%d", reviewMode] forKey:@"reviewMode"];
    
    
    [[MobomoAPIClient client] commandWithPOSTMethod:GOTO_Review_Mode
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
    
}

+ (void)fetchReviewModeQuestions:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Get_Review_Mode_Questions
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
    
}

+ (void)submitPostReviewModeData:(NSDictionary *)answerDict success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    
    [params addEntriesFromDictionary:answerDict];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Post_Review_Mode_Data
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
    
}

+ (void)submitUserOfflineCachedData:(NSDictionary *)offlineData success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params addEntriesFromDictionary:offlineData];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:OFFLINE_DATA_SUBMISSION
                                         params:params
                                        success:successBlock
                                        failure:failureBlock];
}

+ (void)getUserScoreForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Get_User_Score
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)getUserPeerScoreForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:GET_Peer_Score
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)getUserPeerRankForTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock{
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Get_User_Peer_Rank
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)retakeTest:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock{
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Retake_Test
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)getNotificationSettingsWithSuccess:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Get_Notificaition_Settings
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)setNotificationSettingsWithSuccess:(NSDictionary *)offlineData success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params addEntriesFromDictionary:offlineData];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Set_Notificaition_Settings
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)abimDetails:(NSNumber *)testId success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:testId forKey:@"testId"];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Get_ABIM_Values
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}


+ (void)updatePersonalDetails:(NSString *)abimId dob:(NSString *)dob success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params setObject:abimId forKey:@"abimId"];
    [params setObject:dob forKey:@"dateOfBirth"];

    [[MobomoAPIClient client] commandWithPOSTMethod:Set_ABIM_Values
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

+ (void)trackLinks:(NSDictionary *)link success:(APIClientSuccessCallback)successBlock failure:(APIClientFailureCallback)failureBlock {
    
    NSMutableDictionary *params = [[self class] apiDefaultParams];
    [params addEntriesFromDictionary:link];
    
    [[MobomoAPIClient client] commandWithPOSTMethod:Track_Links
                                             params:params
                                            success:successBlock
                                            failure:failureBlock];
}

@end