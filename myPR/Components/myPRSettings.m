//
//  myPRSettings.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRSettings.h"


@implementation myPRSettings
@synthesize TintColor;
@synthesize BackgroundColor;
@synthesize AlternateColor;

-(void) dealloc
{
	self.TintColor=nil;
	self.BackgroundColor=nil;
	self.AlternateColor=nil;
	[super dealloc];
}
@end
