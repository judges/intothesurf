//
//  RaceInfo.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceInfo.h"


@implementation RaceInfo

@synthesize Title;
@synthesize Days;

+(id)RaceInfoWithTitle:(NSString*)title Days:(NSArray*)days
{

	RaceInfo * ri = [[[RaceInfo alloc]init]autorelease];
	
	ri.Title = title;
	ri.Days = days;
	
	return ri;
}
@end
