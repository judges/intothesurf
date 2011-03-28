
//  RaceInformationCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceInformationCreator.h"
#include "RaceDay.h"
#include "RaceEvent.h"
#include "RaceInfo.h"


@implementation RaceInformationCreator


+(NSArray*)CreateRaceInfo
{
	NSMutableArray *dayArray;
	NSMutableArray *eventArray;
	NSMutableArray *infoArray;
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	
	infoArray = [[[NSMutableArray alloc]init]autorelease];
	
	dayArray =[[[NSMutableArray alloc]init] autorelease];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Ticket Office Opens for Concert"       Location:@"Anaehoomalu Bay"    TimeFrom:[dateFormatter dateFromString:@"2011-04-02 14:00:00"] TimeTo:nil]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Registration for 5k opens"       Location:@"Anaehoomalu Bay"    TimeFrom:[dateFormatter dateFromString:@"2011-04-02 15:00:00"] TimeTo:nil]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"5k Fun Run"       Location:@"Anaehoomalu Bay"    TimeFrom:[dateFormatter dateFromString:@"2011-04-02 17:00:00"] TimeTo:nil]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Concert"          Location:@"Queens Marketplace" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 19:00:00"] TimeTo:nil]];	
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Friday" Date:[dateFormatter dateFromString:@"2011-04-01 0:00:00"]  Events:eventArray]];

	eventArray=[[[NSMutableArray alloc]init] autorelease]; 
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"LavaKids Registration"         Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 7:30:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-02 9:00:00"]]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"LavaKids"         Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 9:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-02 9:00:00"]]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Packet Pickup"    Location:@"Hilton Waikoloa" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 13:00:00"] TimeTo:nil]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Pre-Race Meeting" Location:@"Hilton Waikoloa" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 16:30:00"] TimeTo:nil]];		
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Saturday" Date:[dateFormatter dateFromString:@"2011-04-02 0:00:00"]  Events:eventArray]];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Bike Check-in Opens" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 5:45:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Road to Anaehoomalu Bay closes" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 7:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Race Start"        Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 7:30:00"]  TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Beer Garden Opens" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 11:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 15:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Music Begins"      Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 11:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 15:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Awards Ceremony"   Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 13:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 15:00:00"]]];
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Sunday" Date:[dateFormatter dateFromString:@"2011-04-03 0:00:00"]  Events:eventArray]];
	
	[infoArray addObject:[RaceInfo RaceInfoWithTitle:@"Lavaman Waikoloa" Days:dayArray]];
	
	
	return infoArray;
}
@end