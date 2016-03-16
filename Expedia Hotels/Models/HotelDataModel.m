//
//  HotelDataModel.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/15/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "HotelDataModel.h"

@implementation HotelDataModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.direction = dictionary[@"direction"];
        self.distance = [dictionary[@"distance"] doubleValue];
        self.key = dictionary[@"key"];
        self.latitude = [dictionary[@"latitude"] doubleValue];
        self.longitude = [dictionary[@"longitude"] doubleValue];
        self.masterID = [dictionary[@"master_id"] intValue];
        self.name = dictionary[@"name"];
        self.nightlyRate = [dictionary[@"nightly_rate"] doubleValue];
        self.reviewScore = [dictionary[@"review_score"] intValue];
        self.starRating = [dictionary[@"star_rating"] intValue];
        self.streetAddress = dictionary[@"street_address"];
        self.thumbnailURL = [NSURL URLWithString:dictionary[@"thumbnail"]];
        self.totalRate = [dictionary[@"total_rate"] doubleValue];
    }
    return self;
}

- (void)loadImage {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
        NSData *data = [NSData dataWithContentsOfURL:self.thumbnailURL];
        self.thumbnailImage = [[UIImage alloc] initWithData:data];
    });
}

@end
