//
//  ListViewController.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/14/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "ListViewController.h"
#import "DataParser.h"
#import "HotelDataModel.h"
#import <AFNetworking/AFNetworking.h>

@interface ListViewController() <UITableViewDelegate, UITableViewDataSource>

@end

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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStaticConstraints];
}

- (void)setStaticConstraints {
    NSDictionary *views = @{@"tableView": self.tableView};
    NSMutableArray *constraints = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|"
                                                                                                         options:0
                                                                                                         metrics:nil
                                                                                                           views:views]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:constraints];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DataParser sharedManager].hotels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    HotelDataModel *model = (HotelDataModel *)[DataParser sharedManager].hotels[indexPath.row];
    cell.textLabel.text = model.name;

    UIImageView *myImage = [UIImageView new];
    [myImage setImageWithURL:model.thumbnailURL placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    myImage.frame = CGRectMake(0, 0, 50, 50);
    [cell.contentView addSubview:myImage];
    return cell;
}

#pragma mark - Lazy Loading
//https://medium.com/swift-programming/how-to-do-proper-lazy-loading-in-swift-b8bc57dbc7b9#.73d5bp1bc

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
