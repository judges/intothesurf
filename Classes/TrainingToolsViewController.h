//
//  TrainingTools.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButtonViewController;

@interface TrainingToolsViewController : UIViewController {                    
	CustomButtonViewController* pace;
	CustomButtonViewController* weight;
	CustomButtonViewController* triCalc;
}

-(void) paceCalculatorTouchUp;
-(void) weightTouchUp;
-(void) TriathlonCoachTouchUp;
@end
