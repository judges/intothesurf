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
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Bike check-in" Location:@"HQ" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 07:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 8:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Mandatory Meeting" Location:@"Beach" TimeFrom:[dateFormatter dateFromString:@"2011-04-03 10:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-03 11:15:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Eat something" Location:nil TimeFrom:[dateFormatter dateFromString:@"2011-04-03 13:00:00"] TimeTo:nil]];
	
	
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Friday" Date:[dateFormatter dateFromString:@"2011-04-03 0:00:00"]  Events:eventArray]];
	
	eventArray=[[[NSMutableArray alloc]init] autorelease];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Kids race" Location:@"Race Headquarters" TimeFrom:[dateFormatter dateFromString:@"2011-04-04 8:00:00"] TimeTo:[dateFormatter dateFromString:@"2011-04-04 9:00:00"]]];
	[eventArray addObject:[RaceEvent RaceEventWithTitle:@"Bla bla bla" Location:@"Beach" TimeFrom:[dateFormatter dateFromString:@"2011-04-04 9:30:00"] TimeTo:nil]];
	
	
	[dayArray addObject:[RaceDay RaceDayWithTitle:@"Saturday" Date:[dateFormatter dateFromString:@"2011-04-04 0:00:00"]  Events:eventArray]];
	
	
	[infoArray addObject:[RaceInfo RaceInfoWithTitle:@"Lavaman Waikoloa" Days:dayArray]];
	

	return infoArray;
}
@end
