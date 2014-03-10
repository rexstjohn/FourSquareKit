//
//  UXRFourSquareLocationModel.h
//  FourSquareKit iOS iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

/*
 
 location =     {
 address = "428 11th St";
 cc = US;
 city = "San Francisco";
 country = "United States";
 crossStreet = "at Division";
 lat = "37.76979245689496";
 lng = "-122.4119037618544";
 postalCode = 94103;
 state = CA;
 };
 */

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
