//
//  myPRRecord.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface myPRRecord : NSObject {
	NSString* Name;
	NSString* Icon;
	int Unit;
	NSString* Label;
}
@property(nonatomic,retain) NSString* Name;
@property(nonatomic,retain) NSString* Icon;
@property int Unit;
@property(nonatomic,retain) NSString* Label;


+(void) AddRecord:(myPRRecord*)rec ToContext:(NSManagedObjectContext*)context;
+(myPRRecord*) RecordFromObject:(NSManagedObject*)obj;
+(void) EditRecord:(myPRRecord*)rec ToObject:(NSManagedObject*)obj;
+(NSArray*) GetEntries:(NSManagedObject*)obj ToContext:(NSManagedObjectContext*)context;
@end
