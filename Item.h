//
//  Item.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Item : NSObject {
	NSString* Title;
	NSString* Image;
	NSString* AddressLink;
	NSString* Address;
	NSString* Info;
}

@property(nonatomic,retain)  NSString* Title;
@property(nonatomic,retain)  NSString* Image;
@property(nonatomic,retain)  NSString* AddressLink;
@property(nonatomic,retain)  NSString* Address;
@property(nonatomic,retain)  NSString* Info;

+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link;
@end
