//
//  MKVKDelegate.m
//  DemoApp
//
//  Created by Max Kalahur on 19.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKVKDelegate.h"
#import "MKVKNavigationViewController.h"


@implementation MKVKDelegate

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    
    NSLog(@"%@",result);
    
    if( result != nil ) {
        MKVKNavigationViewController *navController = [[MKVKNavigationViewController alloc] init];
        [navController performSegueWithIdentifier:@"VKPosts" sender:nil];
    }
    
}

- (void)vkSdkUserAuthorizationFailed {
    
}


@end
