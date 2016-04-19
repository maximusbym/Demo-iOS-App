//
//  MKFBLoginViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface MKFBLoginViewController : UIViewController <FBSDKLoginButtonDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error;

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton;

@end
