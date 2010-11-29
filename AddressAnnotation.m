//
//  AddressAnnotation.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-16.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "AddressAnnotation.h"
#import <MapKit/MapKit.h>

@implementation AddressAnnotation
@synthesize coordinate;

-(NSString*)subtitle
{
	return mSubtitle;
}

-(NSString*)title
{
	return mTitle;
}



-(id)initWithCoordinate:(CLLocationCoordinate2D)c Title:(NSString*)t Message:(NSString*)m;
{
	self= [super init];
	if(self)
	{
		coordinate=c;
		mTitle = t;
		mSubtitle =m;
	}
	return self;
}

@end
