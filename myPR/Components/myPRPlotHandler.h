//
//  myPRPlotHandler.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-24.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myPRUnitHandler.h"
#import "myPREntry.h"

@interface myPRPlotHandler : NSObject {
	float factor;
	int minValue;
	int maxValue;
	CPScatterPlot* plot;
	
	myPRUnitHandler* _unitHandler;
	NSArray* dataArray;
	
}
//protected, to ovveride.
-(void)initAPlot:(CPScatterPlot*)inPlot;
-(void)setUpFactorAndPointRange;
-(NSArray*)createLabelArray;




//public they go.
-(id)initWithData:(NSArray*)data Handler:(myPRUnitHandler*)uh;
-(void)Initialize:(CPScatterPlot*)inPlot;
-(void)PrepareYLabels:(CPXYAxis*)yAxis;
-(NSNumber*)NumberForRecordIndex:(NSUInteger)index;
-(CPScatterPlot*)GetAPlot;
-(CPLayer*)LabelForRecordIndex:(NSUInteger)index;
-(NSNumber*)NumberTargetWeight;

@end
