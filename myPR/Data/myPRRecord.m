//
//  myPRRecord.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRRecord.h"


@implementation myPRRecord
@synthesize Name,Icon,Unit,Label;

-(id)init
{
	self = [super 
			init];
	if(self)
	{
		self.Unit=0;
	}
	
	return self;
}


+(void) AddRecord:(myPRRecord*)rec ToContext:(NSManagedObjectContext*)context
{
	NSManagedObject* newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:context];
	
	[newObject setValue:  rec.Name forKey:@"Name"];
	[newObject setValue: rec.Icon forKey:@"Icon"];
	[newObject setValue:[NSNumber numberWithInt:rec.Unit] forKey:@"Unit"];
	[newObject setValue: rec.Label forKey:@"Label"];
	
}
+(myPRRecord*) RecordFromObject:(NSManagedObject*)obj
{
	myPRRecord* r= [[[myPRRecord alloc] init] autorelease];
	r.Name = [obj valueForKey:@"Name"];
	r.Icon = [obj valueForKey:@"Icon"] ;
	r.Unit = [[obj valueForKey:@"Unit"] intValue];
	r.Label =  [obj valueForKey:@"Label"] ;
	
	return r;
}
+(void) EditRecord:(myPRRecord*)rec ToObject:(NSManagedObject*)obj
{
	[obj setValue:  rec.Name forKey:@"Name"];
	[obj setValue: rec.Icon forKey:@"Icon"];
	[obj setValue:[NSNumber numberWithInt:rec.Unit] forKey:@"Unit"];
	[obj setValue: rec.Label forKey:@"Label"];
}

+(NSArray*) GetEntries:(NSManagedObject*)obj ToContext:(NSManagedObjectContext*)context
{
	NSMutableSet * toRet = [obj mutableSetValueForKey:@"Entries"];
	
	//NSArray*tmpArray = [toRet allObjects];
	
	//return tmpArray;
	
	NSSortDescriptor * descriptor = [[[NSSortDescriptor alloc] initWithKey:@"Date" ascending:NO] autorelease];
	
	
	NSArray * sortedtoRet = [[toRet allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
	return sortedtoRet;
}

/*
+(void) AddUser:(wgtUser*)usr ToContext:(NSManagedObjectContext*)context
{
	NSManagedObject* newObject = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
	
	[newObject setValue:  usr.Name forKey:@"Name"];
	[newObject setValue: [NSNumber numberWithFloat:usr.Height] forKey:@"Height"];
	[newObject setValue:[NSNumber numberWithBool:usr.IsMale] forKey:@"IsMale"];
	[newObject setValue:[NSNumber numberWithBool:usr.UseImperial] forKey:@"UseImperial"];
	[newObject setValue:[NSNumber numberWithFloat:usr.TargetWeight] forKey:@"TargetWeight"];
}

+(wgtUser*) UserFromObject:(NSManagedObject*)obj
{
	wgtUser * u = [[[wgtUser alloc]init]autorelease];
	u.Name = [obj valueForKey:@"Name"];
	u.Height = [[obj valueForKey:@"Height"] floatValue];
	u.IsMale = [[obj valueForKey:@"IsMale"] boolValue];
	u.UseImperial =  [[obj valueForKey:@"UseImperial"] boolValue];
	u.TargetWeight = [[obj valueForKey:@"TargetWeight"] floatValue];
	return u;
}
+(void) EditUser:(wgtUser*)usr ToObject:(NSManagedObject*)obj
{
	[obj setValue:  usr.Name forKey:@"Name"];
	[obj setValue: [NSNumber numberWithFloat:usr.Height] forKey:@"Height"];
	[obj setValue:[NSNumber numberWithBool:usr.IsMale] forKey:@"IsMale"];
	[obj setValue:[NSNumber numberWithBool:usr.UseImperial] forKey:@"UseImperial"];
	[obj setValue:[NSNumber numberWithFloat:usr.TargetWeight] forKey:@"TargetWeight"];
}*/


-(void) dealloc
{
	self.Name=nil;
	self.Icon=nil;
	self.Label=nil;
	
	[super dealloc];
}
@end
