//
//  MessageHelper.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Message;
@class MessageContainer;

@interface MessageHelper : NSObject {

}

-(Message*) CreateMessageFromString:(NSString*)str;
-(NSArray*) GetMessagesFromString:(NSString*)str;


-(MessageContainer*) CreateMessageContainer;
-(int)GetLastId;
-(void)ConcatMessageContainer:(MessageContainer*)mc withString:(NSString*)str;
@end
