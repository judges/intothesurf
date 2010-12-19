//
//  triCalcSettings.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcSettings.h"


@implementation triCalcSettings
@synthesize TintColor;
@synthesize BackgroundColor;


-(void) dealloc
{
	self.TintColor=nil;
	self.BackgroundColor = nil;

	[super dealloc];
}
@end
