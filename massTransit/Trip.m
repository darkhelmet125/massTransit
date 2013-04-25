//
//  Trip.m
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "Trip.h"

@implementation Trip
@synthesize tripID;
-(id)initWithTripID:(NSNumber*)trip
{
    self = [super init];
    if(self)
        tripID = trip;
    return self;
}
@end
