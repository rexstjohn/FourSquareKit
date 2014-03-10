//
//  UXRFourSquareNetworkingEngine.h
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/16/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//
#import "MKNetworkEngine.h"
#import "UXRFourSquareRestaurantModel.h"
#import <CoreLocation/CoreLocation.h>

// Common response blocks.
typedef void (^UXRFourSquareEngineRestaurantsCompletionBlock)(NSArray *restaurants);
typedef void (^UXRFourSquareEnginePhotosCompletionBlock)(NSArray *photos);
typedef void (^UXRFourSquareEngineRestaurantCompletionBlock)(UXRFourSquareRestaurantModel *restaurant);
typedef void (^UXRFourSquareEngineErrorBlock)(NSError *error);

@interface UXRFourSquareNetworkingEngine : MKNetworkEngine

// Set these on startup.
@property(nonatomic,strong,readonly) NSString *clientId;
@property(nonatomic,strong,readonly) NSString *clientSecret;
@property(nonatomic,strong,readonly) NSString *callBackURL;

// Singleton.
+(UXRFourSquareNetworkingEngine*) sharedInstance;

// Use to bootstrap the engine for first time use.
+(void)registerFourSquareEngineWithClientId:(NSString*)client andSecret:(NSString*)secret andCallBackURL:(NSString*)callback;

// Get  alist of restaurants generically.
- (void)getRestaurantsWithCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                             failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

// Fetch restaurant stubs nearby, you will need to look up full restaurants individually if you want all the details.
- (void)getRestaurantsNearLocation:(CLLocation*)location
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                      failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

// Returns a complex object containing many details about your surrounding area.
- (void)exploreRestaurantsNearLocation:(NSString*)location
                         withQuery:(NSString*)query
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                      failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

// Returns a complex object containing many details about your surrounding area.
- (void)exploreRestaurantsNearLatLong:(CLLocationCoordinate2D)coordinate
                             withQuery:(NSString*)query
                   withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                          failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

// Get a specific restaurant, returns a full restaurant model with lot of data in it.
- (void)getRestaurantWithId:(NSString*)restaurantId withCompletionBlock:(UXRFourSquareEngineRestaurantCompletionBlock)completionBlock
                             failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;

// Featch all photo models associated with a specific restaurant Id.
- (void)getPhotosForRestaurantWithId:(NSString*)restaurantId
                 withCompletionBlock:(UXRFourSquareEnginePhotosCompletionBlock)completionBlock
               failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock;
@end
