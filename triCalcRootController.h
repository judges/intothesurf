//
//  triCalcRootController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class triCalcSettings;
@class triCalcDataSelect;
@class triCalcPickerController;
@class triCalcTriathlonTime;

@interface triCalcRootController : UIViewController {

	
	UIToolbar *toolBar;
	triCalcSettings *settings;
	UISegmentedControl *topRightSegmentControl;
	UISegmentedControl *topLeftSegmentControl;
	UISegmentedControl *bottomSegmentControl;
	UIPickerView *picker;
	
	
	triCalcDataSelect *Time;
	triCalcDataSelect *Distance;
	triCalcDataSelect *Paste;
	triCalcDataSelect *RaceTime;
	
	
	triCalcDataSelect *T1;
	triCalcDataSelect *T2;
	
	int first;
	int second;
	int third;
	
	
	int currentMode; 
	int currentScreen;
	int currentEdit;
	
	
	triCalcPickerController * pickerController;
	
	triCalcTriathlonTime * triathlonTime;
	
}
@property(nonatomic,retain) IBOutlet UIPickerView *picker;
@property(nonatomic,retain) IBOutlet UIToolbar* toolBar;
@property(nonatomic,retain) IBOutlet UISegmentedControl *topLeftSegmentControl;
@property(nonatomic,retain) IBOutlet UISegmentedControl *topRightSegmentControl;
@property(nonatomic,retain) IBOutlet UISegmentedControl *bottomSegmentControl;

-(void)animatePace;
-(void)animateTime;
-(void)animateDistance;

-(id)initWithSettings:(triCalcSettings*)settings;

-(IBAction) typeChanged:(id)sender;
-(IBAction) metricChanged:(id)sender;
-(IBAction) screenChanged:(id)sender;

-(void)updateScreen;

-(void)toTransition;
-(void)fromTransition;

-(void)edit:(id)sender;

-(void)selectDistance:(id)sender;
-(void)distanceSelected:(NSNumber*)newDistance;

@end
