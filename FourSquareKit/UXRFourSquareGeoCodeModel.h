//
//  UXRGeoCodeModel.h
//  FourSquareKit iOS iOS
//
//  Created by Rex St. John on 12/26/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

/*
 geocode =      {
 cc = US;
 center =         {
 lat = "47.60621";
 lng = "-122.33207";
 }         ;
 displayString = "Seattle,
 WA,
 United States";
 geometry =         {
 bounds =            {
 ne =               {
 lat = "47.68850362252604";
 lng = "-122.2263336181641";
 }               ;
 sw =               {
 lat = "47.52879289154999";
 lng = "-122.4508666992188";
 }               ;
 }            ;
 }         ;
 longId = 72057594043737780;
 slug = "seattle-washington";
 what = "";
 where = seattle;
 }      ;
 */

@interface UXRFourSquareGeoCodeModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *longId;
@property(nonatomic,strong) NSString *displayString;
@property(nonatomic,strong) NSString *slug;
@property(nonatomic,strong) NSString *cc;
@property(nonatomic,strong) NSString *what;
@property(nonatomic,strong) NSString *where;
@end
