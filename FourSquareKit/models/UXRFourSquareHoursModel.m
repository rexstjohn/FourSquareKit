//
//  UXRFourSquareHoursModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareHoursModel.h"
#import "UXRFourSquareTimeFramesModel.h"

@implementation UXRFourSquareHoursModel

- (void) setTimeframes:(id)timeframes {
    if (nil == timeframes) {
        _timeframes = nil;
    }
    else if ([timeframes isKindOfClass:[NSArray class]]) {
        NSArray *categoriesArray = (NSArray*)timeframes;
        NSMutableArray *mutableCategories = [[NSMutableArray alloc] initWithCapacity:categoriesArray.count];
        for(id entry in categoriesArray){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquareTimeFramesModel *category = [[UXRFourSquareTimeFramesModel alloc] initWithDictionary:entry];
                [mutableCategories addObject:category];
            }
        }
        _timeframes = (NSArray*)mutableCategories;
    }
}

@end
