//
//  Message.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Message : NSObject {
	int Id;
	NSString* Title;
	NSString* Content;
	NSDate* Date;
	NSString* Sponsor;
	BOOL Read;
}

@property int Id;
@property(nonatomic,retain) NSString* Title;
@property(nonatomic,retain) NSString* Content;
@property(nonatomic,retain) NSDate* Date;
@property(nonatomic,retain) NSString* Sponsor;
@property BOOL Read;

@end
