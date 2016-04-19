//
//  MKNotesTableViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MKNotesTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

- (IBAction)addNote:(id)sender;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
