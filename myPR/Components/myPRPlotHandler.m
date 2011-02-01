//
//  myPRPlotHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRPlotHandler.h"


@implementation myPRPlotHandler
-(id)initWithData:(NSArray*)data Handler:(myPRUnitHandler*)uh
{
	self = [super init];
	if(self)
	{
		dataArray = data;
		_unitHandler = uh;
	}
	return self;
}



-(void)Initialize:(CPScatterPlot*)inPlot;
{
	[self initAPlot:inPlot];
	[inPlot retain];
	[self setUpFactorAndPointRange];
}



-(NSNumber*)NumberTargetWeight
{
	
	float value;

	
	value -=minValue;
	return [NSNumber numberWithFloat:10+ value / factor];
	
}

-(void)PrepareYLabels:(CPXYAxis*)yAxis
{
	NSMutableArray* pointArray = [[NSMutableArray alloc]init];
	for(int i=0;i<11;i++)
	{
		[pointArray addObject:[NSDecimalNumber numberWithInt: 10+ i*10]];
	}
	NSArray* labelArray= [self createLabelArray];
	
	
	//[yAxis setMajorTickLocations:[NSSet setWithArray:pointArray]];
	
	NSUInteger labelLocation = 0;	
	NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[labelArray count]];
	for (NSNumber *tickLocation in pointArray) {
		CPAxisLabel *newLabel = [[CPAxisLabel alloc] initWithText: [labelArray objectAtIndex:labelLocation++] textStyle:yAxis.labelTextStyle];
		newLabel.tickLocation = [tickLocation decimalValue];
		//newLabel.majorTickLocations = [tickLocation decimalValue];
		newLabel.offset = yAxis.labelOffset + yAxis.majorTickLength; 
		//[newLabel setRotation:-1.0f];
		[customLabels addObject:newLabel];
		[newLabel release];
	}
	
	
	
	yAxis.axisLabels =  [NSSet setWithArray:customLabels];
	
	
	
	[pointArray release];
	[labelArray release];
	
}

-(CPScatterPlot*)GetAPlot
{
	return plot;
}



-(CPLayer*)LabelForRecordIndex:(NSUInteger)index
{
	if(index == [dataArray count]-1)
	{
		myPREntry* wgtEntry = [dataArray lastObject];
		
		
		
		NSString* str =[_unitHandler StringFromValue:wgtEntry.Value];
		
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



-(void)setUpFactorAndPointRange
{
	float minimum =((myPREntry*)[dataArray lastObject]).Value;
	float maximum =((myPREntry*)[dataArray lastObject]).Value;
	
	for(int i=0;i<[dataArray count];i++)
	{
		myPREntry* wgtEntry= [dataArray objectAtIndex:i];
		if(minimum > wgtEntry.Value)
		{
			minimum = wgtEntry.Value;
		}
		
		if(maximum < wgtEntry.Value)
		{
			maximum = wgtEntry.Value;
		}
	}
	int seed =20;
	float maxDiff=20;
	
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


-(NSArray*)createLabelArray
{
	NSMutableArray *outArray = [[NSMutableArray alloc] init];
	
	for(int i=0;i<10;i++)
	{
		float diff = maxValue - minValue;
		
		int number= minValue + (diff/10)*i;
		
		
		[outArray addObject:[NSString stringWithFormat:@"%d",number]];
	}
	
	[outArray addObject:_unitHandler.Unit];
	return outArray;
}
-(NSNumber*)NumberForRecordIndex:(NSUInteger)index
{
	myPREntry* wgtEntry = [dataArray objectAtIndex:index];
	
	float value = wgtEntry.Value;
		
	value -=minValue;
	return [NSNumber numberWithFloat:10+ value / factor];
	
}

-(void) dealloc
{
	[plot release];
	[super dealloc];
}

@end
