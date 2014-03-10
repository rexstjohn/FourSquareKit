//
//  UXRFourSquareHoursModel.h
//  FourSquareKit iOS iOS
//
//  Created by Rex St. John on 12/20/13.
//  Copyright (c) 2013 UX-RX. All rights reserved.
//

#import "UXRBaseModel.h"

/*
 isOpen = 0;
 status = "Closed until 5:00pm";
 timeframes =                 (
 {
 days = "Mon\U2013Fri";
 includesToday = 1;
 open =                         (
 {
 renderedTime = "11:00 AM\U20133:00 PM";
 },
 {
 renderedTime = "5:00 PM\U201310:00 PM";
 }
 );
 segments =                         (
 );
 },
 {
 days = "Sat\U2013Sun";
 open =                         (
 {
 renderedTime = "11:00 AM\U201310:00 PM";
 }
 );
 segments =                         (
 );
 }
 );
 */

@interface UXRFourSquareHoursModel : UXRBaseModel
@property(nonatomic,assign) BOOL isOpen;
@property(nonatomic,strong) NSString *status;
@property(nonatomic,strong) NSArray *timeframes;
@end
