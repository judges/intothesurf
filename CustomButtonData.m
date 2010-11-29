//
//  CustomButtonData.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-17.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "CustomButtonData.h"


@implementation CustomButtonData
@synthesize Title;
@synthesize SmallText;
@synthesize BigText;
@synthesize ImageName;

-(id)initWithTitle:(NSString*)title SmallText:(NSString*)smallTest BigText:(NSString*)bigText ImageName:(NSString*)imageName
{
	self= [super init];
	if(self)
	{
		Title =title;
		[Title retain];
		BigText = bigText;
		[BigText retain];
		SmallText = smallTest;
		[SmallText retain];
		ImageName = imageName;
		[ImageName retain];
	}
	return self;
}


-(void) dealloc
{
	[Title release];
	[SmallText release];
	[BigText release];
	[ImageName release];
		
	[super dealloc];
}
@end
