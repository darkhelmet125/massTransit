//
//  StopsTableViewController.h
//  massTransit
//
//  Created by William Short on 4/23/13.
//  Copyright (c) 2013 William Short. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopNameAndStopTime.h"
#import "Route.h"
#import "MetrolinkDatabase.h"

@interface StopsTableViewController : UITableViewController
@property (nonatomic, retain) NSArray* stops;
@property NSString* routeID;
@end
