//
//  myPRmeterUnitHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRmeterUnitHandler.h"


@implementation myPRmeterUnitHandler

-(id)init
{
	self = [super init];
	if(self)
	{
		self.key=myPRUnitHandlerTypeMeterDistance;
		self.Name=@"Disance in meters.";
		self.Sample=@"(e.g. 1024 m)";
		self.Unit=@"m";
	}
	return self;
}

-(NSString*)StringFromValue:(float)f
{
	return [NSString stringWithFormat:@"%1.0f m",f];
}
-(float)FloatFromPicker:(UIPickerView*)p
{
	float returnVal=0;
	returnVal=  [p selectedRowInComponent:0]*1000+
				[p selectedRowInComponent:1]*100+
				[p selectedRowInComponent:2]*10+
	[p selectedRowInComponent:3];
	
	return returnVal;
}
-(void)SetPicker:(UIPickerView*)p withValue:(float)f
{
	int i = floor(f);
	[p selectRow:i/1000 inComponent:0 animated:YES];
	[p selectRow:(i%1000)/100 inComponent:1 animated:YES];
	[p selectRow:(i%100)/10 inComponent:2 animated:YES];
	[p selectRow:(i%10) inComponent:3 animated:YES];
}

-(NSMutableArray*)CreatePickerDataSource
{
	NSMutableArray*returnArray = [[NSMutableArray alloc]init];
	
	for (int i=0; i<4; i++) {
		NSMutableArray*tmpArray = [[NSMutableArray alloc]init];
		for(int j=0;j<10;j++)
		{
			[tmpArray addObject:[NSString stringWithFormat:@"%d",j]];
		}
		[returnArray addObject:tmpArray];
		[tmpArray release];
	}
	
	[returnArray addObject:[NSArray arrayWithObject:@"m"]];
	
	return returnArray;
}

@end
