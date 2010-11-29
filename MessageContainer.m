//
//  MessageContainer.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "MessageContainer.h"
#include "Message.h"

@implementation MessageContainer
@synthesize MessageArray;

const char* MessageSplitToken="{~}";
const char* ValueSplitToken="[~]";

-(id)initWithOwner:(id)own Selector:(SEL)sel
{
	self = [super init];
	if(self!=nil)
	{
		owner = own;
		selector = sel;
		[self LoadArray];
		
		if([[NSUserDefaults standardUserDefaults] objectForKey:@"notDownloaded"])
		{
			NotDownloadedMessages = [[NSUserDefaults standardUserDefaults] integerForKey:@"notDownloaded"];
		}
	}
	return self;
}
-(int)GetUnreadMessageNumber
{
	
	int ret = NotDownloadedMessages;
	
	for (int i=0; i<[MessageArray count]; i++) {
		Message* m = [MessageArray objectAtIndex:i];
		if(!m.Read)
		{
			ret++;
		}
	}
		return ret;
}

-(int)GetLastMessageId
{
	if([MessageArray count]>0)
	{
		int lastID = ((Message*)[MessageArray objectAtIndex:[MessageArray count]-1]).Id;
		return lastID;
	}
	else 
	{
		return -1;
	}


}

-(void)QueryUnreadCount
{
	if(!requestPending)
	{
		/*NSString* deviceToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"];
		
		if(deviceToken)
		{

			NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessagecount?deviceToken=%@", deviceToken]]];
			
			msgCountData = [[NSMutableData alloc]init];
			requestPending= YES;
			[NSURLConnection connectionWithRequest:req delegate:self];
		}
		else
		{*/
			int lastId=0;

			
			lastId = [self GetLastMessageId];
			NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessagetodownload?lastId=%i", lastId]]];
			msgCountData = [[NSMutableData alloc]init];
			requestPending= YES;
			[NSURLConnection connectionWithRequest:req delegate:self];
	//	}
	}
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[msgCountData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	requestPending = NO;
	
	[owner performSelector:selector withObject:NO];
	
	
	
	NSLog( @"%@",[error localizedDescription  ]);
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	requestPending = NO;
	NSString *count = [[NSString alloc] initWithData:msgCountData encoding:NSASCIIStringEncoding];
	if(count)
	{
		NSLog(@"%@",count);
		int i = [self ParseCountAnswer:count];
		if (i>=0) 
		{
			NotDownloadedMessages = i;
			[[NSUserDefaults standardUserDefaults] setInteger:i forKey:@"notDownloaded"];
			[self NotifyAboutMessageCountChange];
		}
		else 
		{
			[owner performSelector:selector withObject:NO];
		}
	}
	else 
	{
		[owner performSelector:selector withObject:NO];
	}

	[count release];
	[msgCountData release];

}


-(int)ParseCountAnswer:(NSString*)str
{
	int i=-1;
	if ([str length] >=16)
	{		
		NSString *beginning = [str substringToIndex:7];
		NSString *count = [[str substringFromIndex:7] substringToIndex: [str length]-7 - 8];
		NSString *ending = [str substringFromIndex:[str length]-8];
		
		if([beginning isEqualToString:@"<count>"] && [ending isEqualToString:@"</count>"])
		{
			i = [count intValue];
		}
	}
	return i;
}

-(void)NotifyAboutMessageCountChange
{
	[owner performSelector:selector withObject:TRUE];
	[UIApplication sharedApplication].applicationIconBadgeNumber = [self GetUnreadMessageNumber];
}

-(void)LoadArray
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *titlePath = [documentsDirectory stringByAppendingPathComponent:@"messageArray.list"];

	NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:titlePath];
	MessageArray = [[NSMutableArray alloc]init];
	if(!array)
	{
		NSLog(@"Array file not found.");
	}
	else
	{

		for(int i=0;i<[array count];i++)
		{
			Message* m = [[Message alloc]init];
			
			NSArray *tmpArray = [array objectAtIndex:i];
			
			m.Id = [(NSString*)[tmpArray objectAtIndex:0] intValue];
			m.Title = [tmpArray objectAtIndex:1];
			m.Content = [tmpArray objectAtIndex:2];
			
			
			m.Date = [tmpArray objectAtIndex:3]; //parsing or maybe not.
			
			m.Sponsor = [tmpArray objectAtIndex:4];
			int i = [(NSString*)[tmpArray objectAtIndex:5] intValue];
			m.Read = i==1;
			[MessageArray addObject:m];
			[m release];
		}
	}
	
}
-(void)SaveArray
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *titlePath = [documentsDirectory stringByAppendingPathComponent:@"messageArray.list"];
	
	NSMutableArray *arrayToSave = [[NSMutableArray alloc]init];
	
	for(int i=0;i<[MessageArray count];i++)
	{
		NSMutableArray* tmpArray = [[NSMutableArray alloc]init];
		Message* m = [MessageArray objectAtIndex:i];
		[tmpArray addObject:[NSString stringWithFormat:@"%d", m.Id]];
		[tmpArray addObject:m.Title];
		[tmpArray addObject:m.Content];
		[tmpArray addObject:m.Date];
		[tmpArray addObject:m.Sponsor];
		[tmpArray addObject:[NSString stringWithFormat:@"%i", m.Read]];
		
		[arrayToSave addObject:tmpArray];
		[tmpArray release];
	}
	
	
	if([arrayToSave writeToFile:titlePath atomically:YES])
	{
		NSLog(@"Array file saved.");
	}
	else 
	{
		NSLog(@"Array file failed to save.");
	}
	
	[arrayToSave release];
}

