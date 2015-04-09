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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signInButtonClicked:(id)sender {
}

- (IBAction)passwordQuestionButtonClicked:(id)sender {
}
@end
