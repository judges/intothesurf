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
}

-(void)setPicker:(UIPickerView*)p;

-(void)SetTime:(BOOL)miles Current:(float)c;
-(void)SetPace:(BOOL)miles Current:(float)c;
-(void)SetDistance:(BOOL)miles Current:(float)c;
-(void)SetNone;

-(float)GetValue:(int)e;
@end
