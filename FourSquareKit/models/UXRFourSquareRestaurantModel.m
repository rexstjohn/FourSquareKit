//
//  UXRFourSquareRestaurantModel.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareRestaurantModel.h"
#import "UXRFourSquareCategoryModel.h"
#import "UXRFourSquarePhotoModel.h"
#import <CoreLocation/CoreLocation.h>
#import "UXRFourSquareTipModel.h"

@implementation UXRFourSquareRestaurantModel

- (void) setCategories:(id)categories {
    if (nil == categories) {
        _categories = nil;
    }
    else if ([categories isKindOfClass:[NSArray class]]) {
        NSArray *categoriesArray = (NSArray*)categories;
        NSMutableArray *mutableCategories = [[NSMutableArray alloc] initWithCapacity:categoriesArray.count];
        for(id entry in categoriesArray){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquareCategoryModel *category = [[UXRFourSquareCategoryModel alloc] initWithDictionary:entry];
                [mutableCategories addObject:category];
            }
        }
        _categories = (NSArray*)mutableCategories;
    }
}

- (void) setPhotos:(id)photos {
    if (nil == photos) {
        _photos = nil;
    } else if ([photos isKindOfClass:[NSArray class]]){
        _photos = photos;
    }
    else if ([photos isKindOfClass:[NSDictionary class]]) {
        
        NSArray *photoGroups = (NSArray*)[photos objectForKey:@"groups"];
        NSMutableArray *photosMutableArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *group in photoGroups){
            NSArray *itemPhotos = (NSArray*)[group objectForKey:@"items"];
            for(id itemPhoto in itemPhotos){
                [photosMutableArray addObject:itemPhoto];
            }
        }
        
        NSMutableArray *photosResultsArray = [[NSMutableArray alloc] initWithCapacity:photosMutableArray.count];
        for(id entry in photosMutableArray){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquarePhotoModel *photo = [[UXRFourSquarePhotoModel alloc] initWithDictionary:entry];
                [photosResultsArray addObject:photo];
            }
        }
        _photos = (NSArray*)photosResultsArray;
    }
}

- (void) setTips:(id)tips {
    if (nil == tips) {
        _tips = nil;
    } else if ([tips isKindOfClass:[NSArray class]]){
        _tips = tips;
    }
    else if ([tips isKindOfClass:[NSDictionary class]]) {
        
        NSArray *groups = (NSArray*)[tips objectForKey:@"groups"];
        NSMutableArray *groupsMutableArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *group in groups){
            NSArray *items = (NSArray*)[group objectForKey:@"items"];
            for(id item in items){
                [groupsMutableArray addObject:item];
            }
        }
        
        NSMutableArray *resultsMutableArray = [[NSMutableArray alloc] initWithCapacity:groupsMutableArray.count];
        for(id entry in groupsMutableArray){
            if([entry isKindOfClass:[NSDictionary class]]){
                UXRFourSquareTipModel *tip = [[UXRFourSquareTipModel alloc] initWithDictionary:entry];
                [resultsMutableArray addObject:tip];
            }
        }
        _tips = (NSArray*)resultsMutableArray;
    }
}

- (void) setContact:(id)contact{
    if (nil == contact) {
        _contact = nil;
    }
    else if ([contact isKindOfClass:[UXRFourSquareContactModel class]]) {
        _contact = contact;
    }
    else if ([contact isKindOfClass:[NSDictionary class]]) {
        _contact = [[UXRFourSquareContactModel alloc ] initWithDictionary:contact];
    }
}

- (void) setStats:(id)stats{
    if (nil == stats) {
        _stats = nil;
    }
    else if ([stats isKindOfClass:[UXRFourSquareStatsModel class]]) {
        _stats = stats;
    }
    else if ([stats isKindOfClass:[NSDictionary class]]) {
        _stats = [[UXRFourSquareStatsModel alloc ] initWithDictionary:stats];
    }
}

- (void) setLocation:(id)location {
    if (nil == location) {
        _location = nil;
    }
    else if ([location isKindOfClass:[UXRFourSquareLocationModel class]]) {
        _location = location;
    }
    else if ([location isKindOfClass:[NSDictionary class]]) {
        _location = [[UXRFourSquareLocationModel alloc ] initWithDictionary:location];
    }
}

- (void) setMenu:(id)menu {
    if (nil == menu) {
        _menu = nil;
    }
    else if ([menu isKindOfClass:[UXRFourSquareMenuModel class]]) {
        _menu = menu;
    }
    else if ([menu isKindOfClass:[NSDictionary class]]) {
        _menu = [[UXRFourSquareMenuModel alloc ] initWithDictionary:menu];
    }
}

- (void) setReservations:(id)reservations {
    if (nil == reservations) {
        _reservations = nil;
    }
    else if ([reservations isKindOfClass:[UXRFourSquareReservationsModel class]]) {
        _reservations = reservations;
    }
    else if ([reservations isKindOfClass:[NSDictionary class]]) {
        _reservations = [[UXRFourSquareReservationsModel alloc ] initWithDictionary:reservations];
    }
}

- (void) setHours:(id)hours {
    if (nil == hours) {
        _hours = nil;
    }
    else if ([hours isKindOfClass:[UXRFourSquareHoursModel class]]) {
        _hours = hours;
    }
    else if ([hours isKindOfClass:[NSDictionary class]]) {
        _hours = [[UXRFourSquareHoursModel alloc ] initWithDictionary:hours];
    }
}

- (void) setPrice:(id)price {
    if (nil == price) {
        _price = nil;
    }
    else if ([price isKindOfClass:[UXRFourSquarePriceModel class]]) {
        _price = price;
    }
    else if ([price isKindOfClass:[NSDictionary class]]) {
        _price = [[UXRFourSquarePriceModel alloc ] initWithDictionary:price];
    }
}

- (void) setShortUrl:(id)url {
    if (nil == url) {
        _shortUrl = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _shortUrl = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _shortUrl = [NSURL URLWithString:url];
    }
}

- (void) setUrl:(id)url {
    if (nil == url) {
        _url = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _url = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _url = [NSURL URLWithString:url];
    }
}

- (void) setCanonicalUrl:(id)url {
    if (nil == url) {
        _canonicalUrl = nil;
    }
    else if ([url isKindOfClass:[NSURL class]]) {
        _canonicalUrl = url;
    }
    else if ([url isKindOfClass:[NSString class]]) {
        _canonicalUrl = [NSURL URLWithString:url];
    }
}

-(void)setId:(id)possibleId{
    if (nil == possibleId) {
        _restaurantId = nil;
    }
    else if ([possibleId isKindOfClass:[NSString class]]) {
        _restaurantId = possibleId;
    }
}

@end
