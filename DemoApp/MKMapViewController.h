//
//  MKMapViewController.h
//  DemoApp
//
//  Created by Max Kalahur on 07.04.16.
//  Copyright © 2016 Max Kalahur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol MKMapAnnotationDelegate;

@interface MKMapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
