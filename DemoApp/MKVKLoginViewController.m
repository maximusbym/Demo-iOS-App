//
//  MKFBLoginViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKVKLoginViewController.h"
#import "MKVKTableViewController.h"
#import "SWRevealViewController.h"

static NSArray *SCOPE = nil;

@interface MKVKLoginViewController () <VKSdkUIDelegate>

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller;

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError;

@end

@implementation MKVKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    SCOPE = @[VK_PER_FRIENDS, VK_PER_WALL];
    
    [[VKSdk instance] registerDelegate:self];
    [[VKSdk instance] setUiDelegate:self];
    
    [VKSdk wakeUpSession:SCOPE completeBlock:^(VKAuthorizationState state, NSError *error) {
        
        if (state == VKAuthorizationAuthorized) {
            [self performSegueWithIdentifier:@"VKPosts" sender:nil];
        } else if (state == VKAuthorizationInitialized) {
            [VKSdk authorize:SCOPE];
        } else if (error) {
            [[self navigationController] performSegueWithIdentifier:@"mainView" sender:self];
        }
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self.navigationController.topViewController];
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    [VKSdk authorize:SCOPE];
}

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    
    if (result.token) {
        
        // it is done in the nav controller already
        //[[self navigationController] performSegueWithIdentifier:@"VKPosts" sender:nil];
        
    } else if (result.error) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                    message: [NSString stringWithFormat:@"Access denied\n%@", result.error]
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  [[self navigationController] performSegueWithIdentifier:@"mainView" sender:self];
                                                              }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)vkSdkUserAuthorizationFailed {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"Access denied"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self.navigationController.topViewController presentViewController:controller animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
