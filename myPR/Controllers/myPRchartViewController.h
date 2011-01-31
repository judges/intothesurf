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
	
	UIToolbar* Toolbar;
	UIBarButtonItem* TxtButton;
	UIBarButtonItem* ShareButton;
	
	NSString*_str;
	
}
@property (nonatomic, retain) IBOutlet CPGraphHostingView *GraphHost;
@property (nonatomic, retain) IBOutlet UIToolbar* Toolbar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* TxtButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* ShareButton;

-(IBAction) txtAction;
-(IBAction) shareAcition;

-(id)initWithDataArray:(NSArray*)arr Handler:(myPRUnitHandler*) unitHandler;
-(void)SetRecordName:(NSString*)str;
-(void)SetSettings:(myPRSettings*)s;
-(void)prepareGraph;
-(void)prepareXAxis:(CPXYAxis*)xAxis;
-(void)prepareYAxis:(CPXYAxis*)yAxis;



@end
