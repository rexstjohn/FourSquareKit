//
//  UXRFourSquareNetworkingEngine.m
//  FourSquareKit iOS
//
//  Created by Rex St. John on 12/16/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRFourSquareNetworkingEngine.h"
#import "UXRFourSquarePhotoModel.h"
#import "UXRFourSquareExploreResultsModel.h"
#import "UXRExploreQueryBaseModel.h"
#import <CoreLocation/CoreLocation.h>

// Static paths.
static const NSString* FOURSQUARE_HOSTNAME = @"api.foursquare.com";
static const NSString* FOURSQUARE_API = @"v2";
static const NSString* FOURSQUARE_SEARCH_PATH = @"venues/search";
static const NSString* FOURSQUARE_EXPLORE_PATH = @"venues/explore";
static const NSString* FOURSQUARE_VENUE_PATH = @"venue";
static const NSString* FOURSQUARE_VENUES_PATH = @"venues";
static const NSString* FOURSQUARE_VENUE_PHOTOS_PATH = @"photos";
static const NSInteger DEFAULT_RANGE_METERS = 800;
static const NSString* DEFAULT_SECTION = @"food";

@interface UXRFourSquareNetworkingEngine()
@property(nonatomic,strong,readwrite) NSString *clientId;
@property(nonatomic,strong,readwrite) NSString *clientSecret;
@property(nonatomic,strong,readwrite) NSString *callBackURL;
@end

@implementation UXRFourSquareNetworkingEngine

#pragma mark - Initialization

- (id) init {
    static BOOL alreadyInitialized = NO;
    if (alreadyInitialized) {
        return self;
    }
    alreadyInitialized = YES;
    
    self = [super initWithHostName:[FOURSQUARE_HOSTNAME copy] apiPath:[FOURSQUARE_API copy] customHeaderFields:nil];
    [self useCache];
    
    if (self) {
    }
    return self;
}

+(UXRFourSquareNetworkingEngine*) sharedInstance; {
    static dispatch_once_t onceQueue;
    static UXRFourSquareNetworkingEngine* _sharedInstance;
    dispatch_once(&onceQueue, ^{ _sharedInstance = [[self alloc] init]; });
    return _sharedInstance;
}

+(void)registerFourSquareEngineWithClientId:(NSString*)client
                                  andSecret:(NSString*)secret
                             andCallBackURL:(NSString*)callback{
    // Some basic validation.
    if(client.length < 48 || [client isEqualToString:@""] == YES){
        [NSException raise:@"Invalid FourSquare Client Id" format:@""];
    }
    if(secret.length < 48 || [secret isEqualToString:@""] == YES){
        [NSException raise:@"Invalid FourSquare secret" format:@""];
    }
    if([callback isEqualToString:@""] == YES){
        [NSException raise:@"Invalid FourSquare secret" format:@""];
    }
    
    UXRFourSquareNetworkingEngine *instance = UXRFourSquareNetworkingEngine.sharedInstance;
    instance.clientSecret = secret;
    instance.clientId = client;
    instance.callBackURL = callback;
}

#pragma mark - Rendering models

-(NSArray*)renderJSONToFourSquareRestaurantModels:(NSArray*)models{
    
    NSMutableArray *restaurantModels = [[NSMutableArray alloc] initWithCapacity:models.count];
    
    for(NSDictionary *business in models){
        UXRFourSquareRestaurantModel *restaurantModel = [[UXRFourSquareRestaurantModel alloc] initWithDictionary:business];
        [restaurantModels addObject:restaurantModel];
    }
    
    return (NSArray*)restaurantModels;
}

-(NSArray*)renderJSONToFourSquarePhotoModels:(NSArray*)models{
    
    NSMutableArray *photoModels = [[NSMutableArray alloc] initWithCapacity:models.count];
    
    for(NSDictionary *photo in models){
        UXRFourSquarePhotoModel *photoModel = [[UXRFourSquarePhotoModel alloc] initWithDictionary:photo];
        [photoModels addObject:photoModel];
    }
    
    return (NSArray*)photoModels;
}

#pragma mark - Private Methods.

- (NSDictionary*)dictionaryWithAuthFromDictionary:(NSDictionary*)dictionary{
    //https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMDD"];
    NSDate *now = [NSDate date];
    NSString *stringFromDate = [formatter stringFromDate:now];
    NSMutableDictionary *authDict = [NSMutableDictionary dictionaryWithDictionary: @{@"client_id":self.clientId, @"client_secret":self.clientSecret, @"v":stringFromDate}];
    [authDict addEntriesFromDictionary:dictionary];
    return [NSDictionary dictionaryWithDictionary:authDict];
}

#pragma mark - Public Methods

