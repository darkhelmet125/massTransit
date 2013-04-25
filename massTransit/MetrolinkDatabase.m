//
//  USLocationsDatabase.m
//  SQLiteTableView
//
//  Created by Michael Shafae on 11/8/12.
//  Copyright (c) 2012 Michael Shafae. All rights reserved.
//

#import "MetrolinkDatabase.h"

@implementation MetrolinkDatabase

static MetrolinkDatabase* _databaseObj;

+ (MetrolinkDatabase*) database
{
    if (_databaseObj == nil) {
        _databaseObj = [[MetrolinkDatabase alloc] init];
    }
    return _databaseObj;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"metrolink" ofType:@"sl3"];
        if (sqlite3_open([dbpath UTF8String], &_databaseConnection) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    return self;
}

- (void) dealloc
{
    sqlite3_close(_databaseConnection);
}

- (NSArray*) allRoutes
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"select route_id, route_long_name from routes;";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *routeID, *routeLongName;
    if( sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                routeID = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                routeID = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                routeLongName = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
            else
                routeLongName = nil;
            Route *thisRoute = [[Route alloc]initWithRouteID:routeID andRouteLongName:routeLongName];
            [rv addObject:thisRoute];
        }
        sqlite3_finalize(stmt);
    }
    return (NSArray*)rv;
}

- (NSArray*) stopsForRoute:(NSString*) routeID
{
    //given routeID still need to lookup stops in stop times
    //get first row from trips which has same route id
    //get stops from stop times given previouw tripid
    NSMutableArray* rv = [[NSMutableArray alloc] initWithCapacity:5];
    sqlite3_stmt *stmt;
    int tripidnum;
    NSNumber *tripid;
    const unsigned char* text;
    NSString *stopName, *stopTime;
    NSString* query = [NSString stringWithFormat:@"select trip_id from trips where route_id='%@';", routeID];
    NSString* query1 = [NSString stringWithFormat:@"select stops.stop_name, stop_times.arrival_time from stop_times inner join stops on stop_times.stop_id=stops.stop_id where stop_times.trip_id='%@';",tripid];
    if( sqlite3_prepare_v2(_databaseConnection, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK)
    {
        if( sqlite3_step(stmt) == SQLITE_ROW)
        {
            tripidnum = sqlite3_column_int(stmt, 0);
            tripid = [NSNumber numberWithInt:tripidnum];
            Trip* trip;
            trip = [[Trip alloc]initWithTripID:tripid];
        }
        if( sqlite3_prepare_v2(_databaseConnection, [query1 UTF8String], [query1 length], &stmt, nil) == SQLITE_OK)
        {
            while(sqlite3_step(stmt) == SQLITE_ROW)
            {
                text = sqlite3_column_text(stmt, 0);
                if(text)
                    stopName = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
                else
                    stopName = nil;
                text = sqlite3_column_text(stmt, 1);
                if(text)
                    stopTime = [NSString stringWithCString:(const char*)text encoding:NSUTF8StringEncoding];
                else
                    stopTime = nil;
                StopNameAndStopTime* stop;
                stop = [[StopNameAndStopTime alloc]initWithStopName:stopName andStopTime:stopTime];
                [rv addObject:stop];
            }
        }
        sqlite3_finalize(stmt);
    }
    return (NSArray*)rv;
}
@end
