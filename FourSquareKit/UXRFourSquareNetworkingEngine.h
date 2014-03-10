//
//  UXRFourSquareNetworkingEngine.h
//  FourSquareKit iOS iOS
//
//  Created by Rex St. John on 12/16/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//
#import "MKNetworkEngine.h"
#import "UXRFourSquareRestaurantModel.h"
#import <CoreLocation/CoreLocation.h>

typedef void (^UXRFourSquareEngineRestaurantsCompletionBlock)(NSArray *restaurants);
typedef void (^UXRFourSquareEnginePhotosCompletionBlock)(NSArray *photos);
typedef void (^UXRFourSquareEngineRestaurantCompletionBlock)(UXRFourSquareRestaurantModel *restaurant);
typedef void (^UXRFourSquareEngineErrorBlock)(NSError *error);

@interface UXRFourSquareNetworkingEngine : MKNetworkEngine

+(UXRFourSquareNetworkingEngine*) sharedInstance;

- (void)getRestaurantsWithCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                             failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

- (void)getRestaurantsNearLocation:(CLLocation*)location
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                      failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

- (void)exploreRestaurantsNearLocation:(NSString*)location
                         withQuery:(NSString*)query
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                      failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

- (void)exploreRestaurantsNearLatLong:(CLLocationCoordinate2D)coordinate
                             withQuery:(NSString*)query
                   withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                          failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

- (void)getRestaurantWithId:(NSString*)restaurantId withCompletionBlock:(UXRFourSquareEngineRestaurantCompletionBlock)completionBlock
                             failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

- (void)getPhotosForRestaurantWithId:(NSString*)restaurantId
                 withCompletionBlock:(UXRFourSquareEnginePhotosCompletionBlock)completionBlock
               failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;
@end
