//
//  UXRBaseEngineTests.m
//  FourSquareKit
//
//  Created by Rex St. John on 12/19/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MKNetworkKit.h"
#import "UXRBaseNetworkingEngine.h"
#import "UXRAsyncTesting.h"

@interface UXRBaseEngineTests : XCTestCase
@property(nonatomic,strong) UXRBaseNetworkingEngine *baseEngine;
@end

@implementation UXRBaseEngineTests

- (void)setUp
{
    [super setUp];
    self.baseEngine = [UXRBaseNetworkingEngine sharedInstance];

}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testImageDownloads{
    
    StartBlock();
    NSURL *url = [NSURL URLWithString:@"http://s3-media1.ak.yelpcdn.com/bphoto/fTt0P8feWwxmvJZXujxmSg/ms.jpg"];
    [self.baseEngine imageAtURL:url
                                                     completionHandler:^(UIImage *fetchedImage, NSURL *fetchedURL, BOOL isInCache) {
                                                         XCTAssertNotNil(fetchedImage, @"error must not be nil");
                                                         EndBlock();
                                                     } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                                         XCTAssertNil(error, @"error must not be nil");
                                                         EndBlock();
                                                     }];
    WaitUntilBlockCompletes();
}


@end
