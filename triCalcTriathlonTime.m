//
//  triCalcTriathlonTime.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcTriathlonTime.h"


@implementation triCalcTriathlonTime

@synthesize useMile;

-(id)init
{
	self = [super init];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *titlePath = [documentsDirectory stringByAppendingPathComponent:@"triCalc.list"];
	
	array = [[NSMutableArray alloc]initWithContentsOfFile:titlePath];
	
	
	
	if(!array)
	{
		array = [[NSMutableArray alloc] init];
	
		NSMutableArray *timeA = [[NSMutableArray alloc]init];
		for (int i=0; i<4; i++) {
			[timeA addObject:[NSNumber numberWithFloat:0]];
		}
		[array addObject: timeA];
		[timeA release];
		
		NSMutableArray *timeB = [[NSMutableArray alloc]init];
		for (int i=0; i<4; i++) {
			[timeB addObject:[NSNumber numberWithFloat:0]];
		}
		[array addObject: timeB];
		[timeB release];
		
		NSMutableArray *timeC = [[NSMutableArray alloc]init];
		for (int i=0; i<3; i++) {
			[timeC addObject:[NSNumber numberWithFloat:0]];
		}
		[array addObject: timeC];
		[timeC release];
	}

	
	return self;
}


-(void)updateUseMile:(BOOL)m
{
	self.useMile = m;
}

-(void)updateTimeMode:(float)v InEdit:(int)e InScreen:(int)s
{
	
	if(e == 1) //distance set
	{
		float distance = v;
		float pace = [[[array objectAtIndex:2] objectAtIndex:s] floatValue];
		float time = 0;
		
		if (distance ==0 || pace == 0) 
		{
			time =0;
		}
		else 
		{
			time = (distance / pace) *3600;
		}
		[[array objectAtIndex:0] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:time]];
	}
	else // pace set;
	{
		float distance = [[[array objectAtIndex:1] objectAtIndex:s] floatValue];
		float pace = v; 
		float time = 0;
		
		if (distance ==0 || pace == 0) 
		{
			time =0;
		}
		else 
		{
			time = (distance / pace) *3600;
		}
		[[array objectAtIndex:0] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:time]];
		
	}
}

-(void)updateDistanceMode:(float)v InEdit:(int)e InScreen:(int)s
{
	if(e== 0) //time
	{
		float distance = 0;
		float pace = [[[array objectAtIndex:2] objectAtIndex:s] floatValue];
		float time = v;
			
		if(pace ==0 || time==0)
		{
			distance = 0;
		}
		else
		{
			distance = pace * (time / 3600);
		}
		[[array objectAtIndex:1] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:distance]];
		
	}
	else
	{ //pace
		float distance = 0;
		float pace = v;
		float time = [[[array objectAtIndex:0] objectAtIndex:s] floatValue];
		
		if(pace ==0 || time==0)
		{
			distance = 0;
		}
		else
		{
			distance = pace * (time / 3600);
		}
		[[array objectAtIndex:1] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:distance]];		
	}
}

-(void)updatePaceMode:(float)v InEdit:(int)e InScreen:(int)s
{
	if(e==0) //time
	{
		float distance = [[[array objectAtIndex:1] objectAtIndex:s] floatValue];
		float pace = 0;
		float time = v;		
		
		if(time==0 || distance==0)
		{
			pace = 0;
		}
		else
		{
			pace =  distance / (time/3600);
		}
		[[array objectAtIndex:2] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:pace]];
	}
	else //distance
	{
		float distance = v;
		float pace = 0;
		float time = [[[array objectAtIndex:0] objectAtIndex:s] floatValue];	
		
		if(time==0 || distance==0)
		{
			pace = 0;
		}
		else
		{
			pace =  distance / (time/3600);
		}
		[[array objectAtIndex:2] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:pace]];		
	}
}


-(void)updateValue:(float)v InEdit:(int)e InScreen:(int)s InMode:(int)m
{
	[[array objectAtIndex:e] replaceObjectAtIndex:s withObject:[NSNumber numberWithFloat:v]];
	if(s!=3)
	{
	switch (m) {
		case 0:
			[self updateTimeMode:v InEdit:e InScreen:s];
			break;
		case 1:
			[self updateDistanceMode:v InEdit:e InScreen:s];
			break;
		case 2:
			[self updatePaceMode:v InEdit:e InScreen:s];
			break;
	}
	}
}
-(float)GetValueInEdit:(int)e InScreen:(int)s
{
	return [[[array objectAtIndex:e] objectAtIndex:s] floatValue];
}

-(void) dealloc
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *titlePath = [documentsDirectory stringByAppendingPathComponent:@"triCalc.list"];

	[array writeToFile:titlePath atomically:YES];
	
	[array release];
	[super dealloc];
}


@end
