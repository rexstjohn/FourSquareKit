//
//  UXRFourSquareCategoryModel.h
//  FourSquareKit iOS iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"
#import "UXRFourSquarePhotoModel.h"

/*
 {
 icon =             {
 prefix = "https://ss1.4sqi.net/img/categories_v2/food/streetfood_";
 suffix = ".png";
 };
 id = 4bf58dd8d48988d1cb941735;
 name = "Food Truck";
 pluralName = "Food Trucks";
 primary = 1;
 shortName = "Food Truck";
 }
 */

@interface UXRFourSquareCategoryModel : UXRBaseModel

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) UXRFourSquarePhotoModel *icon;
@property(nonatomic,strong) NSString *pluralName;
@property(nonatomic,strong) NSNumber *primary;
@property(nonatomic,strong) NSString *shortName;

@end
