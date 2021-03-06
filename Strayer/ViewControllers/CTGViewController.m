//
//  CTGViewController.m
//  Strayer
//
//  Created by user on 09/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "CTGViewController.h"
#import "ImageNameConstants.h"

@interface CTGViewController ()

@end

@implementation CTGViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self showNavigationBarSettingsButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showNavigationBarSettingsButton {
    UIImage *buttonImage = [UIImage imageNamed:NAVIGATION_BAR_LEFT_MENU_IMAGE];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:self action:@selector(revealLeftHandMenu) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
}

- (void)revealLeftHandMenu {
    if (self.navigationController.revealController.focusedController == self.navigationController.revealController.leftViewController){
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
    }
    else{
        [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
    }
}


@end
