//
//  RaceInfo.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RaceInfo : NSObject {
	NSString *Title;
	NSArray* Days;
}

@property(nonatomic,retain) NSString* Title;
@property(nonatomic,retain) NSArray* Days;


+(id)RaceInfoWithTitle:(NSString*)title Days:(NSArray*)days;
@end
