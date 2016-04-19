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
#import "VKAuthorizeController.h"
#import "VKRequestsScheduler.h"

@interface MKVKLoginViewController ()

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
    
    NSArray *scope = @[@"friends", @"wall"];
    
    [VKSdk wakeUpSession:scope completeBlock:^(VKAuthorizationState state, NSError *error) {
        
        if (state == VKAuthorizationInitialized) {
            
            [VKSdk authorize:scope];
            
        } else {
            
            
        }
    }];
    
}



- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    
    NSLog(@"HYI");
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    
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
