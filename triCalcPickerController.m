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
		widths = [[NSMutableArray alloc]init];
		MILEFACTOR = 0.621371192;
	}
	
	return self;
}


-(void)setPicker:(UIPickerView*)p
{
	picker = p;
}

-(void)SetTransit:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:100]];
	[widths addObject:[NSNumber numberWithInt:100]];
	
	
	
	useMile = miles;
	calculationsType = 4;

	[array removeAllObjects];
	
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

	int m = time/60;
	int s = time % 60;
	
	[picker selectRow:m inComponent:0 animated:YES ];
	[picker selectRow:s inComponent:1 animated:YES ];
}

-(void)SetTime:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:100]];
	[widths addObject:[NSNumber numberWithInt:100]];
	[widths addObject:[NSNumber numberWithInt:100]];
	
	useMile = miles;
	calculationsType = 0;
	
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

-(void)SetAvgSpeed:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:50]];
	[widths addObject:[NSNumber numberWithInt:50]];
	[widths addObject:[NSNumber numberWithInt:80]];
	
	
	useMile = miles;
	calculationsType = 2;
	[array removeAllObjects];
	
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<80;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%i",i]];
	}
	
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray *fArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<100;i++)
	{
		[fArray addObject:[NSString stringWithFormat:@".%i",i]];
	}
	
	[array addObject:fArray];
	[fArray release];
	
	[picker reloadAllComponents];
	
	float val;
	
	if(miles)
	{
		val = MILEFACTOR * c;
	}
	else 
	{
		val = c;
	}

	NSMutableArray * descArray= [[NSMutableArray alloc]init];
	if(miles)
	{
		[descArray addObject:@"mph"];
	}
	else
	{
		[descArray addObject:@"kph"];
	}

	[array addObject:descArray];
	[descArray release];
	
	int dec = floor(val);
	int frac = floor(val*100) ;
	frac = frac % 100;
	
	[picker selectRow:dec inComponent:0 animated:YES ];
	[picker selectRow:frac inComponent:1 animated:YES ];
	
}

-(void)SetRunPace:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:50]];
	[widths addObject:[NSNumber numberWithInt:50]];
	[widths addObject:[NSNumber numberWithInt:100]];
	
	
	useMile = miles;
	calculationsType = 21;
	[array removeAllObjects];
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	for(int i=0;i<20;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%d",i]];
	}
	[array addObject:dArray];
	[dArray release];
	
	dArray = [[NSMutableArray alloc]init];
	for(int i=0;i<60;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%02d",i]];
	}
	[array addObject:dArray];
	[dArray release];
	
	
	NSMutableArray * descArray= [[NSMutableArray alloc]init];
	if(miles)
	{
	[descArray addObject:@"per mile"];
	}
	else {
		[descArray addObject:@"per km"];
	}

	[array addObject:descArray];
	[descArray release];
	
	
	
	float val = c; //seconds per kilometer.
	
	if(miles)
	{
		val = val* MILEFACTOR;
	}


	
	if(val==0)
	{
		val = 0;
	}
	else
	{
		val = 3600/val; 
	}	
	
	int minutes = val /60;
	if(minutes >19)
	{
		minutes = 19;
	}
	int seconds = floor(val);
	seconds = seconds% 60;
	
	[picker reloadAllComponents];
	
	[picker selectRow:minutes inComponent:0 animated:YES ];
	[picker selectRow:seconds inComponent:1 animated:YES ];
	
}

-(void)SetSwimPace:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:90]];
	[widths addObject:[NSNumber numberWithInt:90]];
	[widths addObject:[NSNumber numberWithInt:120]];
	
	useMile = miles;
	calculationsType = 22;
	[array removeAllObjects];
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	for(int i=0;i<20;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%d mins",i]];
	}
	[array addObject:dArray];
	[dArray release];
	
	dArray = [[NSMutableArray alloc]init];
	for(int i=0;i<60;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%02d secs",i]];
	}
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray * descArray= [[NSMutableArray alloc]init];
	[descArray addObject:@"per 100m"];
	[array addObject:descArray];
	[descArray release];
	
	float val; //seconds per kilometer.
	
	if(c==0)
	{
		val = 0;
	}
	else
	{
		val = 3600/c; 
	}	
	val = val /10; // because per 100 meters.
	
	int minutes = val /60;
	if(minutes >19)
	{
		minutes = 19;
	}
	int seconds = floor(val);
	seconds = seconds% 60;
	
	[picker reloadAllComponents];
	
	[picker selectRow:minutes inComponent:0 animated:YES ];
	[picker selectRow:seconds inComponent:1 animated:YES ];

	
}

