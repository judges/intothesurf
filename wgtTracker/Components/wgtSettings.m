//
//  wgtSettings.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-09.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtSettings.h"


@implementation wgtSettings
@synthesize TintColor;
@synthesize BackgroundColor;
@synthesize AlternateBackgroundColor;


-(void) dealloc
{
	self.TintColor=nil;
	self.BackgroundColor = nil;
	self.AlternateBackgroundColor=nil;
	
	[super dealloc];
}
@end
