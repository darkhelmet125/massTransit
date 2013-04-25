//
//  StopNameAndStopTime.h
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StopNameAndStopTime : NSObject
@property NSString* stop_name;
@property NSString* stop_time;
-(id)initWithStopName:(NSString*)stopName andStopTime:(NSString*)stopTime;
@end
