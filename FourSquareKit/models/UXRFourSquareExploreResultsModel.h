//
//  UXRFourSquareReasonsModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
#import "UXRFourSquareRestaurantModel.h"

@interface UXRFourSquareExploreResultsModel : UXRBaseModel
@property(nonatomic,strong) NSArray *tips;
@property(nonatomic,strong) NSArray *reasons;
@property(nonatomic,strong) NSString *referralId;
@property(nonatomic,strong) UXRFourSquareRestaurantModel *venue;
@end
