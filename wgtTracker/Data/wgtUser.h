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
}
@property(nonatomic,retain) NSString* Name;
@property BOOL IsMale;
@property float Height;


+(void) AddUser:(wgtUser*)usr ToContext:(NSManagedObjectContext*)context;
+(wgtUser*) UserFromObject:(NSManagedObject*)obj;
@end
