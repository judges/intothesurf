//
//  Item.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "Item.h"


@implementation Item
@synthesize Title;
@synthesize Address;
@synthesize Info;
@synthesize Image;
@synthesize AddressLink;

+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	[itm autorelease];
	
	return itm;
}

-(void) dealloc
{
	[Title release];
	[Image release];
	[AddressLink release];
	[Address release];
	[Info release];
	
	[super dealloc];
}


@end
