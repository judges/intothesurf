//
//  wgtWeightEntry.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface wgtWeightEntry : NSObject {
	NSDate* Date;
	float Weight;
	int Fat;
	int Water;
}

@property(nonatomic,retain) NSDate* Date;
@property float Weight;
@property int Fat;
@property int Water;

+(void) AddEntry:(wgtWeightEntry*)usr ToContext:(NSManagedObjectContext*)context ToObject:(NSManagedObject*)userObj;
+(wgtWeightEntry*) EntryFromObject:(NSManagedObject*)obj;
+(void) EditEntry:(wgtWeightEntry*)usr ToObject:(NSManagedObject*)obj;
+(void) DeleteEntry:(NSManagedObject*)entry FromObject:(NSManagedObject*)user FromContext:(NSManagedObjectContext*)context;

@end
