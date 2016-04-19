//
//  MKNotesViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MKNotesViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) IBOutlet UITextField *titleItem;
@property (strong, nonatomic) IBOutlet UITextView *textItem;

@property (strong) NSManagedObjectModel *curNote;

- (IBAction)saveNote:(id)sender;

@end
