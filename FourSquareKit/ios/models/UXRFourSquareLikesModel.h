//
//  UXRFourSquareLikesModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareLikesModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *count;
@property(nonatomic,strong) NSString *summary;
@property(nonatomic,strong) NSArray *groups;
@end
