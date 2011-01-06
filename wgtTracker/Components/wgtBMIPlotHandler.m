//
//  wgtBMIPlotHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtBMIPlotHandler.h"


@implementation wgtBMIPlotHandler

-(CPLayer*)LabelForRecordIndex:(NSUInteger)index
{
	if(index == [dataArray count]-1)
	{
		wgtWeightEntry* wgtEntry = [dataArray lastObject];
		
		float value = [wgtUser BMIforWeight:wgtEntry.Weight andHeight:user.Height];
		
		NSString* str = [NSString stringWithFormat:@"%1.2f",value];
		
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
	plot.identifier = @"bmi";
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
	blueCirclePlotSymbol.size = CGSizeMake(12.0, 12.0);
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
	
	[outArray addObject:@"BMI"];
	return outArray;
}

-(NSNumber*)NumberForRecordIndex:(NSUInteger)index
{
	wgtWeightEntry* wgtEntry = [dataArray objectAtIndex:index];
	
	float value = [wgtUser BMIforWeight:wgtEntry.Weight andHeight:user.Height];
	
	value -=minValue;
	return [NSNumber numberWithFloat:10+ value / factor];
}


-(void)setUpFactorAndPointRange
{
	factor = 0.5;
	
	minValue = 10;
	maxValue = 60;
}

@end
