//
//  myPRchartViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPRUnitHandler.h"
#import "myPRSettings.h"
#import "myPRPlotHandler.h"

@interface myPRchartViewController : UIViewController<CPPlotDataSource> {
	CPGraphHostingView *GraphHost;
	
	NSArray* _dataArray;
	myPRUnitHandler* _unitHandler;
	myPRSettings* _settings;
	
	float _xFactor;
	
	NSMutableArray* _horizontalPlots;
	NSDate *_firstDay;
	myPRPlotHandler* _plotHandler;
}
@property (nonatomic, retain) IBOutlet CPGraphHostingView *GraphHost;
-(id)initWithDataArray:(NSArray*)arr Handler:(myPRUnitHandler*) unitHandler;

-(void)SetSettings:(myPRSettings*)s;
-(void)prepareGraph;
-(void)prepareXAxis:(CPXYAxis*)xAxis;
-(void)prepareYAxis:(CPXYAxis*)yAxis;



@end