-(void)SetNone
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:60]];
	
	[array removeAllObjects];
	NSMutableArray *em = [[NSMutableArray alloc]init];
	[em addObject:@"0"];
	[array addObject:em];
	[em release];
	em = [[NSMutableArray alloc]init];
	[em addObject:@"0"];
	[array addObject:em];
	[em release];
	em = [[NSMutableArray alloc]init];
	[em addObject:@"0"];
	[array addObject:em];
	[em release];
	em = [[NSMutableArray alloc]init];
	[em addObject:@"0"];
	[array addObject:em];
	[em release];
	
	calculationsType = -1;

	[picker reloadAllComponents];
}
-(void)SetDistanceForSwim:(BOOL)miles Current:(float)c
{
	useMile = miles;
	if(miles)
	{
		[widths removeAllObjects];
		[widths addObject:[NSNumber numberWithInt:50]];
		[widths addObject:[NSNumber numberWithInt:50]];
		[widths addObject:[NSNumber numberWithInt:90]];
		
		calculationsType=12;
		
		[array removeAllObjects];
		
		NSMutableArray *dArray = [[NSMutableArray alloc]init];
		
		
		for(int i=0;i<10;i++)
		{
			[dArray addObject:[NSString stringWithFormat:@"%d",i]];
		}
		
		[array addObject:dArray];
		[dArray release];
		
		NSMutableArray *fArray = [[NSMutableArray alloc]init];
		
		
		for(int i=0;i<100;i++)
		{
			[fArray addObject:[NSString stringWithFormat:@".%02d",i]];
		}
		
		[array addObject:fArray];
		[fArray release];
		
		NSMutableArray * descArray= [[NSMutableArray alloc]init];
		[descArray addObject:@"miles"];
		[array addObject:descArray];
		[descArray release];
		
		
		
		[picker reloadAllComponents];
		
		float val = c * MILEFACTOR;
		
		int dec = floor(val);
		int frac = floor(val*100) ;
		frac = frac % 100;
		
	
		
		
		[picker selectRow:dec inComponent:0 animated:YES ];
		[picker selectRow:frac inComponent:1 animated:YES ];
	}
	else 
	{
		[widths removeAllObjects];
		[widths addObject:[NSNumber numberWithInt:40]];
		[widths addObject:[NSNumber numberWithInt:40]];
		[widths addObject:[NSNumber numberWithInt:40]];
		[widths addObject:[NSNumber numberWithInt:40]];
		[widths addObject:[NSNumber numberWithInt:100]];
		
		
		calculationsType=11;
		
		[array removeAllObjects];
		NSMutableArray *dArray = [[NSMutableArray alloc]init];
		for(int i=0;i<31;i++)
		{
			[dArray addObject:[NSString stringWithFormat:@"%i",i]];
		}
		[array addObject:dArray];
		[dArray release];
		
		dArray = [[NSMutableArray alloc]init];
		for(int i=0;i<10;i++)
		{
			[dArray addObject:[NSString stringWithFormat:@"%i",i]];
		}
		[array addObject:dArray];
		[dArray release];
		
		dArray = [[NSMutableArray alloc]init];
		for(int i=0;i<10;i++)
		{
			[dArray addObject:[NSString stringWithFormat:@"%i",i]];
		}
		[array addObject:dArray];
		[dArray release];
		
		dArray = [[NSMutableArray alloc]init];
		for(int i=0;i<10;i++)
		{
			[dArray addObject:[NSString stringWithFormat:@"%i",i]];
		}
		[array addObject:dArray];
		[dArray release];
		
		NSMutableArray * descArray= [[NSMutableArray alloc]init];
		[descArray addObject:@"meters"];
		[array addObject:descArray];
		[descArray release];
		
		
		[picker reloadAllComponents];
		
		int x = floor(c*1000);
		
		
		[picker selectRow:x/1000 inComponent:0 animated:YES ];
		[picker selectRow:(x%1000)/100 inComponent:1 animated:YES ];
		[picker selectRow:(x%100)/10 inComponent:2 animated:YES ];
		[picker selectRow:(x%10)%1 inComponent:3 animated:YES ];
		
	}
	
}
-(void)SetDistanceForRun:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:100]];
	
	useMile = miles;
	calculationsType=13;
	[array removeAllObjects];
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<200;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%i",i]];
	}
	
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray *fArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<100;i++)
	{
		[fArray addObject:[NSString stringWithFormat:@"%02d0",i]];
	}
	
	[array addObject:fArray];
	[fArray release];
	
	NSMutableArray * descArray= [[NSMutableArray alloc]init];

	[descArray addObject:@"meters"];
	[array addObject:descArray];
	[descArray release];
	
	
	[picker reloadAllComponents];
	
	
	float val = c;

	int dec = floor(val);
	int frac = floor(val*100) ;
	frac = frac % 100;
	
	[picker selectRow:dec inComponent:0 animated:YES ];
	[picker selectRow:frac inComponent:1 animated:YES ];
}

