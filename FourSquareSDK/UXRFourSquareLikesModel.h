//
//  UXRFourSquareLikesModel.h
//  FourSquare SDK iOS
//
//  Created by Rex St. John on 12/23/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

/*
 "count": 14,
 "groups": [{
 "type": "others",
 "count": 14,
 "items": []
 }],
 "summary": "14 likes"
 */

#import "UXRBaseModel.h"

@interface UXRFourSquareLikesModel : UXRBaseModel
@property(nonatomic,strong) NSNumber *count;
@property(nonatomic,strong) NSString *summary;
@property(nonatomic,strong) NSArray *groups;
@end
