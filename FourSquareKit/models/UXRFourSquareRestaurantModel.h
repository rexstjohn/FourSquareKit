//
//  UXRFourSquareRestaurantModel.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

#import "UXRFourSquareLocationModel.h"
#import "UXRFourSquareStatsModel.h"
#import "UXRFourSquareHoursModel.h"
#import "UXRFourSquarePriceModel.h"
#import "UXRFourSquareMenuModel.h"
#import "UXRFourSquareReservationsModel.h"
#import "UXRFourSquareContactModel.h"

@interface UXRFourSquareRestaurantModel : UXRBaseModel
@property(nonatomic,strong) NSArray *categories;
@property(nonatomic,strong) NSArray *photos;
@property(nonatomic,strong) UXRFourSquareLocationModel *location;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *description;
@property(nonatomic,strong) NSString *timeZone;
@property(nonatomic,strong) NSNumber *dislike;
@property(nonatomic,strong) NSNumber *rating;
@property(nonatomic,strong) NSArray *specials;
@property(nonatomic,strong) NSArray *tips;
@property(nonatomic,strong) UXRFourSquareStatsModel *stats;
@property(nonatomic,strong) NSURL *url;
@property(nonatomic,strong) NSURL *canonicalUrl;
@property(nonatomic,strong) NSURL *shortUrl;
@property(nonatomic,strong) UXRFourSquareHoursModel *hours;
@property(nonatomic,strong) UXRFourSquareMenuModel *menu;
@property(nonatomic,assign) BOOL verified;
@property(nonatomic,assign) BOOL restricted;
@property(nonatomic,strong) UXRFourSquarePriceModel* price;
@property(nonatomic,strong) UXRFourSquareReservationsModel* reservations;
@property(nonatomic,strong) UXRFourSquareContactModel *contact;
@property(nonatomic,strong) NSString *restaurantId;
@end
