//
//  DataParser.m
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/15/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import "DataParser.h"
#import "HotelDataModel.h"

@implementation DataParser

+ (id)sharedManager {
    static DataParser *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init {
    if (self = [super init]) {
        NSDictionary *dictionary = [self createDictionaryFromJson];
        [self fillHotelDataModels:dictionary];
    }
    return self;
}

- (NSDictionary *)createDictionaryFromJson {
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels"
                                                         ofType:@"json"];
    NSData *dataFromFile = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:dataFromFile
                                                         options:kNilOptions
                                                           error:&error];
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        return nil;
    }
    return data;
}

- (void)fillHotelDataModels:(NSDictionary *)dictionary {
    NSArray *hotelsJson = dictionary[@"hotels"];
    NSMutableArray *hotelsArray = [NSMutableArray new];
    [hotelsJson enumerateObjectsUsingBlock:^(NSDictionary *hotel, NSUInteger idx, BOOL * _Nonnull stop) {
        HotelDataModel *dataModel = [[HotelDataModel alloc] initWithDictionary:hotel];
        [hotelsArray addObject:dataModel];
    }];
    self.hotels = hotelsArray;
}

@end
