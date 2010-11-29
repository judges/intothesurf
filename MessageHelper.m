//
//  MessageHelper.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "MessageHelper.h"
#include "Message.h"
#include "MessageContainer.h"

@implementation MessageHelper
const char* MessageSplitToken="{~}";
const char* ValueSplitToken="[~]";

-(Message*) CreateMessageFromString:(NSString*)str
{
	NSString *splitString = [NSString stringWithUTF8String:ValueSplitToken];
	NSArray* array = [str componentsSeparatedByString: splitString];
	int Id = [(NSString*)[array objectAtIndex:0] intValue];
	NSString* title = [array objectAtIndex:1];
	NSString *content= [array objectAtIndex:2];
	
	Message *msg= [[Message alloc] initWithId:Id title:title content:content];
	return msg;
}
-(NSArray*) GetMessagesFromString:(NSString*)str
{
	NSString *splitString = [NSString stringWithUTF8String:MessageSplitToken];
	NSArray* array = [str componentsSeparatedByString: splitString];
	return array;
}
-(int)GetLastId
{
	int i=0;
	MessageContainer *mc = [MessageContainer alloc];
	[mc LoadArray];
	
	if([mc.MessageArray count] >0)
	{
		i =[mc GetMessageIdByIndex:[mc.MessageArray count]-1];
		
	}
	
	[mc release];
	return i;
}

-(MessageContainer*) CreateMessageContainer
{
	NSString* deviceToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"];
	NSURLRequest *req;
	
	if(deviceToken)
	{
		req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessages?deviceToken=%@", deviceToken]]];
	}
	else 
	{
		req = [NSURLRequest requestWithURL:[NSURL URLWithString: @"http://intothesurf.com/lavaman/device/getmessages"]];
	}

	
	MessageContainer *mc = [MessageContainer alloc];
	[mc LoadArray];
	
	NSData* data;
	NSURLResponse* response;
	NSError *error;
	
	data = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
	
	if(!data)
	{
		NSLog(@"cos nie pobral");
		return mc;
	}
	else 
	{
		NSString*str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
		[self ConcatMessageContainer:mc withString:str];
		[str release];
		
		if(deviceToken)
		{
			int lastId;
			if([mc.MessageArray count]>0)
			{
				lastId=[mc GetMessageIdByIndex:[mc.MessageArray count]-1];
			}
			else {
				lastId=-1;
			}

			req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/SendLastId?deviceToken=%@&lastId=%i", deviceToken,lastId]]];
			data = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
			
			[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
		}
		
	}
	[mc SaveArray];
	return mc;
}

-(void)ConcatMessageContainer:(MessageContainer*)mc withString:(NSString*)str
{
	int lastDownloadedId=-1;
	if([mc.MessageArray count]>0)
	{
		lastDownloadedId =[mc GetMessageIdByIndex:[mc.MessageArray count]-1];
	}
	
	NSArray* serverMessages = [self GetMessagesFromString:str];
	
	for (int i=0; i<[serverMessages count]-1; i++) 
	{
		Message *msg = [self CreateMessageFromString:[serverMessages objectAtIndex:i]];
		if(msg.Id > lastDownloadedId)
		{
			[mc AddMessage:msg];
		}
		[msg release];
	}
}

@end
