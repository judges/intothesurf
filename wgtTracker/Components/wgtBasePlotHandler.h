//
//  wgtBasePlotHandler.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "wgtUser.h"
#include "wgtWeightEntry.h"

@interface wgtBasePlotHandler : NSObject {
@protected
//	NSArray* pointRange;
	float factor;
	int minValue;
	int maxValue;
	CPScatterPlot* plot;
	
	
	NSArray* dataArray;
	wgtUser* user;
}
//protected, to ovveride.
-(void)initAPlot:(CPScatterPlot*)inPlot;
-(void)setUpFactorAndPointRange;
-(NSArray*)createLabelArray;




//public they go.
-(id)initWithData:(NSArray*)data User:(wgtUser*)usr;
-(void)Initialize:(CPScatterPlot*)inPlot;
-(void)PrepareYLabels:(CPXYAxis*)yAxis;
-(NSNumber*)NumberForRecordIndex:(NSUInteger)index;
-(CPScatterPlot*)GetAPlot;
-(CPLayer*)LabelForRecordIndex:(NSUInteger)index;
-(NSNumber*)NumberTargetWeight;
@end
