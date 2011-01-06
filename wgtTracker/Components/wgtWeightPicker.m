//
//  wgtWeightPicker.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtWeightPicker.h"


@implementation wgtWeightPicker
	

-(id)initWithPicker:(UIPickerView*)p Owner:(id)own Selector:(SEL)sel;
{
	self = [super init];
	if(self)
	{
		owner = own;
		selector = sel;
		picker =p;
		
		lbsArray = [[NSMutableArray alloc]init];
		kgArray = [[NSMutableArray alloc]init];
		
		
		for(int i=0;i<3;i++)
		{
			NSMutableArray *tmpLbsArray = [[NSMutableArray alloc] init];
			for(int j=0;j<10;j++)
			{
				[tmpLbsArray addObject:[NSString stringWithFormat:@"%d",j]];
			}
			[lbsArray addObject:tmpLbsArray];
			[tmpLbsArray release];
		}
		
		[lbsArray addObject:[NSMutableArray arrayWithObject:@"lbs"]];
		
		NSMutableArray *kgdecArray = [[NSMutableArray alloc] init];
		for(int i=0;i<200;i++)
		{
			[kgdecArray addObject:[NSString stringWithFormat:@"%d",i]];
		}
		[kgArray addObject:kgdecArray];
		[kgdecArray release];
		
		NSMutableArray *kgfracArray = [[NSMutableArray alloc] init];
		for(int i=0;i<200;i++)
		{
			[kgfracArray addObject:[NSString stringWithFormat:@".%02d",i]];
		}
		[kgArray addObject:kgfracArray];
		[kgfracArray release];
		[kgArray addObject:[NSMutableArray arrayWithObject:@"kg"]];
		
		currentArray = lbsArray;
		
		[picker setDelegate:self];
		[picker setDataSource:self];
	}
	return self;
	
}
-(float)GetWeight
{
	if(currentArray == lbsArray)
	{
		int tmpW = [picker selectedRowInComponent:0]*100
		+ [picker selectedRowInComponent:1]*10
		+ [picker selectedRowInComponent:2];
		
		return (float)tmpW * 453.59;
	}
	else
	{
		int tmpW = [picker selectedRowInComponent:0]*1000 +
		 [picker selectedRowInComponent:1]*10;
		return tmpW;
	}

}
-(void)SetWeight:(float)wgt
{
	if(currentArray == lbsArray)
	{
		int lbs = round(wgt / 453.59);
		int x = lbs/100;
		int y = (lbs%100)/10;
		int z = lbs%10;
		
		[picker selectRow:x inComponent:0 animated:YES];
		[picker selectRow:y inComponent:1 animated:YES];
		[picker selectRow:z inComponent:2 animated:YES];
		
	}
	else
	{
		int x = wgt / 1000;
		int y = ((int)wgt) % 1000;
		y =y /10;
		[picker selectRow:x inComponent:0 animated:YES];
		[picker selectRow:y inComponent:1 animated:YES];
	}

}
-(void)SetUseImperial:(BOOL)useImp
{
	int tmpW = [self GetWeight];
	if(useImp)
	{
		currentArray = lbsArray;
	}
	else 
	{
		currentArray = kgArray;
	}
	[picker reloadAllComponents];
	[self SetWeight:tmpW];
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [currentArray count];
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[ currentArray objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[currentArray objectAtIndex:component]objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[owner performSelector:selector];
}


-(void) dealloc
{
	[lbsArray release];
	[kgArray release];
	[super dealloc];
}
@end