-(Message*)GetMessageAtIndex:(int)index
{
	return [MessageArray objectAtIndex:index];
}


-(BOOL)DownloadNewMessages
{
	//NSString* deviceToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"];
	NSURLRequest *req;
	
	//if(deviceToken)
	//{
//		req = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:  @"http://intothesurf.com/lavaman/device/getmessages?deviceToken=%@", deviceToken]]];
//	}
//	else 
//	{
		
//	}

	int lastId =[self GetLastMessageId];
	req = [NSURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://intothesurf.com/lavaman/device/getmessageswithlastid?lastId=%i",lastId]]];
	
	
	NSData* data;
	NSURLResponse* response;
	NSError *error;
	
	data = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
	
	if(!data)
	{
		NSLog(@"cos nie pobral");
		return NO;
	}
	else 
	{
		NSString*str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
		
	
		
		NSString *validatedString = [self ParseMessageAnswer:str];
		BOOL result = validatedString!=nil;
		if(result)
		{
			[self ConcatWithString:validatedString];
			[self SaveArray];
			NotDownloadedMessages = 0;
			[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"notDownloaded"];
		}
		[str release];
		return result;
		
	}
}
-(NSString*)ParseMessageAnswer:(NSString*)str
{
	NSString *result=nil;
	if ([str length] >=13)
	{		
		NSString *beginning = [str substringToIndex:6];
		NSString *count = [[str substringFromIndex:6] substringToIndex: [str length]-6 - 7];
		NSString *ending = [str substringFromIndex:[str length]-7];
		
		if([beginning isEqualToString:@"<news>"] && [ending isEqualToString:@"</news>"])
		{
			result = count;
		}
	}
	return result;
}

-(Message*) CreateMessageFromString:(NSString*)str
{
	
	
	NSString *splitString = [NSString stringWithUTF8String:ValueSplitToken];
	NSArray* array = [str componentsSeparatedByString: splitString];
	
	int Id = [(NSString*)[array objectAtIndex:0] intValue];
	NSString* title = [array objectAtIndex:1];
	NSString *content= [array objectAtIndex:2];
	NSString *date= [array objectAtIndex:3];
	NSString *sponsor =  [array objectAtIndex:4];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"dd.MM.yyyy"];
	
	
	Message *msg= [[Message alloc] init];
	
	msg.Id = Id;
	msg.Title =title;
	msg.Content = content;
	msg.Date = [formatter dateFromString:date];
	msg.Sponsor = sponsor;
	
	[formatter release];
	return msg;
}

-(NSArray*) GetMessagesFromString:(NSString*)str
{
	NSString *splitString = [NSString stringWithUTF8String:MessageSplitToken];
	NSArray* array = [str componentsSeparatedByString: splitString];
	return array;
}



-(void)ConcatWithString:(NSString*)str
{
	int lastDownloadedId=-1;
	if([MessageArray count]>0)
	{
		Message* m = [MessageArray objectAtIndex:[MessageArray count]-1];
		lastDownloadedId =m.Id;
	}
	
	NSArray* serverMessages = [self GetMessagesFromString:str];
	
	for (int i=0; i<[serverMessages count]-1; i++) 
	{
		Message *msg = [self CreateMessageFromString:[serverMessages objectAtIndex:i]];
		if(msg.Id > lastDownloadedId)
		{
			[MessageArray addObject:msg];
		}
		[msg release];
	}
}




-(void)dealloc
{
	[MessageArray release];
	[super dealloc];
}

@end
