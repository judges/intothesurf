//
//  RaceDay.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceDay.h"


@implementation RaceDay

@synthesize Title;
@synthesize Date;
@synthesize Events;

+(id)RaceDayWithTitle:(NSString*)title Date:(NSDate*)date Events:(NSArray*)events
{
	RaceDay *rd = [[[RaceDay alloc]init]autorelease];
	rd.Title = title;
	rd.Date = date;
	rd.Events = events;
	
	
	return rd;
}


@end
