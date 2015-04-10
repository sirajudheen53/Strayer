//
//  CTGLoginViewController.m
//  Strayer
//
//  Created by user on 09/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "CTGLoginViewController.h"
#import "UITextField+Padding.h"
#import "ColorConstants.h"
#import "CTGAppDelegate.h"
#import "CTGAPIClient.h"
#import "MBProgressHUD.h"
#import "Constants.h"
#import "CTGUserNotificationSettings.h"

#define USER_NAME_PLACEHOLDER @"Username"
#define PASSWORK_PLACEHOLDER @"Password"

@interface CTGLoginViewController ()

@end

@implementation CTGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViewElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)setUpViewElements {
    self.userNameInutTextField.layer.borderWidth = 1.0;
    self.userNameInutTextField.layer.borderColor = LOGIN_INPUT_BOX_BORDER_COLOR.CGColor;
    self.userNameInutTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:USER_NAME_PLACEHOLDER
                                                                                       attributes:@{NSForegroundColorAttributeName: LOGIN_INPUT_BOX_PLACE_HOLDER_COLOR}];
    [self.userNameInutTextField addDefaultPadding];
    
    self.passwordInputTextField.layer.borderWidth = 1.0;
    self.passwordInputTextField.layer.borderColor = LOGIN_INPUT_BOX_BORDER_COLOR.CGColor;
    self.passwordInputTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:PASSWORK_PLACEHOLDER
                                                                                       attributes:@{NSForegroundColorAttributeName: LOGIN_INPUT_BOX_PLACE_HOLDER_COLOR}];

    [self.passwordInputTextField addDefaultPadding];
}

- (void)getNotificationSettings {
    [CTGAPIClient getNotificationSettingsWithSuccess:^(id response) {
        NSDictionary *notifiDic = response[@"_api"][@"userNotificaitonSettings"];
        CTGUserNotificationSettings *userNotificationSettings = [CTGUserNotificationSettings userSettingsWithWebserviceResponse:notifiDic];
        [userNotificationSettings saveToStandardUserDefaults];
    } failure:^(id error) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signInButtonClicked:(id)sender {
    if (self.userNameInutTextField.text.length > 0 && self.passwordInputTextField.text.length > 0)
    {
        [MBProgressHUD showHUDAddedTo:[CTGAppDelegate application].window animated:YES];
        [CTGAPIClient loginWithUserName:self.userNameInutTextField.text password:self.passwordInputTextField.text success:^(id response) {
 
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:[response valueForKey:kAuthToken] forKey:kAuthToken];
            [defaults setObject:@1 forKey:kUserLoggedIn];
            [defaults synchronize];
            [self getNotificationSettings];
            [self.navigationController popToRootViewControllerAnimated:YES];
        } failure:^(id error) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Please try again" message:@"User name or password is missmatching" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Missing" message:@"Username or password is missing" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (IBAction)passwordQuestionButtonClicked:(id)sender {
}
@end
