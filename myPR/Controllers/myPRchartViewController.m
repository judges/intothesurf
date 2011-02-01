//
//  myPRchartViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRchartViewController.h"
#import "myPREntry.h"
#import "myPRTextEntryViewController.h"
#import "SHK.h"

@implementation myPRchartViewController
@synthesize GraphHost, Toolbar,ShareButton,TxtButton;

-(id)initWithDataArray:(NSArray*)arr Handler:(myPRUnitHandler*) unitHandler
{
	self= [super initWithNibName:@"myPRchartViewController" bundle:nil];
	if(self)
	{
		_dataArray = arr;
		[_dataArray retain];
		_unitHandler = unitHandler;
		[_unitHandler retain];
		
		_horizontalPlots = [[NSMutableArray alloc] init];
		for(int i=0;i<10;i++)
		{
			CPScatterPlot *backgroundPlot =  [[[CPScatterPlot alloc] initWithFrame:GraphHost.frame ]autorelease];
			backgroundPlot.identifier = @"backgroundPlot";
			backgroundPlot.dataLineStyle.lineWidth = 1.0f;
			backgroundPlot.dataLineStyle.lineColor = [CPColor darkGrayColor];
			backgroundPlot.dataLineStyle.dashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:5],nil];
			backgroundPlot.dataSource = self;	
			[_horizontalPlots addObject:backgroundPlot];
		}
	}
	return self;
	
}

-(void)SetSettings:(myPRSettings*)s
{
	_settings = s;
	[_settings retain];
}

-(void)prepareGraph
{
	CPXYGraph * _graph = [[CPXYGraph alloc] initWithFrame: self.view.bounds];
	
	CPTheme *theme = [CPTheme themeNamed:kCPDarkGradientTheme];
	[_graph applyTheme:theme];
	
	
	self.GraphHost.hostedGraph=nil;
	self.GraphHost.hostedGraph = _graph;
	[_graph release];
	
	_graph.paddingLeft = 5.0;
	_graph.paddingTop = 10.0;
	_graph.paddingRight = 5.0;
	_graph.paddingBottom = 5.0;
	
	CPXYPlotSpace *plotSpace = (CPXYPlotSpace *)_graph.defaultPlotSpace;
	plotSpace.xRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(-20) 
												   length:CPDecimalFromFloat(145)];
	plotSpace.yRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(-15) 
												   length:CPDecimalFromFloat(130)];
	
	
	CPXYAxisSet *axisSet = (CPXYAxisSet *)_graph.axisSet;
	
	axisSet.xAxis.visibleRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromInt(0) length:CPDecimalFromInt(130)];
	axisSet.yAxis.visibleRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromInt(0) length:CPDecimalFromInt(125)];
	
	
	CPLineStyle *lineStyle = [CPLineStyle lineStyle];
	lineStyle.lineColor = [CPColor blackColor];
	lineStyle.lineWidth = 2.0f;
	
	
	_plotHandler = [[myPRPlotHandler alloc] initWithData:_dataArray Handler:_unitHandler];
	
	CPScatterPlot* currentPlot = [[CPScatterPlot alloc] initWithFrame:GraphHost.frame ];
	currentPlot.dataSource = self;	
	[_plotHandler Initialize:currentPlot];
	[currentPlot release];
	
	[_graph addPlot: [_plotHandler GetAPlot]];
	
	[self prepareXAxis:axisSet.xAxis];
	[self prepareYAxis:axisSet.yAxis];
	
	
	for(int i=0;i<[_horizontalPlots count];i++)
	{
		[_graph addPlot:[_horizontalPlots objectAtIndex:i]];	
	}
	
		
	
}
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
	

	NSDate* date1=((myPREntry*) [_dataArray objectAtIndex:0]).Date;
	_firstDay = date1;
	[_firstDay retain];
	
	NSDate* date2=((myPREntry*) [_dataArray lastObject]).Date;
	
	
	int daysDiff =[date2 timeIntervalSinceDate: date1] / 86400;
	//[self GetDayDifferenceD1:date1 D2:date2];
	
	_xFactor = 100/ (float)daysDiff ;
	
	
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
	
	[_plotHandler PrepareYLabels:yAxis];
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self prepareGraph];
	
	
	self.navigationItem.title = _str;
	Toolbar.tintColor=_settings.TintColor;
	
	UIBarButtonItem *split = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	
	[Toolbar setItems:[NSArray arrayWithObjects:TxtButton,split,ShareButton,nil]];
	[split release];
}

-(void)SetRecordName:(NSString*)str
{
	_str = str;
	[_str retain];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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

-(NSUInteger) numberOfRecordsForPlot:(CPPlot *)plot
{
	return [_dataArray count];
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
		int i =[_horizontalPlots indexOfObject:plot];
		return [NSNumber numberWithInt:10+ i*10];
	}
}


-(CPLayer *) dataLabelForPlot:(CPPlot *)plot recordIndex:(NSUInteger)index
{
	if(plot == [_plotHandler GetAPlot])
	{
		return [_plotHandler LabelForRecordIndex:index];
	} 
	else {
		return nil;
	}

}

-(NSNumber *) numberForPlot:(CPPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)i
{
	if([_horizontalPlots containsObject:plot])
	{
		return [self numberForBackgroundPlot:plot field:fieldEnum recordIndex:i];
	}
	else
	{
		if(fieldEnum == CPScatterPlotFieldX)
		{
			myPREntry* dEntry =  [_dataArray objectAtIndex:i]; 
			
			int dayDiff =[dEntry.Date timeIntervalSinceDate: _firstDay] / 86400;
			return [NSNumber numberWithFloat:(10+ _xFactor*dayDiff)];
			
		}
		else
		{
			return [_plotHandler NumberForRecordIndex:i];
		}
		
	}
	return nil;
}

-(IBAction) txtAction
{
	myPRTextEntryViewController* vc = [[myPRTextEntryViewController alloc] init];
	[vc SetSettings:_settings];
	[self.navigationController pushViewController:vc animated:YES];
	[vc release];
	
}
-(IBAction) shareAcition
{
	
	UIGraphicsBeginImageContext(CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height-44));
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(ctx, 0.0, self.view.bounds.size.height-44);
	CGContextScaleCTM(ctx, 1, -1);
	[self.view.layer renderInContext:ctx];
	
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	SHKItem *item = [SHKItem image:viewImage title:[[NSUserDefaults standardUserDefaults] stringForKey:@"myPRTextEntry"]];
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
	
	[actionSheet showInView:self.view];
	
	
}


- (void)dealloc {
	self.Toolbar=nil;
	self.TxtButton=nil;
	self.ShareButton=nil;
	[_str release];
	[_plotHandler release];
	[_settings release];
	[_unitHandler release];
	[_dataArray release];
	self.GraphHost=nil;
    [super dealloc];
}


@end
