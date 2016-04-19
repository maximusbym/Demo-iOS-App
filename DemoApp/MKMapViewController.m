//
//  MKMapViewController.m
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import "MKMapViewController.h"
#import "SWRevealViewController.h"
#import "MKMapDataManager.h"

@interface MKMapViewController ()
@property (strong,nonatomic) MKMapDataManager *mapDataManager;
@end

@implementation MKMapViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self showAnnotations];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.5;
    [self.mapView addGestureRecognizer:lpgr];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)showAnnotations {
    
    self.mapDataManager = [[MKMapDataManager alloc] init];
    NSMutableArray *locations = [self.mapDataManager annotations];
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];

    for (NSDictionary *row in locations) {
        
        NSNumber *latitude = [row objectForKey:@"latitude"];
        NSNumber *longitude = [row objectForKey:@"longitude"];
        NSString *title = [row objectForKey:@"title"];
        
        CLLocationCoordinate2D coord;
        coord.latitude = latitude.doubleValue;
        coord.longitude = longitude.doubleValue;
        
        MKPointAnnotation *mapPin = [[MKPointAnnotation alloc] init];
        
        mapPin.title = title;
        mapPin.coordinate = coord;
        
        [annotations addObject:mapPin];
    }
    
    [self.mapView addAnnotations:annotations];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    [self.mapDataManager addPointX:touchMapCoordinate.latitude Y:touchMapCoordinate.longitude];
    [self showAnnotations];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
