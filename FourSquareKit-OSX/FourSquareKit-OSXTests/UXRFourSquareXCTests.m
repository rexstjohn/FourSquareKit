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


@interface UXRFourSquareXCTests : XCTestCase
@property(atomic, assign) BOOL done;
@end

@implementation UXRFourSquareXCTests

- (void)setUp {
    [super setUp];
    self.done = NO;
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

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

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

    [self waitForCompletion:3];
    if (nil != imageView.image) {
        [downloadImageExpectation fulfill];
    }
    
    // The test will pause here, running the run loop, until the timeout is hit
    // or all expectations are fulfilled.
    [self waitForExpectationsWithTimeout:3 handler:^(NSError *error) {
        XCTAssertNotNil(imageView.image);
    }];
}

@end
