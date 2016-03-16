//
//  MapViewController.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/14/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "MapViewController.h"

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

@end
