//
//  MKFBTableViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 18.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKVKTableViewController.h"
#import "SWRevealViewController.h"
#import <VKSdk.h>
#import "MKPostCell.h"
#import "MKPost.h"

@interface MKVKTableViewController ()
@property (strong, nonatomic) NSMutableArray *myPosts;

@end

@implementation MKVKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.myPosts = [[NSMutableArray alloc] init];
    
    VKRequest *getWall = [VKRequest requestWithMethod:@"wall.get"
                                    parameters:@{VK_API_OWNER_ID : [[VKSdk accessToken] userId]}];
    //[[VKSdk accessToken] userId]
    
    [getWall executeWithResultBlock:^(VKResponse *response) {
        
        NSArray *dictsArray = [response.json objectForKey:@"items"];
        
        for (NSDictionary* dict in dictsArray) {
            if( [[dict objectForKey:@"text"] length] != 0 ) {
                MKPost *post = [[MKPost alloc] initWithServerResponse:dict];
                [self.myPosts addObject:post];
            }
        }
        
        [self.tableView reloadData];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}

- (void)viewWillAppear:(BOOL)animated {
    
    
}

- (IBAction)vkLogOut:(id)sender {
    [VKSdk forceLogout];
    [[self navigationController] performSegueWithIdentifier:@"mainView" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myPosts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    MKPostCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    MKPost* post = [self.myPosts objectAtIndex:indexPath.row];

    cell.postTextLabel.text = [NSString stringWithFormat:post.text,@"\n\n"];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    MKPost* post = [self.myPosts objectAtIndex:indexPath.row];
    return [MKPostCell heightForText:post.text];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