- (void)getRestaurantsWithCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                             failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock
{
    [self checkRegistration];
    // Fill the post body with the tweet
    NSMutableDictionary *postParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"restaurants", @"query",
                                       @"San Francisco", @"near",
                                       nil];
    
    MKNetworkOperation *op = [self operationWithPath:[FOURSQUARE_SEARCH_PATH copy]
                                              params:[self dictionaryWithAuthFromDictionary:postParams]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary *response = [json objectForKey:@"response"];
        NSArray* businesses = [response objectForKey:@"venues"];
        NSArray* models =[self renderJSONToFourSquareRestaurantModels:businesses];
        completionBlock(models);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getRestaurantsNearLocation:(CLLocation*)location
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                      failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock{
    [self checkRegistration];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSString *latLonString = [NSString stringWithFormat:@"%f,%f",coordinate.latitude,coordinate.longitude];
    NSNumber *rangeMeters = [NSNumber numberWithInt:DEFAULT_RANGE_METERS];
    
    // Fill the post body with the tweet
    //https://developer.foursquare.com/docs/venues/explore
    NSMutableDictionary *postParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"restaurants", @"query",
                                       latLonString, @"ll",
                                       [rangeMeters stringValue],@"radius",
                                       nil];
    
    MKNetworkOperation *op = [self operationWithPath:[FOURSQUARE_SEARCH_PATH copy]
                                              params:[self dictionaryWithAuthFromDictionary:postParams]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary *response = [json objectForKey:@"response"];
        NSArray* businesses = [response objectForKey:@"venues"];
        NSArray* models =[self renderJSONToFourSquareRestaurantModels:businesses];
        completionBlock(models);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)exploreRestaurantsNearLocation:(NSString*)location
                         withQuery:(NSString*)query
               withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                          failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock{
    [self checkRegistration];
    
    NSNumber *rangeMeters = [NSNumber numberWithInt:DEFAULT_RANGE_METERS];
    // Section needs to be nil or it will override any incoming query.
    NSString *section = (query==nil || [query isEqualToString:@""] == YES)?[DEFAULT_SECTION copy]:@"";
    
    // Fill the post body with the tweet
    //https://developer.foursquare.com/docs/venues/explore
    NSMutableDictionary *postParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       section, @"section",
                                       query, @"query",
                                       location, @"near",
                                       @"1", @"sortByDistance",
                                       @"1", @"venuePhotos",
                                       [rangeMeters stringValue],@"radius",
                                       nil];
    
    MKNetworkOperation *op = [self operationWithPath:[FOURSQUARE_EXPLORE_PATH copy]
                                              params:[self dictionaryWithAuthFromDictionary:postParams ]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary *response = [json objectForKey:@"response"];
        UXRExploreQueryBaseModel* result =[[UXRExploreQueryBaseModel alloc] initWithDictionary:response];
        completionBlock(result.venues);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}


- (void)exploreRestaurantsNearLatLong:(CLLocationCoordinate2D)coordinate
                            withQuery:(NSString*)query
                  withCompletionBlock:(UXRFourSquareEngineRestaurantsCompletionBlock)completionBlock
                         failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock{
    [self checkRegistration];
    
    NSNumber *rangeMeters = [NSNumber numberWithInt:DEFAULT_RANGE_METERS];
    NSString *latLonString = [NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude];
    
    // Section needs to be nil or it will override any incoming query.
    NSString *section = (query==nil || [query isEqualToString:@""] == YES)?[DEFAULT_SECTION copy]:@"";
    
    // Fill the post body with the tweet
    //https://developer.foursquare.com/docs/venues/explore
    NSMutableDictionary *postParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       section, @"section",
                                       query, @"query",
                                       latLonString, @"ll",
                                       @"1", @"sortByDistance",
                                       @"1", @"venuePhotos",
                                       [rangeMeters stringValue],@"radius",
                                       nil];
    
    MKNetworkOperation *op = [self operationWithPath:[FOURSQUARE_EXPLORE_PATH copy]
                                              params:[self dictionaryWithAuthFromDictionary:postParams ]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary *response = [json objectForKey:@"response"];
        UXRExploreQueryBaseModel* result =[[UXRExploreQueryBaseModel alloc] initWithDictionary:response];
        completionBlock(result.venues);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getRestaurantWithId:(NSString*)restaurantId
        withCompletionBlock:(UXRFourSquareEngineRestaurantCompletionBlock)completionBlock
               failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock{
    [self checkRegistration];
    
    // Fill the post body with the tweet
    NSString *venuePath = [NSString stringWithFormat:@"%@/%@",[FOURSQUARE_VENUES_PATH copy],restaurantId];
    
    MKNetworkOperation *op = [self operationWithPath:venuePath
                                              params:[self dictionaryWithAuthFromDictionary:nil]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary *response = [json objectForKey:@"response"];
        NSDictionary *venue = [response objectForKey:@"venue"];
        UXRFourSquareRestaurantModel *restuarant = [[UXRFourSquareRestaurantModel alloc] initWithDictionary:venue];
        completionBlock(restuarant);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

- (void)getPhotosForRestaurantWithId:(NSString*)restaurantId
                 withCompletionBlock:(UXRFourSquareEnginePhotosCompletionBlock)completionBlock
                        failureBlock:(UXRFourSquareEngineErrorBlock)errorBlock{
    [self checkRegistration];
    // Fill the post body with the tweet
    NSString *venuePath = [NSString stringWithFormat:@"%@/%@/%@",[FOURSQUARE_VENUES_PATH copy],restaurantId, [FOURSQUARE_VENUE_PHOTOS_PATH copy]];
    
    MKNetworkOperation *op = [self operationWithPath:venuePath
                                              params:[self dictionaryWithAuthFromDictionary:nil]
                                          httpMethod:@"GET"
                                                 ssl:YES];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSError* error = nil;
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:[completedOperation responseData]
                              options:kNilOptions
                              error:&error];
        if(error != nil){
            errorBlock(error);
        }
        
        NSDictionary* response = [json objectForKey:@"response"];
        NSDictionary* photos = [response objectForKey:@"photos"];
        NSArray *models = [self renderJSONToFourSquarePhotoModels:[photos objectForKey:@"items"]];
        completionBlock(models);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
}

#pragma mark - Verify registration status

-(void)checkRegistration{
    BOOL isRegistered = NO;
    isRegistered = self.clientId != nil;
    isRegistered = self.clientSecret != nil;
    isRegistered = self.callBackURL != nil;
    if(isRegistered == NO){
        [NSException raise:@"FourSquare Client Not Registered, use registerFourSquareEngineWithClientId" format:@""];
    }
}
@end