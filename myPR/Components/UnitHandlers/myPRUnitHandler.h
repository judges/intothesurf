//
//  myPRUnitHandler.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	myPRUnitHandlerTypeMeterDistance =0,
	myPRUnitHandlerTypeKgWeight = 1
} myPRUnitHandlerType;

@interface myPRUnitHandler : NSObject {
	
	myPRUnitHandlerType key;
	
	NSString*Name;
	NSString*Sample;
	NSString*Unit;
}
@property myPRUnitHandlerType key;
@property(nonatomic,retain)NSString* Name;
@property(nonatomic,retain)NSString*Sample;
@property(nonatomic,retain)NSString*Unit;


-(NSString*)StringFromValue:(float)f;
-(float)FloatFromPicker:(UIPickerView*)p;
-(NSMutableArray*)CreatePickerDataSource;
-(void)SetPicker:(UIPickerView*)p withValue:(float)f;
@end
