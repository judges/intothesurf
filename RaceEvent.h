//
//  RaceEvent.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RaceEvent : NSObject {
	NSString * Location;
	NSString * Title;
	NSDate* Begining;
	NSDate* Ending;
}
@property(nonatomic,retain) NSString* Location;
@property(nonatomic,retain) NSString* Title;
@property(nonatomic,retain) NSDate* Begining;
@property(nonatomic,retain) NSDate* Ending;


+(id) RaceEventWithTitle:(NSString*)desc Location:(NSString*)loc TimeFrom:(NSDate*)th TimeTo:(NSDate*)tt;

@end
