//
//  UXRFourSquareTests.m
//  FourSquareKit
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UXRFourSquareNetworkingEngine.h"
#import "UXRAsyncTesting.h"
#import "UXRFourSquareRestaurantModel.h"
#import "UXRFourSquarePhotoModel.h"
#import "CLLocation+Testing.h"
#import "UXRFourSquareRestaurantModel+Validations.h"
#import "UXRFourSquarePhotoModel+Validation.h"

@interface UXRFourSquareTests : XCTestCase
@property(nonatomic,strong) UXRFourSquareNetworkingEngine *fourSquareEngine;
@end

@implementation UXRFourSquareTests

- (void)setUp
{
    [super setUp];
    
#warning YOU MUST INPUT YOUR DETAILS HERE IN ORDER TO RUN THESE TESTS!!!!!
    NSString *yourClientId = @"";
    NSString *yourClientSecret = @"";
    NSString *yourCallbackURl = @""; //yourapp://foursquare
    
    [UXRFourSquareNetworkingEngine registerFourSquareEngineWithClientId:yourClientId andSecret:yourClientSecret andCallBackURL:yourCallbackURl];
    self.fourSquareEngine = [UXRFourSquareNetworkingEngine sharedInstance];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testRestaurantsQuery
{
    StartBlock();
    
    [self.fourSquareEngine getRestaurantsWithCompletionBlock:^(NSArray *restaurants) {
        XCTAssert(restaurants.count != 0, @"Results should not be empty");
        UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        EndBlock();
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
        EndBlock();
    }];
    WaitUntilBlockCompletes();
}

- (void)testRestaurantsNearLocationQuery
{
    StartBlock();
    CLLocation *location = [CLLocation locationInSeattle];
    [self.fourSquareEngine getRestaurantsNearLocation:location withCompletionBlock:^(NSArray *restaurants) {
        XCTAssert(restaurants.count != 0, @"Results should not be empty");
        UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        EndBlock();
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
        EndBlock();
    }];
    WaitUntilBlockCompletes();
}

- (void)testExploreRestaurantsNearLocationWithQuery
{
    // 
  StartBlock();
  NSString *locationString = @"Seattle";
  NSString *query = @"tacos";
  [self.fourSquareEngine exploreRestaurantsNearLocation:locationString
                                              withQuery:query
                                    withCompletionBlock:^(NSArray *restaurants) {
      XCTAssert(restaurants.count != 0, @"Results should not be empty");
      UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
      BOOL isValid = [restaurantModel isValid];
      XCTAssertEqual(isValid, YES, @"Model was not valid");
      EndBlock();
  } failureBlock:^(NSError *error) {
      XCTAssertNil(error, @"Error should be nil");
      EndBlock();
  }];
  WaitUntilBlockCompletes();
}

- (void)testExploreRestaurantsNearLocationWithNilQuery
{
    //
    StartBlock();
    NSString *locationString = @"Seattle";
    NSString *query = @"";
    [self.fourSquareEngine exploreRestaurantsNearLocation:locationString
                                                withQuery:query
                                      withCompletionBlock:^(NSArray *restaurants) {
                                          XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                          UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                          BOOL isValid = [restaurantModel isValid];
                                          XCTAssertEqual(isValid, YES, @"Model was not valid");
                                          EndBlock();
                                      } failureBlock:^(NSError *error) {
                                          XCTAssertNil(error, @"Error should be nil");
                                          EndBlock();
                                      }];
    WaitUntilBlockCompletes();
}

- (void)testExploreRestaurantsNearLatLonWithQuery
{
    //
    StartBlock();
    NSString *query = @"pizza";
    CLLocationCoordinate2D coordinate = [CLLocation locationInBoston].coordinate;
    [self.fourSquareEngine exploreRestaurantsNearLatLong:coordinate withQuery:query
                                      withCompletionBlock:^(NSArray *restaurants) {
                                          XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                          UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                          BOOL isValid = [restaurantModel isValid];
                                          XCTAssertEqual(isValid, YES, @"Model was not valid");
                                          EndBlock();
                                      } failureBlock:^(NSError *error) {
                                          XCTAssertNil(error, @"Error should be nil");
                                          EndBlock();
                                      }];
    WaitUntilBlockCompletes();
}

- (void)testExploreRestaurantsNearLatLonWithNilQuery
{
    //
    StartBlock();
    NSString *query = @"";
    CLLocationCoordinate2D coordinate = [CLLocation locationInBoston].coordinate;
    [self.fourSquareEngine exploreRestaurantsNearLatLong:coordinate withQuery:query
                                     withCompletionBlock:^(NSArray *restaurants) {
                                         XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                         UXRFourSquareRestaurantModel *restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                         BOOL isValid = [restaurantModel isValid];
                                         XCTAssertEqual(isValid, YES, @"Model was not valid");
                                         EndBlock();
                                     } failureBlock:^(NSError *error) {
                                         XCTAssertNil(error, @"Error should be nil");
                                         EndBlock();
                                     }];
    WaitUntilBlockCompletes();
}

- (void)testRestaurantQuery
{
    StartBlock();
    [self.fourSquareEngine getRestaurantWithId:@"49efb3d1f964a520f7681fe3" withCompletionBlock:^(UXRFourSquareRestaurantModel *restaurant) {
        BOOL isValid = [restaurant isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        XCTAssert(restaurant.photos.count != 0, @"No photos were returned");
        XCTAssert(restaurant.tips.count != 0, @"No tips were returned");
        EndBlock();
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
        EndBlock();
    }];
    WaitUntilBlockCompletes();
}

- (void) testPhotosQuery{
    
    StartBlock();
    
    [self.fourSquareEngine getPhotosForRestaurantWithId:@"4fc7c071e4b06e4ecff8e93d"
                                    withCompletionBlock:^(NSArray *photos) {
        XCTAssert(photos.count != 0, @"Results should not be empty");
        UXRFourSquarePhotoModel *photoModel = (UXRFourSquarePhotoModel *)photos[0];
        BOOL isValid = [photoModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        EndBlock();
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
        EndBlock();
    }];
    WaitUntilBlockCompletes();
}
@end