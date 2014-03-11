//
//  UXRFourSquareHoursModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareHoursModel : UXRBaseModel
@property(nonatomic,assign) BOOL isOpen;
@property(nonatomic,strong) NSString *status;
@property(nonatomic,strong) NSArray *timeframes;
@end
