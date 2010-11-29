//
//  RaceEvent.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RaceEvent.h"


@implementation RaceEvent
@synthesize Title;
@synthesize Location;

@synthesize Begining;
@synthesize Ending;

+(id) RaceEventWithTitle:(NSString*)desc Location:(NSString*)loc TimeFrom:(NSDate*)th TimeTo:(NSDate*)tt
{
	RaceEvent* re = [[[RaceEvent alloc]init] autorelease];
	re.Title =desc;
	re.Location = loc;
	re.Begining = th;
	re.Ending = tt;

	return re;
}
@end
