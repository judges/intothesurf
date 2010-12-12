//
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
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Lavaman 75% Refund - last day to request refund." Location:@"Lavaman" TimeFrom:[dateFormatter dateFromString:nil] TimeTo:nil]];	
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Saturday" Date:[dateFormatter dateFromString:@"2011-01-01 0:00:00"]  Events:eventArray]];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Lavaman 50% Refund - last day to request refund." Location:@"Lavaman" TimeFrom:[dateFormatter dateFromString:nil] TimeTo:nil]];	
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Monday" Date:[dateFormatter dateFromString:@"2011-02-28 0:00:00"]  Events:eventArray]];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"LavaKids" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 8:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-02 9:00:00"]]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Packet Pickup" Location:@"Hilton Waikoloa" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 13:00:00"] TimeTo:nil]];	
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Pre-Race Meeting" Location:@"Hilton Waikoloa" TimeFrom:[dateFormatter dateFromString:@"2011-04-02 16:30:00"] TimeTo:nil]];		
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Saturday" Date:[dateFormatter dateFromString:@"2011-04-02 0:00:00"]  Events:eventArray]];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Bike Check-in Opens" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 5:45:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Road to Anaehoomalu Bay closes" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 7:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Race Start" Location:@"Anaehoomalu Bay" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 7:30:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 12:00:00"]]];
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Sunday" Date:[dateFormatter dateFromString:@"2011-04-03 0:00:00"]  Events:eventArray]];
	
	[infoArray addObject:[RaceInfo RaceInfoWithTitle:@"Lavaman Waikoloa" Days:dayArray]];
	

	return infoArray;
}
@end
