//
//  User.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-25.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtUser.h"


@implementation wgtUser
@synthesize Name,Height,IsMale,UseImperial,TargetWeight;


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
}

+(NSArray*) GetWeights:(NSManagedObject*)obj ToContext:(NSManagedObjectContext*)context
{
	NSMutableSet * toRet = [obj mutableSetValueForKey:@"WeightEntries"];
	
	//NSArray*tmpArray = [toRet allObjects];
	
	//return tmpArray;
	
	NSSortDescriptor * descriptor = [[[NSSortDescriptor alloc] initWithKey:@"Date" ascending:NO] autorelease];
	
	
	NSArray * sortedtoRet = [[toRet allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
	return sortedtoRet;
 
}

+(NSString*)FormatWeight:(float)wgt UseImp:(BOOL)imp
{
	if(imp)
	{
		int lbs = round(wgt/ 453.59);
		
		return [NSString stringWithFormat:@"%d lbs",lbs];
	}
	else
	{
		int kg = wgt/1000;
		int g = ((int)wgt%1000)/10;
		return [NSString stringWithFormat:@"%d.%02d kg",kg,g];
	}

	
}

-(NSString*)FormatHeight
{
	if(UseImperial)
	{
		int inches = round(Height / 2.54);
		int feet = inches/12;
		inches = inches%12;
		
		return [NSString stringWithFormat:@"%d ft %d inch",feet,inches];
	}
	else
	{
		int meters = Height/100;
		int cm = ((int)Height) %100;
		
		return [NSString stringWithFormat:@"%d m %02d cm",meters,cm];
	}
}

+(float)BMIforWeight:(float)w andHeight:(float)h
{
	float kg = w/1000;
	float m = h /100;
	
	return kg/(m*m);
	
}

@end
