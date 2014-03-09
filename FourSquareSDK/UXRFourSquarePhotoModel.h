//
//  UXRFourSquarePhotoModel.h
//  FourSquare SDK iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
/*
 {
 containsFace = 0;
 createdAt = 1372877684;
 demoted = 0;
 height = 720;
 id = 51d47374498ec834f01a212c;
 prefix = "https://irs3.4sqi.net/img/general/";
 source =                                 {
 name = "foursquare for iPhone";
 url = "https://foursquare.com/download/#/iphone";
 };
 suffix = "/13122781_O_woNafpXdSNNhieXRy7SOoWnfRkM2p73mAMwQ9W17s.jpg";
 user =                                 {
 firstName = Nicholas;
 gender = male;
 id = 13122781;
 lastName = "Z.";
 photo =                                     {
 prefix = "https://irs0.4sqi.net/img/user/";
 suffix = "/PPBJPFXZ2XO04W2Y.jpg";
 };
 };
 visibility = public;
 width = 960;
 }
 */
@class UXRFourSquareUserModel;

@interface UXRFourSquarePhotoModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *createdAt;
@property(nonatomic,strong) NSNumber *height;
@property(nonatomic,strong) NSNumber *width;
@property(nonatomic,strong) NSURL *prefix;
@property(nonatomic,assign) BOOL containsFace;
@property(nonatomic,strong) NSString *suffix;
@property(nonatomic,strong) UXRFourSquareUserModel *user;
@property(nonatomic,strong) NSString *visibility;
-(NSURL*)fullPhotoURL;
@end
