//
//  UXRFourSquareTimeFramesModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareTimeFramesModel.h"
#import "UXRFourSquareOpenTime.h"

@implementation UXRFourSquareTimeFramesModel

- (void) setOpen:(id)open{
    if (nil == open) {
        _open = nil;
    }
    else if ([open isKindOfClass:[NSArray class]]) {
        NSArray *resultsArray = (NSArray*)open;
        NSMutableArray *mutableOpens = [[NSMutableArray alloc] initWithCapacity:resultsArray.count];
        for(id entry in resultsArray){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquareOpenTime *opentime = [[UXRFourSquareOpenTime alloc] initWithDictionary:entry];
                [mutableOpens addObject:opentime];
            }
        }
        _open = (NSArray*)mutableOpens;
    }
}

@end
