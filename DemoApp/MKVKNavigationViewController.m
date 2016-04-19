//
//  MKFBNavigationViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKVKNavigationViewController.h"
#import "MKVKTableViewController.h"
#import <VKSdk.h>

@interface MKVKNavigationViewController ()

@end

@implementation MKVKNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *scope = @[@"friends", @"wall"];
    
    [VKSdk wakeUpSession:scope completeBlock:^(VKAuthorizationState state, NSError *error) {

        if (state == VKAuthorizationAuthorized) {
            [self performSegueWithIdentifier:@"VKPosts" sender:nil];
        }
        else {
            [self performSegueWithIdentifier:@"VKLogin" sender:nil];
        }
    }];
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
