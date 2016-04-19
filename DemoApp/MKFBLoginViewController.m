//
//  MKFBLoginViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKFBLoginViewController.h"
#import "MKFBTableViewController.h"
#import "SWRevealViewController.h"

@interface MKFBLoginViewController ()

@end

@implementation MKFBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"user_friends", @"email", @"user_posts"];
    loginButton.publishPermissions = @[@"publish_actions"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    if( result.token ) {
        [self performSegueWithIdentifier:@"FBPosts" sender:nil];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

- (void)viewWillAppear:(BOOL)animated {
    
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
