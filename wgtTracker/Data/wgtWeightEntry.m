//
//  wgtWeightEntry.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtWeightEntry.h"
#import <CoreData/CoreData.h>

@implementation wgtWeightEntry
@synthesize Date,Weight,Fat,Water;

+(void) AddEntry:(wgtWeightEntry*)entry ToContext:(NSManagedObjectContext*)context ToObject:(NSManagedObject*)userObj
{
	NSManagedObject* newEntry= [NSEntityDescription insertNewObjectForEntityForName:@"WeightEntry" inManagedObjectContext:context];
	[newEntry setValue:entry.Date forKey:@"Date"];
	[newEntry setValue:[NSNumber numberWithFloat:entry.Weight] forKey:@"Weight"];
	[newEntry setValue:[NSNumber numberWithFloat:entry.Water] forKey:@"Water"];
	[newEntry setValue:[NSNumber numberWithFloat:entry.Fat] forKey:@"Fat"];
	
	NSMutableSet *entriesSet = [userObj mutableSetValueForKey:@"WeightEntries"];
	[entriesSet addObject:newEntry];
	[newEntry setValue:userObj forKey:@"User"];
}

+(void) DeleteEntry:(NSManagedObject*)entry FromObject:(NSManagedObject*)user FromContext:(NSManagedObjectContext*)context
{
	NSMutableSet *entriesSet = [user mutableSetValueForKey:@"WeightEntries"];
	//NSMutableSet *mutableSet = [NSMutableSet setWithSet:entriesSet];
	//[mutableSet removeObject:<#(id)object#>
	
	[entriesSet removeObject:entry];
	[context deleteObject:entry];
	entriesSet = [user mutableSetValueForKey:@"WeightEntries"];
}

+(wgtWeightEntry*) EntryFromObject:(NSManagedObject*)obj
{
	wgtWeightEntry* tmp =[[[wgtWeightEntry alloc] init] autorelease];
	
	tmp.Weight = [[obj valueForKey:@"Weight"] floatValue];
	tmp.Date = [obj valueForKey:@"Date"];
	tmp.Water = [[obj valueForKey:@"Water"] intValue];
	tmp.Fat = [[obj valueForKey:@"Fat"] intValue];
	return tmp;
}
+(void) EditEntry:(wgtWeightEntry*)entry ToObject:(NSManagedObject*)obj
{
	[obj setValue:entry.Date forKey:@"Date"];
	[obj setValue:[NSNumber numberWithFloat:entry.Weight] forKey:@"Weight"];
	[obj setValue:[NSNumber numberWithInt:entry.Water] forKey:@"Water"];
	 [obj setValue:[NSNumber numberWithInt:entry.Fat] forKey:@"Fat"];
}

@end
