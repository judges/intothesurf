//
//  myPREntry.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPREntry.h"


@implementation myPREntry
@synthesize Date,Value;
-(void) dealloc
{
	[Date release];
	[super dealloc];
}


+(void) AddEntry:(myPREntry*)entry ToContext:(NSManagedObjectContext*)context ToRecord:(NSManagedObject*)userObj
{
	NSManagedObject* newEntry= [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
	[newEntry setValue:entry.Date forKey:@"Date"];
	[newEntry setValue:[NSNumber numberWithFloat:entry.Value] forKey:@"Value"];
	
	NSMutableSet *entriesSet = [userObj mutableSetValueForKey:@"Entries"];
	[entriesSet addObject:newEntry];
	[newEntry setValue:userObj forKey:@"Record"];
}
+(myPREntry*) EntryFromObject:(NSManagedObject*)obj
{
	myPREntry* tmp =[[[myPREntry alloc] init] autorelease];
	
	tmp.Date = [obj valueForKey:@"Date"];
	tmp.Value = [[obj valueForKey:@"Value"] floatValue];
	return tmp;
}
+(void) EditEntry:(myPREntry*)entry ToObject:(NSManagedObject*)obj
{
	[obj setValue:entry.Date forKey:@"Date"];
	[obj setValue:[NSNumber numberWithFloat:entry.Value] forKey:@"Value"];
}
+(void) DeleteEntry:(NSManagedObject*)entry FromObject:(NSManagedObject*)user FromContext:(NSManagedObjectContext*)context
{
	NSMutableSet *entriesSet = [user mutableSetValueForKey:@"Entries"];
	
	[entriesSet removeObject:entry];
	[context deleteObject:entry];
	entriesSet = [user mutableSetValueForKey:@"Entries"];	
}
/*


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
	tmp.Water = [[obj valueForKey:@"Water"] floatValue];
	tmp.Fat = [[obj valueForKey:@"Fat"] floatValue];
	return tmp;
}
+(void) EditEntry:(wgtWeightEntry*)entry ToObject:(NSManagedObject*)obj
{
	[obj setValue:entry.Date forKey:@"Date"];
	[obj setValue:[NSNumber numberWithFloat:entry.Weight] forKey:@"Weight"];
	[obj setValue:[NSNumber numberWithInt:entry.Water] forKey:@"Water"];
	[obj setValue:[NSNumber numberWithInt:entry.Fat] forKey:@"Fat"];
}*/

@end
