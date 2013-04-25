//
//  Trip.h
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trip : NSObject
@property NSNumber* tripID;
-(id)initWithTripID:(NSNumber*)trip;
@end
