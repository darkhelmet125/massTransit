//
//  Route.h
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject
@property NSString* route_id;
@property NSString* route_long_name;

-(id)initWithRouteID:(NSString*)route andRouteLongName:(NSString*)routeLongName;
@end
