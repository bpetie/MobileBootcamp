//
//  ListViewController.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/14/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"List" image:[UIImage imageNamed:@"List"] selectedImage:[UIImage imageNamed:@"List"]];
        self.view.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
