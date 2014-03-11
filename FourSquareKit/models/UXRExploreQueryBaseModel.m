//
//  UXRExploreQueryBaseModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRExploreQueryBaseModel.h"
#import "UXRFourSquareExploreResultsModel.h"

@implementation UXRExploreQueryBaseModel

- (void) setGeocode:(id)geocode{
    if (nil == geocode) {
        _geocode = nil;
    }
    else if ([geocode isKindOfClass:[UXRFourSquareGeoCodeModel class]]) {
        _geocode = geocode;
    }
    else if ([geocode isKindOfClass:[NSDictionary class]]) {
        _geocode = [[UXRFourSquareGeoCodeModel alloc] initWithDictionary:geocode];
    }
}

-(void)setGroups:(id)groups{
    if (nil == groups) {
        _groups = nil;
    }
    else if ([groups isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
        NSMutableArray *venuesArray =[[NSMutableArray alloc] init];
        
        for(id group in groups){
            
            NSArray *items = (NSArray*)[group objectForKey:@"items"];
            
            for(id entry in items){
                if([entry isKindOfClass:[NSDictionary class]]){
                    UXRFourSquareExploreResultsModel *result = [[UXRFourSquareExploreResultsModel alloc] initWithDictionary:entry];
                    [resultsArray addObject:result];
                    [venuesArray addObject:result.venue];
                }
            }
        }
        _venues = venuesArray;
        _groups = (NSArray*)resultsArray;
    }
}

@end
