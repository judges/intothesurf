//
//  wgtPercentPicker.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtPercentPicker.h"


@implementation wgtPercentPicker

-(id)initWithPicker:(UIPickerView*)p Owner:(id)own Selector:(SEL)sel MinPercent:(int)min MaxPercent:(int)max
{
	self = [super init];
	if(self)
	{
		owner = own;
		selector = sel;
		picker =p;
		minValue = min;
		
		dataArray = [[NSMutableArray alloc]init];
		
		for(int i=0;i<3;i++)
		{
			NSMutableArray *arr =[[NSMutableArray alloc] init];
			for(int j=0;j<10;j++)
			{
				
				if(i==0)
				{
					if((j*10) <= max && (j*10)>=min)
					{
						[arr addObject:[NSString stringWithFormat:@"%d",j]];
						//add
					}
				}
				else
				{
					if(i==2)
					{
					[arr addObject:[NSString stringWithFormat:@".%d",j]];
					}
					else 
					{
						[arr addObject:[NSString stringWithFormat:@"%d",j]];
					}

				}				
			}
			[dataArray addObject:arr];
			[arr release];
		}
		
		[dataArray addObject:[NSArray arrayWithObject:@"%"]];
		
		
		p.dataSource = self;
		p.delegate = self;
	}
	return self;
}
-(float)GetPercent
{
	
	float percent = 	10 * ([picker selectedRowInComponent:0] +(minValue/10))
	+ [picker selectedRowInComponent:1];
	
	float frac = [picker selectedRowInComponent:2];
	frac = frac/10;
	percent +=frac;
	return percent;
	
}
-(void)SetPercent:(float)per
{
	
	int decimal = floor(per*10);
	[picker selectRow:decimal/100 - minValue/10 inComponent:0 animated:YES];
	[picker selectRow:(decimal%100)/10 inComponent:1 animated:YES];
	[picker selectRow:decimal%10 inComponent:1 animated:YES];
}



-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return [dataArray count];
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [[ dataArray objectAtIndex:component] count];
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[dataArray objectAtIndex:component]objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[owner performSelector:selector];
}





- (void)dealloc {
    [super dealloc];
}


@end
