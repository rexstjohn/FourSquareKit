//
//  UXRGeoCodeModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareGeoCodeModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *longId;
@property(nonatomic,strong) NSString *displayString;
@property(nonatomic,strong) NSString *slug;
@property(nonatomic,strong) NSString *cc;
@property(nonatomic,strong) NSString *what;
@property(nonatomic,strong) NSString *where;
@end
