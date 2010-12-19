//
//  triCalcPickerController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcPickerController.h"


@implementation triCalcPickerController

-(id)init
{
	self =[super init];
	if(self)
	{
		array = [[NSMutableArray alloc]init];
	}
	
	return self;
}


-(void)setPicker:(UIPickerView*)p
{
	picker = p;
}

-(void)SetTime:(BOOL)miles Current:(float)c
{
	[array removeAllObjects];

	NSMutableArray* hArray = [[NSMutableArray alloc]init];
	for(int i=0; i<24; i++)
	{
		[hArray addObject:[NSString stringWithFormat:@"%d hrs",i]];
	}
	
	[array addObject:hArray];
	[hArray release];
	
	NSMutableArray *mArray = [[NSMutableArray alloc] init];
	for(int i=0;i<60;i++)
	{
		[mArray addObject:[NSString stringWithFormat:@"%d mins",i]];
	}
	
	[array addObject:mArray];
	[mArray release];
	
	NSMutableArray *sArray = [[NSMutableArray alloc] init];
	for(int i=0;i<60;i++)
	{
		[sArray addObject:[NSString stringWithFormat:@"%d secs",i]];
	}
	
	[array addObject:sArray];
	[sArray release];
	
	[picker reloadAllComponents];
	
	int time = floor(c);
	int h= time/3600;
	int m = (time % 3600)/60;
	int s = time % 60;
	
	[picker selectRow:h inComponent:0 animated:YES ];
	[picker selectRow:m inComponent:1 animated:YES ];
	[picker selectRow:s inComponent:2 animated:YES ];
}
-(void)SetPace:(BOOL)miles Current:(float)c
{
	[array removeAllObjects];
	

	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<80;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%i",i]];
	}
	
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray *fArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<99;i++)
	{
		[fArray addObject:[NSString stringWithFormat:@".%i",i]];
	}
	
	[array addObject:fArray];
	[fArray release];
	
	[picker reloadAllComponents];
	
	
	int dec = floor(c);
	int frac = floor(c*100) ;
	frac = frac % 100;
	
	[picker selectRow:dec inComponent:0 animated:YES ];
	[picker selectRow:frac inComponent:1 animated:YES ];

	
}

-(void)SetNone
{
	[array removeAllObjects];
	NSMutableArray*empty =[[NSMutableArray alloc]init];
	[array addObject:empty];
	[empty release];
	[picker reloadAllComponents];
}
-(void)SetDistance:(BOOL)miles Current:(float)c
{
	[array removeAllObjects];
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<200;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%i km",i]];
	}
	
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray *fArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<99;i++)
	{
		[fArray addObject:[NSString stringWithFormat:@"%i0 m",i]];
	}
	
	[array addObject:fArray];
	[fArray release];
	
	[picker reloadAllComponents];
	
	int dec = floor(c);
	int frac = floor(c*100) ;
	frac = frac % 100;
	
	[picker selectRow:dec inComponent:0 animated:YES ];
	[picker selectRow:frac inComponent:1 animated:YES ];
	
	
}


-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[[NSNotificationCenter defaultCenter]postNotificationName:@"pickerChanged" object:nil];
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return  [[array objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[array objectAtIndex:component] objectAtIndex:row];
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	
	return [array count];
}


-(float)GetValue:(int)x
{
	float result = 0;
	switch (x) {
		case 0: //Time
			result = 3600 * [picker selectedRowInComponent:0]
			+ 60 * [picker selectedRowInComponent:1]
			+ [picker selectedRowInComponent:2];
			break;
		case 1: //Distance
			result = [picker selectedRowInComponent:0]
			+ ((float)[picker selectedRowInComponent:1])/100;
			break;
		case 2:
			result = [picker selectedRowInComponent:0]
			+ ((float)[picker selectedRowInComponent:1])/100;
			break;
		case 3:
			result = 60 * [picker selectedRowInComponent:1]
						+ [picker selectedRowInComponent:2];
			break;
			
		default:
			break;
	}
	
	return result;
	
}

-(void) dealloc
{
	[array release];
	[super dealloc];
}

@end
