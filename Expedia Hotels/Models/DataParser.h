//
//  DataParser.h
//  Expedia Hotels
//
//  Created by Brian Peterman on 3/15/16.
//  Copyright © 2016 Expedia Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataParser : NSObject

@property (nonatomic, strong) NSArray *hotels;
+ (id)sharedManager;

@end
