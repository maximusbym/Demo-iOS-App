//
//  MKFBPostViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKVKPostViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *postTextItem;

- (IBAction)sendPost:(id)sender;

@end
