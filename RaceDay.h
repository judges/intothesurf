//
//  RaceDay.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RaceDay : NSObject {
	NSString* Title;
	NSDate* Date;
	NSArray* Events;
}

@property(nonatomic,retain) NSString* Title;
@property(nonatomic,retain) NSDate* Date;
@property(nonatomic,retain) NSArray* Events;

+(id)RaceDayWithTitle:(NSString*)title Date:(NSDate*)date Events:(NSArray*)events;

@end
