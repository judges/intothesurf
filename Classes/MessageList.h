//
//  MessageList.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageContainer;

@interface MessageList : UITableViewController {
	MessageContainer* messageContainer;
	
	
}

-(int)reverseIndex:(int)i;
-(id)initWithMessageContainer:(MessageContainer*)mc;

@end
