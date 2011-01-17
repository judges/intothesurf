//
//  wgtWeightGraphViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-03.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wgtBasePlotHandler.h"
#include "wgtSettings.h"

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
	wgtSettings*_settings;
	
	UIBarButtonItem *weightButton;
	UIBarButtonItem *fatButton;
	UIBarButtonItem *waterButton;
	UIBarButtonItem *bmiButton;
	UIBarButtonItem *txtButton;
	UIBarButtonItem *shareButton;
	UIToolbar *toolbar;
}
@property(nonatomic,retain)CPScatterPlot* currentPlot;
@property(nonatomic,retain)wgtBasePlotHandler* plotHandler;

@property(nonatomic,retain) IBOutlet UIBarButtonItem *weightButton;
@property(nonatomic,retain) IBOutlet  UIBarButtonItem *fatButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *waterButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *bmiButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *txtButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic,retain) IBOutlet UIToolbar *toolbar;

-(IBAction)weightAction;
-(IBAction)fatAction;
-(IBAction)waterAction;
-(IBAction)bmiAction;
-(IBAction)textAction;

-(IBAction)shareAction;


-(void)clearButtons;

-(id)initWithDataArray:(NSArray*)arr User:(wgtUser*)usr;
-(void)SetSettings:(wgtSettings*)s;

-(void)prepareGraph;
-(void)prepareXAxis:(CPXYAxis*)xAxis;
-(void)prepareYAxis:(CPXYAxis*)yAxis;

@property (nonatomic, retain) IBOutlet CPGraphHostingView *graphHost;
@end
