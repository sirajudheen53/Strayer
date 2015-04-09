//
//  CTGLoginViewController.h
//  Strayer
//
//  Created by user on 09/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "CTGViewController.h"

@interface CTGLoginViewController : CTGViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameInutTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordInputTextField;

- (IBAction)signInButtonClicked:(id)sender;
- (IBAction)passwordQuestionButtonClicked:(id)sender;

@end
