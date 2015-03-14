//
//  UXRFourSquareXCTests.m
//  FourSquareKit-OSX
//
//  Created by JASON CROSS on 3/7/15.
//  Copyright (c) 2015 UX RX. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "NSImageView+MKNetworkKitAdditions.h"
#import "UXRBaseNetworkingEngine.h"
#import "UXRFourSquareNetworkingEngine.h"
#import "UXRFourSquareRestaurantModel.h"
#import "UXRFourSquareRestaurantModel+Validations.h"
#import "CLLocation+Testing.h"
#import "UXRFourSquarePhotoModel.h"
#import "UXRFourSquarePhotoModel+Validation.h"


@interface UXRFourSquareXCTests : XCTestCase
@property(atomic, assign) BOOL done;
@property(nonatomic,strong) UXRFourSquareNetworkingEngine *fourSquareEngine;
@end

@implementation UXRFourSquareXCTests

- (void)setUp {
    [super setUp];
    self.done = NO;
    
#warning YOU MUST INPUT YOUR DETAILS HERE IN ORDER TO RUN THESE TESTS!!!!!
    NSString *yourClientId = @"";
    NSString *yourClientSecret = @"";
    NSString *yourCallbackURl = @""; //yourapp://foursquare
    
    [UXRFourSquareNetworkingEngine registerFourSquareEngineWithClientId:yourClientId andSecret:yourClientSecret andCallBackURL:yourCallbackURl];
    self.fourSquareEngine = [UXRFourSquareNetworkingEngine sharedInstance];
    
}

- (void)tearDown {
    self.done = YES;
    [super tearDown];
}

- (BOOL)waitForCompletion:(NSTimeInterval)timeoutSecs {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    
    do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
        if ([timeoutDate timeIntervalSinceNow] < 0.0) {
            break;
        }
    } while (!self.done);
    
    return self.done;
}

#pragma mark - tests

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testImageSubstitution {
    NSView * containingView = [[NSView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    NSImageView * imageView = [[NSImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [containingView addSubview:imageView];
    
    UXRBaseNetworkingEngine * networkEngine = [UXRBaseNetworkingEngine sharedInstance];
    [NSImageView setDefaultEngine:networkEngine];
    NSURL * url = [[NSURL alloc]initWithString:@"http://www.google.com/images/srpr/logo11w.png"];
    
    XCTestExpectation *downloadImageExpectation = [self expectationWithDescription:@"image downloaded"];
    
    [imageView setImageFromURL:url
              placeHolderImage:nil
                   usingEngine:networkEngine
                     animation:YES];
    
    [self waitForCompletion:2];
    if (nil != imageView.image) {
        [downloadImageExpectation fulfill];
    }
    
    // The test will pause here, running the run loop, until the timeout is hit
    // or all expectations are fulfilled.
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) {
        XCTAssertNotNil(imageView.image);
    }];
}

- (void) testRestaurantsQueryOSX {
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine getRestaurantsWithCompletionBlock:^(NSArray *restaurants) {
        XCTAssert(restaurants.count != 0, @"Results should not be empty");
        restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
        [restaurantsQueryExpectation fulfill];
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
    }];
    
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testRestaurantsNearLocationQuery
{
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    CLLocation *location = [[CLLocation alloc]initWithLatitude:40.7 longitude:-74];
    [self.fourSquareEngine getRestaurantsNearLocation:location withCompletionBlock:^(NSArray *restaurants) {
        XCTAssert(restaurants.count != 0, @"Results should not be empty");
        restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
        [restaurantsQueryExpectation fulfill];
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
    }];
    
    [self waitForExpectationsWithTimeout:6 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testExploreRestaurantsNearLocationWithQuery
{
    
    NSString *locationString = @"Seattle";
    NSString *query = @"tacos";
    
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine exploreRestaurantsNearLocation:locationString
                                                withQuery:query
                                      withCompletionBlock:^(NSArray *restaurants) {
                                          XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                          restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                          [restaurantsQueryExpectation fulfill];
                                      } failureBlock:^(NSError *error) {
                                          XCTAssertNil(error, @"Error should be nil");
                                      }];
    
    [self waitForExpectationsWithTimeout:6 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testExploreRestaurantsNearLocationWithNilQuery
{
    NSString *locationString = @"Seattle";
    NSString *query = @"";
    
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine exploreRestaurantsNearLocation:locationString
                                                withQuery:query
                                      withCompletionBlock:^(NSArray *restaurants) {
                                          XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                          restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                          [restaurantsQueryExpectation fulfill];
                                      } failureBlock:^(NSError *error) {
                                          XCTAssertNil(error, @"Error should be nil");
                                      }];
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testExploreRestaurantsNearLatLonWithQuery
{
    NSString *query = @"pizza";
    CLLocationCoordinate2D coordinate = [CLLocation locationInBoston].coordinate;
    
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine exploreRestaurantsNearLatLong:coordinate withQuery:query
                                     withCompletionBlock:^(NSArray *restaurants) {
                                         XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                         restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                         [restaurantsQueryExpectation fulfill];
                                     } failureBlock:^(NSError *error) {
                                         XCTAssertNil(error, @"Error should be nil");
                                     }];
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testExploreRestaurantsNearLatLonWithNilQuery
{
    NSString *query = @"";
    CLLocationCoordinate2D coordinate = [CLLocation locationInBoston].coordinate;
    
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine exploreRestaurantsNearLatLong:coordinate withQuery:query
                                     withCompletionBlock:^(NSArray *restaurants) {
                                         XCTAssert(restaurants.count != 0, @"Results should not be empty");
                                         restaurantModel = (UXRFourSquareRestaurantModel *)restaurants[0];
                                         [restaurantsQueryExpectation fulfill];
                                     } failureBlock:^(NSError *error) {
                                         XCTAssertNil(error, @"Error should be nil");
                                     }];
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
    }];
}

- (void)testRestaurantQuery
{
    XCTestExpectation *restaurantsQueryExpectation = [self expectationWithDescription:@"restaurants downloaded"];
    
    __block UXRFourSquareRestaurantModel *restaurantModel;
    
    [self.fourSquareEngine getRestaurantWithId:@"49efb3d1f964a520f7681fe3" withCompletionBlock:^(UXRFourSquareRestaurantModel *restaurant) {
        restaurantModel = restaurant;
        [restaurantsQueryExpectation fulfill];
    } failureBlock:^(NSError *error) {
        XCTAssertNil(error, @"Error should be nil");
    }];
    
    [self waitForExpectationsWithTimeout:6 handler:^(NSError *error) {
        BOOL isValid = [restaurantModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        XCTAssert(restaurantModel.photos.count != 0, @"No photos were returned");
        XCTAssert(restaurantModel.tips.count != 0, @"No tips were returned");
    }];
}

- (void) testPhotosQuery{
    
    XCTestExpectation *photosQueryExpectation = [self expectationWithDescription:@"photos downloaded"];
    
    __block UXRFourSquarePhotoModel *photoModel;
    
    [self.fourSquareEngine getPhotosForRestaurantWithId:@"4fc7c071e4b06e4ecff8e93d"
                                    withCompletionBlock:^(NSArray *photos) {
                                        XCTAssert(photos.count != 0, @"Results should not be empty");
                                        photoModel = (UXRFourSquarePhotoModel *)photos[0];
                                        [photosQueryExpectation fulfill];
                                    } failureBlock:^(NSError *error) {
                                        XCTAssertNil(error, @"Error should be nil");
                                    }];
    
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        BOOL isValid = [photoModel isValid];
        XCTAssertEqual(isValid, YES, @"Model was not valid");
        
    }];
}

@end
