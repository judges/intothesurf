//
//  wgtWeightPlotHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtWeightPlotHandler.h"


@implementation wgtWeightPlotHandler 

-(CPLayer*)LabelForRecordIndex:(NSUInteger)index
{
	if(index == [dataArray count]-1)
	{
		wgtWeightEntry* wgtEntry = [dataArray lastObject];
			
		NSString* str = [wgtUser FormatWeight:wgtEntry.Weight UseImp:user.UseImperial];
		
		CPTextStyle* textStyle = [[CPTextStyle alloc]init];
		textStyle.color= [CPColor lightGrayColor];
		CPTextLayer* test = [[CPTextLayer alloc] initWithText:str style:textStyle];
		[test setPaddingLeft:10];
		return test;
	}
	else
	{
		return nil;
	}
}


-(void)initAPlot:(CPScatterPlot*)inPlot
{
	 plot = inPlot;
	[plot setLabelOffset:3];
	 plot.identifier = @"weight";
	 plot.dataLineStyle.lineWidth = 3.0f;
	 plot.dataLineStyle.lineColor = [CPColor whiteColor];
	 CPColor *areaColor = [CPColor colorWithComponentRed:0.3 green:1.0 blue:0.3 alpha:0.3];
	 CPGradient *areaGradient = [CPGradient gradientWithBeginningColor:areaColor endingColor:[CPColor clearColor]];
	 areaGradient.angle=-90.0f;
	 CPFill *areaGradientFill = [CPFill fillWithGradient:areaGradient];
	 plot.areaFill  =areaGradientFill;
	 plot.areaBaseValue = CPDecimalFromString(@"1.75");
	 CPPlotSymbol *blueCirclePlotSymbol = [CPPlotSymbol ellipsePlotSymbol];
	 blueCirclePlotSymbol.fill = [CPFill fillWithColor:[CPColor blueColor]];
	 blueCirclePlotSymbol.size = CGSizeMake(6.0, 6.0);
	 plot.plotSymbol = blueCirclePlotSymbol;
}


-(NSArray*)createLabelArray
{
	NSMutableArray *outArray = [[NSMutableArray alloc] init];
	
	for(int i=0;i<10;i++)
	{
		float diff = maxValue - minValue;
		
		int number= minValue + (diff/10)*i;
		
		
		[outArray addObject:[NSString stringWithFormat:@"%d",number]];
	}
	
	NSString* str;
	if(user.UseImperial)
	{
		str = @"lbs";
	}
	else
	{
		str =@"kg";
	}
	
	[outArray addObject:str];
	return outArray;
}

-(NSNumber*)NumberForRecordIndex:(NSUInteger)index
{
	wgtWeightEntry* wgtEntry = [dataArray objectAtIndex:index];
	
	float value;
	if(user.UseImperial)
	{
		value =wgtEntry.Weight / 453.59;
	}
	else 
	{
		value= wgtEntry.Weight/1000;
	}
	
	value -=minValue;
	return [NSNumber numberWithFloat:10+ value / factor];
}



-(void)setUpFactorAndPointRange
{

	float minimum =user.TargetWeight;
	float maximum =user.TargetWeight;
		
	for(int i=0;i<[dataArray count];i++)
	{
		wgtWeightEntry* wgtEntry= [dataArray objectAtIndex:i];
		if(minimum > wgtEntry.Weight)
		{
			minimum = wgtEntry.Weight;
		}
		
		if(maximum < wgtEntry.Weight)
		{
			maximum = wgtEntry.Weight;
		}
	}
	int seed;
	float maxDiff;
	if(user.UseImperial)
	{
		minimum = minimum/453.59;
		maximum = maximum/453.59;
		
		seed = 20;
		maxDiff= 20;
	}
	else
	{
		minimum = minimum/1000;
		maximum = maximum/1000;
		
		seed = 10;
		maxDiff=10;
		
	}
	float  difference  = maximum - minimum;
	factor = 0;
	
	while (factor==0)
	{
		if(difference < maxDiff)
		{
			maxDiff+=10; //just in case
			factor = maxDiff/ 100.0;
		}
		else 
		{
			maxDiff+=seed;
		}
	}
	
	minValue = ((int)(minimum / 10)) * 10;
	maxValue = minValue + maxDiff;
	

}

@end
