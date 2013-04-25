//
//  USLocationsDatabase.h
//  SQLiteTableView
//
//  Created by Michael Shafae on 11/8/12.
//  Copyright (c) 2012 Michael Shafae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Route.h"
#import "Trip.h"
#import "StopNameAndStopTime.h"

@interface MetrolinkDatabase : NSObject
{
  sqlite3* _databaseConnection;
}

+ (MetrolinkDatabase*) database;
- (NSArray*) allRoutes;
- (NSArray*) stopsForRoute:(NSString*) routeID;

@end
