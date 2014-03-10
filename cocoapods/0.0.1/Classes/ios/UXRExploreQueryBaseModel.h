//
//  UXRExploreQueryBaseModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
#import "UXRFourSquareGeoCodeModel.h"

@interface UXRExploreQueryBaseModel : UXRBaseModel
@property(nonatomic,strong) UXRFourSquareGeoCodeModel *geocode;
@property(nonatomic,strong) NSString *headerLocation;
@property(nonatomic,strong) NSString *headerFullLocation;
@property(nonatomic,strong) NSString *headerLocationGranularity;
@property(nonatomic,strong) NSString *query;
@property(nonatomic,strong) NSNumber *totalResults;
@property(nonatomic,strong) NSArray *groups;
@property(nonatomic,strong) NSArray *venues;
@end
