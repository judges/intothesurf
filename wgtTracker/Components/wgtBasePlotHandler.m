//
//  wgtBasePlotHandler.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtBasePlotHandler.h"


@implementation wgtBasePlotHandler

-(id)initWithData:(NSArray*)data User:(wgtUser*)usr
{
	self = [super init];
	if(self)
	{
		dataArray = data;
		user = usr;
	}
	return self;
}

-(void)initAPlot:(CPScatterPlot*)inPlot
{}
-(void)setUpFactorAndPointRange
{}

-(void)Initialize:(CPScatterPlot*)inPlot;
{
	[self initAPlot:inPlot];
	[self setUpFactorAndPointRange];
}

-(CPLayer*)LabelForRecordIndex:(NSUInteger)index
{
	return nil;
}

-(NSNumber*)NumberTargetWeight
{
	
	float value;
	if(user.UseImperial)
	{
		value =user.TargetWeight / 453.59;
	}
	else 
	{
		value= user.TargetWeight/1000;
	}
	
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
-(NSArray*)createLabelArray
{
	return nil;
}
-(NSNumber*)NumberForRecordIndex:(NSUInteger)index
{

}
-(CPScatterPlot*)GetAPlot
{
	return plot;
}





@end
