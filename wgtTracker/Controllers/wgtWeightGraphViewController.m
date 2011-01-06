//
//  wgtWeightGraphViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-03.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "wgtWeightGraphViewController.h"
#import "wgtWeightEntry.h"
#import "wgtBasePlotHandler.h"
#import "wgtWeightPlotHandler.h"
#import "wgtBMIPlotHandler.h"
#import "wgtFatPlotHandler.h"
#import "wgtWaterPlotHandler.h"

@implementation wgtWeightGraphViewController
@synthesize graphHost;
@synthesize weightButton;
@synthesize currentPlot;
@synthesize plotHandler;


-(void)prepareGraph
{
	
	/*for (int i = 0; i < [[self.view subviews] count]; i++ ) {
		[[[self.view subviews] objectAtIndex:i] removeFromSuperview];
	}*/
	self.currentPlot = nil;
	self.plotHandler =nil;
	
	switch (currentPlotType) {
		case 0:
			plotHandler = [[wgtWeightPlotHandler alloc] initWithData:dataArray User:user];
			break;
		case 1:
			plotHandler = [[wgtBMIPlotHandler alloc] initWithData:dataArray User:user];
			break;
		case 2:
			plotHandler = [[wgtFatPlotHandler alloc] initWithData:dataArray User:user];
			break;
		case 3:
			plotHandler = [[wgtWaterPlotHandler alloc] initWithData:dataArray User:user];
			break;
		default:
			break;
	}
	currentPlot = [[CPScatterPlot alloc] initWithFrame:graphHost.frame ];
	currentPlot.dataSource = self;	
	[plotHandler Initialize:currentPlot];
	
	graph = [[CPXYGraph alloc] initWithFrame: self.view.bounds];
	
	CPTheme *theme = [CPTheme themeNamed:kCPDarkGradientTheme];
	[graph applyTheme:theme];
	
	
	self.graphHost.hostedGraph=nil;
	self.graphHost.hostedGraph = graph;
	[graph release];
	
	graph.paddingLeft = 5.0;
	graph.paddingTop = 10.0;
	graph.paddingRight = 5.0;
	graph.paddingBottom = 5.0;
	
	CPXYPlotSpace *plotSpace = (CPXYPlotSpace *)graph.defaultPlotSpace;
	plotSpace.xRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(-20) 
												   length:CPDecimalFromFloat(145)];
	plotSpace.yRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(-15) 
												   length:CPDecimalFromFloat(130)];
	
	
	CPXYAxisSet *axisSet = (CPXYAxisSet *)graph.axisSet;
	
	axisSet.xAxis.visibleRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromInt(0) length:CPDecimalFromInt(130)];
	axisSet.yAxis.visibleRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromInt(0) length:CPDecimalFromInt(125)];
	
	
	CPLineStyle *lineStyle = [CPLineStyle lineStyle];
	lineStyle.lineColor = [CPColor blackColor];
	lineStyle.lineWidth = 2.0f;
	
	[self prepareXAxis:axisSet.xAxis];
	[self prepareYAxis:axisSet.yAxis];
	
	
	for(int i=0;i<[horizontalPlots count];i++)
	{
		[graph addPlot:[horizontalPlots objectAtIndex:i]];	
	}
	
	[graph addPlot: [plotHandler GetAPlot]];
	
	if(currentPlotType==0)
	{
		[graph addPlot:targerWeightPlot	];
	}
}

-(IBAction)weightAction
{
	currentPlotType=0;
	[self prepareGraph];
}
-(IBAction)fatAction
{
	currentPlotType=2;
	[self prepareGraph];
}
-(IBAction)waterAction
{
	currentPlotType=3;
	[self prepareGraph];
}
-(IBAction)bmiAction
{
	currentPlotType=1;	
	[self prepareGraph];
}

-(NSUInteger) numberOfRecordsForPlot:(CPPlot *)plot
{
	return [dataArray count];
}

-(NSNumber*) numberForBackgroundPlot:(CPPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
	if(fieldEnum == CPScatterPlotFieldX)
	{
		if(index ==0)
		{
			return [NSNumber numberWithInt:1];
		}
		else
		{
			return [NSNumber numberWithInt:120];
		}
	}
	else
	{
		int i =[horizontalPlots indexOfObject:plot];
		return [NSNumber numberWithInt:10+ i*10];
	}
}

-(CPLayer *) dataLabelForPlot:(CPPlot *)plot recordIndex:(NSUInteger)index
{
	if(plot == currentPlot)
	{
		return [plotHandler LabelForRecordIndex:index];
	}
	return nil;
}

-(NSNumber *) numberForPlot:(CPPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)i
{
	if([horizontalPlots containsObject:plot])
	{
		return [self numberForBackgroundPlot:plot field:fieldEnum recordIndex:i];
	}
	else if(plot == targerWeightPlot)
	{
		if(fieldEnum == CPScatterPlotFieldX)
		{
			if(i==0)
			{
				return [NSNumber numberWithInt:0];
			}
			else
			{
				return [NSNumber numberWithInt:110];
			}
		}
		else
		{
			return [plotHandler NumberTargetWeight];
		}
	}else
	{
		if(fieldEnum == CPScatterPlotFieldX)
		{
			wgtWeightEntry* dEntry =  [dataArray objectAtIndex:i]; 
			
			int dayDiff =[dEntry.Date timeIntervalSinceDate: firstDay] / 86400;
			return [NSNumber numberWithFloat:(10+ xFactor*dayDiff)];
		
		}
		else
		{
			return [plotHandler NumberForRecordIndex:i];
		}

	}
	return nil;
}

