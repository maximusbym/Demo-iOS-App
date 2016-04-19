//
//  MKFBNavigationViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKFBNavigationViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "MKFBTableViewController.h"

@interface MKFBNavigationViewController ()

@end

@implementation MKFBNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self performSegueWithIdentifier:@"FBPosts" sender:nil];
        
    }
    else {
        [self performSegueWithIdentifier:@"FBLogin" sender:nil];
    }
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
