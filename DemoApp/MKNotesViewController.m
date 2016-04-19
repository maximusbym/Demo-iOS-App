//
//  MKNotesViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKNotesViewController.h"
#import "MKDataManager.h"

@interface MKNotesViewController ()

@end

@implementation MKNotesViewController

-(NSManagedObjectContext *)managedObjectContext {
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[MKDataManager sharedManager] managedObjectContext];
    }
    return _managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.curNote) {
        [self.titleItem setText:[self.curNote valueForKey:@"title"]];
        [self.textItem setText:[self.curNote valueForKey:@"text"]];
    }
}

- (IBAction)saveNote:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.curNote) {
        [self.curNote setValue:self.titleItem.text forKey:@"title"];
        [self.curNote setValue:self.textItem.text forKey:@"text"];
        [self.curNote setValue:[NSDate date] forKey:@"date"];
    } else {
        
        NSManagedObject *newNote = [NSEntityDescription insertNewObjectForEntityForName:@"MKNote" inManagedObjectContext:context];
        
        [newNote setValue:self.titleItem.text forKey:@"title"];
        [newNote setValue:self.textItem.text forKey:@"text"];
        [newNote setValue:[NSDate date] forKey:@"date"];
    }
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        NSLog(@"%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
