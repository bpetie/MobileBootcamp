//
//  HotelDataModel.h
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/15/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelDataModel : NSObject

@property (nonatomic, strong) NSString *direction;
@property (nonatomic) double distance;
@property (nonatomic, strong) NSString *key;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) int masterID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) double nightlyRate;
@property (nonatomic) int reviewScore;
@property (nonatomic) int starRating;
@property (nonatomic, strong) NSString *streetAddress;
@property (nonatomic, strong) NSURL *thumbnailURL;
@property (nonatomic) double totalRate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
