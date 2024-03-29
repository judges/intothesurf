//
//  triCalcPickerController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface triCalcPickerController : NSObject<UIPickerViewDataSource,UIPickerViewDelegate> {
	UIPickerView *picker;
	
	NSMutableArray* array;
	
	NSMutableArray* widths;
	
	float MILEFACTOR; 
	int calculationsType;
	BOOL useMile;
}

-(void)setPicker:(UIPickerView*)p;
-(void)SetTransit:(BOOL)miles Current:(float)c;
-(void)SetTime:(BOOL)miles Current:(float)c;
-(void)SetAvgSpeed:(BOOL)miles Current:(float)c;
-(void)SetRunPace:(BOOL)miles Current:(float)c;
-(void)SetSwimPace:(BOOL)miles Current:(float)c;
-(void)SetDistance:(BOOL)miles Current:(float)c;
-(void)SetDistanceForSwim:(BOOL)miles Current:(float)c;
-(void)SetDistanceForRun:(BOOL)miles Current:(float)c;
-(void)SetNone;


-(float)GetValue;
@end