-(void)SetDistance:(BOOL)miles Current:(float)c
{
	[widths removeAllObjects];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:60]];
	[widths addObject:[NSNumber numberWithInt:100]];
	
	useMile = miles;
	calculationsType=1;
	[array removeAllObjects];
	
	NSMutableArray *dArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<200;i++)
	{
		[dArray addObject:[NSString stringWithFormat:@"%i",i]];
	}
	
	[array addObject:dArray];
	[dArray release];
	
	NSMutableArray *fArray = [[NSMutableArray alloc]init];
	
	
	for(int i=0;i<100;i++)
	{
		[fArray addObject:[NSString stringWithFormat:@".%02d",i]];
	}
	
	[array addObject:fArray];
	[fArray release];
	
	NSMutableArray * descArray= [[NSMutableArray alloc]init];
	if(miles)
	{
		[descArray addObject:@"miles"];
	}
	else
	{
		[descArray addObject:@"km"];
	}
	
	[array addObject:descArray];
	[descArray release];
	
	
	
	
	[picker reloadAllComponents];
	
	
	float val = c;
	
	if(miles)
	{
		val =MILEFACTOR * val;
	}
	
	int dec = floor(val);
	int frac = floor(val*100) ;
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

-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	if([widths count] >0)
	{
		return [[widths objectAtIndex:component] intValue];
	}
	else
	{
		return 30;
	}
		
}

-(float)GetValue
{
	float result = 0;
	switch (calculationsType) {
		case 0: //Time
			result = 3600 * [picker selectedRowInComponent:0]
			+ 60 * [picker selectedRowInComponent:1]
			+ [picker selectedRowInComponent:2];
			break;
		case 1: //Distance
		case 12://Distance for swim per Mile
			result = [picker selectedRowInComponent:0]
			+ ((float)[picker selectedRowInComponent:1])/100;
			if (useMile) {
				result = result / MILEFACTOR;
			}
			break;
		case 11: //Distance for swim per Km
			result = ((float)[picker selectedRowInComponent:0]) +
					 ((float)[picker selectedRowInComponent:1]) /10 +
					 ((float)[picker selectedRowInComponent:2]) /100 +
					 ((float)[picker selectedRowInComponent:3]) /1000;
			break;
		case 13: //Distance for run by Mile
			result = [picker selectedRowInComponent:0]
			+ ((float)[picker selectedRowInComponent:1])/100;
			
			break;
		case 2: // get avg speed
			result = [picker selectedRowInComponent:0]
			+ ((float)[picker selectedRowInComponent:1])/100;
			if(useMile)
			{
				result = result/MILEFACTOR;
			}
			break;
		case 21: 
			result = [picker selectedRowInComponent:0] +
			((float)[picker selectedRowInComponent:1]) /60;
			if(result !=0)
			{
				result = (60 / result);
			}
			if(useMile)
			{
				result =result / MILEFACTOR;
			}
			break;
		case 22:
			result = [picker selectedRowInComponent:0] +
			((float)[picker selectedRowInComponent:1]) /60;
			if(result !=0)
			{
				result = (60 / result);
				result = result/10; //because given is per 100 meters.
			}
			break;
		case 4:
			result = 60 * [picker selectedRowInComponent:0]
						+ [picker selectedRowInComponent:1];
			break;
			
		default:
			break;
	}
	
	return result;
	
}

-(void) dealloc
{
	[array release];
	[widths release];
	[super dealloc];
}

@end
