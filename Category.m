//
//  Category.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "Category.h"


@implementation Category

@synthesize ImageName;
@synthesize LabelTxt;
@synthesize Items;

+(id)categoryWithImageName:(NSString*)img Label:(NSString*)lbl Items:(NSArray*)items
{
	Category* c= [[Category alloc]init];
	c.Items = items;
	c.ImageName = img;
	c.LabelTxt = lbl;
	[c autorelease];
	return c;
}

-(void) dealloc
{
	[Items release];
	[ImageName release];
	[LabelTxt release];
	[super dealloc];
}
@end
