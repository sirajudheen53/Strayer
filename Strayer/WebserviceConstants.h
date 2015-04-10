//
//  WebserviceConstants.h
//  Strayer
//
//  Created by user on 10/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "Constants.h"

#define BASE_URL @""

#define API_TYPE @"moc"
#define API_AUTH_TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:kAuthToken]
#define COURSE_ID @59

//Webservice methods

#define LOGIN_URL @"login"
#define UN_AUTHORIZED_URL @"get-unauthorized-token"
#define GET_MENU_URL @"get-menus"
#define GET_MENU_COUNT_URL @"get-user-test-counts"
#define GET_QUESTIONS_URL @"get-questions"
#define GET_ALL_QUESTIONS_URL @"get-questions"
#define GET_Last_Question @"get-last-question"
#define Test_Submit_Answer @"post-answer"
#define GET_Test_Score @"get-score"
#define GOTO_Review_Mode @"go-to-review-mode"
#define Get_Review_Mode_Questions @"get-review-mode-questions"
#define Post_Review_Mode_Data @"post-review-question-data"
#define OFFLINE_DATA_SUBMISSION @"save-offline-data"
#define GET_Peer_Score @"get-question-peer-scores-by-testid"
#define Get_User_Score @"get-user-question-answers"
#define Get_User_Peer_Rank @"get-user-peer-rank-percentile"
#define Retake_Test @"retake-test"
#define Get_Notificaition_Settings @"get-user-notification-settings"
#define Set_Notificaition_Settings @"save-user-notification-settings"
#define Get_ABIM_Values @"get-abim-values"
#define Set_ABIM_Values @"save-user-personal-details"
#define Track_Links @"track-links"
#define FindNearestLocations @"locations/find_nearest_locations"
