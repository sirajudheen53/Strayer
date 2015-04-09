//
//  AppDelegate.m
//  Strayer
//
//  Created by user on 06/04/15.
//  Copyright (c) 2015 mobomo. All rights reserved.
//

#import "CTGAppDelegate.h"
#import <PKRevealController.h>
#import "UIStoryboard+Main.h"
#import "CTGSideMenuViewController.h"

#define MAIN_NAVIGATION_VIEW_STORY_BOARD_IDENTIFIER @"mainNavigationView"

@interface CTGAppDelegate ()

@property (nonatomic, strong) PKRevealController *revealController;
@property (nonatomic, strong) CTGSideMenuViewController *sideMenuView;


@end

@implementation CTGAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIStoryboard *mainStoryboard = [UIStoryboard mainStoryBoard];
    
    // courseLibrary = [self.storyboard instantiateViewControllerWithIdentifier:@"CourseLibrary"];
    _sideMenuView = [mainStoryboard instantiateViewControllerWithIdentifier:SIDE_MENU__NAVIGATION_VIEW_STORY_BOARD_IDENTIFIER];
    
    UINavigationController *navigationController = [mainStoryboard instantiateViewControllerWithIdentifier:MAIN_NAVIGATION_VIEW_STORY_BOARD_IDENTIFIER];
    
    self.revealController = [PKRevealController revealControllerWithFrontViewController:navigationController leftViewController:_sideMenuView];
    self.revealController.animationDuration = 0.5;
    
    self.revealController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.window setRootViewController:_revealController];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
#warning Methods should implement for saving core data context
}

#pragma mark - Public Methods

+ (CTGAppDelegate *)application
{
    return (CTGAppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
