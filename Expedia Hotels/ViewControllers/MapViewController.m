//
//  MapViewController.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/14/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MapViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"Map"] selectedImage:[UIImage imageNamed:@"Map"]];
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStaticConstraints];
}

- (void)setStaticConstraints {
    NSDictionary *views = @{@"mapView": self.mapView};
    NSMutableArray *constraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mapView]|"
                                                                                                         options:0
                                                                                                         metrics:nil
                                                                                                           views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mapView]|" options:0 metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - Lazy Loading
- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [MKMapView new];
        _mapView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

@end
