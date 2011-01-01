//
//  User.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-25.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtUser.h"


@implementation wgtUser
@synthesize Name,Height,IsMale;


-(void) dealloc
{
	self.Name=nil;
	[super dealloc];
}

+(void) AddUser:(wgtUser*)usr ToContext:(NSManagedObjectContext*)context
{
	NSManagedObject* newObject = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
	
	[newObject setValue:  usr.Name forKey:@"Name"];
	[newObject setValue: [NSNumber numberWithFloat:usr.Height] forKey:@"Height"];
	[newObject setValue:[NSNumber numberWithBool:usr.IsMale] forKey:@"IsMale"];
}

+(wgtUser*) UserFromObject:(NSManagedObject*)obj
{
	wgtUser * u = [[[wgtUser alloc]init]autorelease];
	u.Name = [obj valueForKey:@"Name"];
	u.Height = [[obj valueForKey:@"Height"] floatValue];
	u.IsMale = [[obj valueForKey:@"IsMale"] boolValue];
	return u;
}


@end