-(id)initWithDataArray:(NSArray*)arr User:(wgtUser*)usr
{
	self = [super init];
	if(self)
	{
		user = usr;
		dataArray = arr;
		[dataArray retain];
		
		horizontalPlots = [[NSMutableArray alloc]init];
		
		for(int i=0;i<10;i++)
		{
			CPScatterPlot *backgroundPlot =  [[[CPScatterPlot alloc] initWithFrame:graphHost.frame ]autorelease];
			backgroundPlot.identifier = @"backgroundPlot";
			backgroundPlot.dataLineStyle.lineWidth = 1.0f;
			backgroundPlot.dataLineStyle.lineColor = [CPColor darkGrayColor];
			backgroundPlot.dataLineStyle.dashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:5],nil];
			backgroundPlot.dataSource = self;	
			[horizontalPlots addObject:backgroundPlot];
		}
		
		targerWeightPlot=   [[CPScatterPlot alloc] initWithFrame:graphHost.frame];
		targerWeightPlot.identifier = @"targetWeight";
		targerWeightPlot.dataLineStyle.lineWidth = 3.0f;
		targerWeightPlot.dataLineStyle.lineColor = [CPColor greenColor];
		targerWeightPlot.dataSource = self;	
		
		currentPlotType = 0;
		
	}
	
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}*/


-(void)prepareXAxis:(CPXYAxis*)xAxis
{
	CPLineStyle *lineStyle = [CPLineStyle lineStyle];
	lineStyle.lineColor = [CPColor blackColor];
	lineStyle.lineWidth = 2.0f;
	
	
	xAxis.labelingPolicy = CPAxisLabelingPolicyNone;
	xAxis.majorTickLineStyle = lineStyle;
	xAxis.axisLineStyle = lineStyle;
	xAxis.majorTickLength = 3.0f;
	xAxis.labelOffset=3.0;
	
	NSDate* date1=((wgtWeightEntry*) [dataArray objectAtIndex:0]).Date;
	firstDay = date1;
	[firstDay retain];
	
	NSDate* date2=((wgtWeightEntry*) [dataArray lastObject]).Date;
	
	
	int daysDiff =[date2 timeIntervalSinceDate: date1] / 86400;
	 //[self GetDayDifferenceD1:date1 D2:date2];
	
	xFactor = 100/ (float)daysDiff ;
	
	
	NSArray *customTickLocations;
	NSArray *xAxisLabels;
	NSDateFormatter* dateFormatter =[[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:@"MMM-dd"];
	NSTimeInterval dayInterval = 86400;
	if(daysDiff >2)
	{
			customTickLocations = [NSArray arrayWithObjects:
								   [NSDecimalNumber numberWithInt:10],
								   [NSDecimalNumber numberWithDouble:43.3333],
								   [NSDecimalNumber numberWithInt:76.6666],
								   [NSDecimalNumber numberWithInt:110],nil];
			xAxisLabels = [NSArray arrayWithObjects:
						   [dateFormatter stringFromDate:date1],
						   [dateFormatter stringFromDate:[NSDate dateWithTimeInterval: dayInterval * (int)(daysDiff/3)  sinceDate:date1]],
						   [dateFormatter stringFromDate:[NSDate dateWithTimeInterval: dayInterval * (int)(2*daysDiff/3)  sinceDate:date1]],
						   [dateFormatter stringFromDate:date2]
						   ,nil];
			
	}
	else
	{
		customTickLocations = [NSArray arrayWithObjects:
							   [NSDecimalNumber numberWithInt:10],
							   [NSDecimalNumber numberWithInt:110],nil];
		xAxisLabels = [NSArray arrayWithObjects:
							[dateFormatter stringFromDate:date1],
							[dateFormatter stringFromDate:date2]
							,nil];
	}

	[xAxis setMajorTickLocations:[NSSet setWithArray:customTickLocations]];
	
	NSUInteger labelLocation = 0;	
	NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
	for (NSNumber *tickLocation in customTickLocations) {
		CPAxisLabel *newLabel = [[CPAxisLabel alloc] initWithText: [xAxisLabels objectAtIndex:labelLocation++] textStyle:xAxis.labelTextStyle];
		newLabel.tickLocation = [tickLocation decimalValue];
		//newLabel.majorTickLocations = [tickLocation decimalValue];
		newLabel.offset = xAxis.labelOffset + xAxis.majorTickLength; 
		//[newLabel setRotation:-1.0f];
		[customLabels addObject:newLabel];
		[newLabel release];
	}

	xAxis.axisLabels =  [NSSet setWithArray:customLabels];
	
}

-(void)prepareYAxis:(CPXYAxis*)yAxis
{
	CPLineStyle *lineStyle = [CPLineStyle lineStyle];
	lineStyle.lineColor = [CPColor blackColor];
	lineStyle.lineWidth = 2.0f;
	
	yAxis.majorIntervalLength = [[NSNumber numberWithInt:10] decimalValue];//[NSDecimalNumber decimalNumberWithString:@"5"];
	yAxis.minorTicksPerInterval = 1;
	yAxis.majorTickLineStyle = lineStyle;
	yAxis.minorTickLineStyle = nil;
	yAxis.axisLineStyle = lineStyle;
	yAxis.minorTickLength = 5.0f;
	yAxis.majorTickLength = 7.0f;
	yAxis.labelingPolicy = CPAxisLabelingPolicyNone;

	[plotHandler PrepareYLabels:yAxis];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	[self prepareGraph];
	
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[horizontalPlots release];
	[targerWeightPlot release];
    [super dealloc];
}


@end
