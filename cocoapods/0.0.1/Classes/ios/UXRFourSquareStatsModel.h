//
//  UXRFourSquareStatsModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareStatsModel : UXRBaseModel

@property(nonatomic,strong) NSNumber *usersCount;
@property(nonatomic,strong) NSNumber *checkinsCount;
@property(nonatomic,strong) NSNumber *tipCount;

@end
