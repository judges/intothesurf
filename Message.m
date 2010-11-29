//
//  Message.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "Message.h"


@implementation Message
@synthesize Id;
@synthesize Title;
@synthesize Content;
@synthesize Date;
@synthesize Sponsor;
@synthesize Read;



-(void) dealloc
{
	[Title release];
	[Content release];
	[Date release];
	[Sponsor release];
	
	[super dealloc];
}

@end
