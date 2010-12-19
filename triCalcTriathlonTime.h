//
//  triCalcTriathlonTime.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface triCalcTriathlonTime : NSObject {

	
	
	BOOL useMile;
	
	NSMutableArray *array;
}

-(void)updateUseMile:(BOOL)m;
-(void)updateValue:(float)v InEdit:(int)e InScreen:(int)s  InMode:(int)m;

-(float)GetValueInEdit:(int)e InScreen:(int)s;




@property BOOL useMile;



@end
