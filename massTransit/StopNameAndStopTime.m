//
//  StopNameAndStopTime.m
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "StopNameAndStopTime.h"

@implementation StopNameAndStopTime
@synthesize stop_name;
@synthesize stop_time;
-(id)initWithStopName:(NSString*)stopName andStopTime:(NSString*)stopTime
{
    self = [super init];
    if(self)
    {
        stop_name = stopName;
        stop_time = stopTime;
    }
    return self;
}
@end
