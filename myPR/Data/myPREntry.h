//
//  myPREntry.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface myPREntry : NSObject {
	NSDate* Date;
	float Value;
}
@property(nonatomic,retain) NSDate* Date;
@property float Value;


+(void) AddEntry:(myPREntry*)entry ToContext:(NSManagedObjectContext*)context ToRecord:(NSManagedObject*)userObj;
+(myPREntry*) EntryFromObject:(NSManagedObject*)obj;
+(void) EditEntry:(myPREntry*)usr ToObject:(NSManagedObject*)obj;
+(void) DeleteEntry:(NSManagedObject*)entry FromObject:(NSManagedObject*)user FromContext:(NSManagedObjectContext*)context;

@end
