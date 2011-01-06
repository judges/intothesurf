//
//  User.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-25.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface wgtUser : NSObject {
	NSString* Name;
	BOOL IsMale;
	float Height;
	BOOL UseImperial;
	int TargetWeight;
}
@property(nonatomic,retain) NSString* Name;
@property BOOL IsMale;
@property float Height;
@property BOOL UseImperial;
@property int TargetWeight;

+(void) AddUser:(wgtUser*)usr ToContext:(NSManagedObjectContext*)context;
+(wgtUser*) UserFromObject:(NSManagedObject*)obj;
+(void) EditUser:(wgtUser*)usr ToObject:(NSManagedObject*)obj;

+(NSArray*) GetWeights:(NSManagedObject*)obj ToContext:(NSManagedObjectContext*)context;

-(NSString*)FormatHeight;
+(NSString*)FormatWeight:(float)wgt UseImp:(BOOL)imp;

+(float)BMIforWeight:(float)w andHeight:(float)h;
@end
