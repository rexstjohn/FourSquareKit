//
//  UXRFourSquareReasonsModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareExploreResultsModel.h"
#import "UXRFourSquareTipModel.h"
#import "UXRFourSquareRestaurantModel.h"

@implementation UXRFourSquareExploreResultsModel

- (void) setTips:(id)tips {
    if (nil == tips) {
        _tips = nil;
    } else if ([tips isKindOfClass:[NSArray class]]){
        NSMutableArray *resultsMutableArray = [[NSMutableArray alloc] initWithCapacity:((NSArray*)tips).count];
        for(id entry in tips){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquareTipModel *tip = [[UXRFourSquareTipModel alloc] initWithDictionary:entry];
                [resultsMutableArray addObject:tip];
            }
        }
        _tips = (NSArray*)resultsMutableArray;
    }
}

- (void) setVenue:(id)venue{
    if (nil == venue) {
        _venue = nil;
    }
    else if ([venue isKindOfClass:[UXRFourSquareContactModel class]]) {
        _venue = venue;
    }
    else if ([venue isKindOfClass:[NSDictionary class]]) {
        _venue = [[UXRFourSquareRestaurantModel alloc ] initWithDictionary:venue];
    }
}

@end
