//
//  Route.m
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import "Route.h"

@implementation Route
@synthesize route_id;
@synthesize route_long_name;
-(id)initWithRouteID:(NSString*)route andRouteLongName:(NSString*)routeLongName
{
    self = [super init];
    if(self)
    {
        route_id = route;
        route_long_name = routeLongName;
    }
    return self;
}
@end
