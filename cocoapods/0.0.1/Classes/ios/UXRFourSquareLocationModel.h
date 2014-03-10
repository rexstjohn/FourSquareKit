//
//  UXRFourSquareLocationModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

@interface UXRFourSquareLocationModel : UXRBaseModel
@property(nonatomic,strong) NSString *address;
@property(nonatomic,strong) NSString *cc;
@property(nonatomic,strong) NSString *city;
@property(nonatomic,strong) NSString *country;
@property(nonatomic,strong) NSString *crossStreet;
@property(nonatomic,strong) NSNumber *lat;
@property(nonatomic,strong) NSNumber *lng;
@property(nonatomic,strong) NSNumber *postalCode;
@property(nonatomic,strong) NSString *state;
@end
