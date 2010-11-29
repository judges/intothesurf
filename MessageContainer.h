//
//  MessageContainer.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Message;

@interface MessageContainer : NSObject {
	
	NSMutableArray *MessageArray;
	int NotDownloadedMessages;
	
	id owner;
	SEL selector;
	
	BOOL requestPending;
	NSMutableData* msgCountData;
}

-(id)initWithOwner:(id)own Selector:(SEL)sel;

@property(nonatomic,retain) NSMutableArray *MessageArray;


-(int)ParseCountAnswer:(NSString*)str;
-(NSString*)ParseMessageAnswer:(NSString*)str;

-(BOOL)DownloadNewMessages;
-(void)QueryUnreadCount;

-(Message*)GetMessageAtIndex:(int)index;
-(void)NotifyAboutMessageCountChange;



-(void)LoadArray;
-(void)SaveArray;
-(int)GetUnreadMessageNumber;
-(void)ConcatWithString:(NSString*)str;






@end
