//
//  myPRUnitHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRUnitHandler.h"


@implementation myPRUnitHandler
@synthesize key,Name,Sample,Unit;

-(void) dealloc
{
	self.Name=nil;
	self.Sample=nil;
	self.Unit=nil;
	[super dealloc];
}

-(NSString*)StringFromValue:(float)f
{
	return nil;
}
-(float)FloatFromPicker:(UIPickerView*)p
{
	return 0;
}
-(void)SetPicker:(UIPickerView*)p withValue:(float)f
{
	
}

-(NSMutableArray*)CreatePickerDataSource
{
	return [[NSMutableArray alloc] init];
}
@end
