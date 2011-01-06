//
//  wgtWeightGraphViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-03.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wgtBasePlotHandler.h"


@interface wgtWeightGraphViewController : UIViewController<CPPlotDataSource> {
	CPXYGraph *graph;
	CPGraphHostingView *graphHost;
	
	NSArray* dataArray;
	float xFactor;
	NSDate *firstDay;
	
	NSMutableArray* horizontalPlots;

	wgtBasePlotHandler* plotHandler;
	CPScatterPlot* currentPlot;	
	CPScatterPlot*targerWeightPlot;
	int currentPlotType;
	/*
	 0 - weight
	 1 - BMI
	 2 - Fat
	 3 - Water
	 */
	
	wgtUser* user;
	
	UIBarButtonItem *weightButton;
}
@property(nonatomic,retain)CPScatterPlot* currentPlot;
@property(nonatomic,retain)wgtBasePlotHandler* plotHandler;

@property(nonatomic,retain) IBOutlet UIBarButtonItem *weightButton;

-(IBAction)weightAction;
-(IBAction)fatAction;
-(IBAction)waterAction;
-(IBAction)bmiAction;



-(id)initWithDataArray:(NSArray*)arr User:(wgtUser*)usr;


-(void)prepareGraph;
-(void)prepareXAxis:(CPXYAxis*)xAxis;
-(void)prepareYAxis:(CPXYAxis*)yAxis;

@property (nonatomic, retain) IBOutlet CPGraphHostingView *graphHost;
@end
