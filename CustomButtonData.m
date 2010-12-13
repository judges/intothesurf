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
		self.Title =title;

		self.BigText = bigText;
		
		self.SmallText = smallTest;
		
		self.ImageName = imageName;
		
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
