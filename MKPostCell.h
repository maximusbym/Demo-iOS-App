//
//  MKPostCell.h
//  DemoApp
//
//  Created by Max Kalahur on 20.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKPostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* postTextLabel;

+ (CGFloat) heightForText:(NSString*) text;

@end
