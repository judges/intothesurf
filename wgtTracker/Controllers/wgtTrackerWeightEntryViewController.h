//
//  wgtTrackerWeightEntryViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "wgtWeightPicker.h"
@class wgtTrackerUserWeightViewController;
#include "wgtWeightEntry.h"
#include "wgtUser.h"
#import "wgtPercentPicker.h"

@interface wgtTrackerWeightEntryViewController : UIViewController {
	
	UIView*currentPicker;

	
	UIPickerView* weightPicker;
	UIDatePicker* datePicker;
	UIPickerView* fatPicker;
	UIPickerView* waterPicker;
	
	wgtTrackerUserWeightViewController* owner;
	wgtWeightPicker* pickerController;
	wgtWeightEntry* currentEntry;
	wgtUser* currentUser;
	wgtPercentPicker *fatPickerController;
	wgtPercentPicker *waterPickerController;
	
	UIButton* weightButton;
	UIButton* dateButton;
	UIButton* fatButton;
	UIButton* waterButton;
	
	
	bool datePickerVisible;
	bool weightPickerVisible;
}

-(IBAction)highlihting;
-(void)clearHighlihting;
-(id)initWithOwner:(wgtTrackerUserWeightViewController*)own Entry:(wgtWeightEntry*)entry User:(wgtUser*)usr;

-(wgtWeightEntry*)getCurrentEntry;

@property(nonatomic,retain)IBOutlet UIPickerView* weightPicker;
@property(nonatomic,retain)IBOutlet UIDatePicker* datePicker;
@property(nonatomic,retain)IBOutlet UIPickerView* fatPicker;
@property(nonatomic,retain)IBOutlet UIPickerView* waterPicker;

@property(nonatomic,retain)IBOutlet UIButton* weightButton;
@property(nonatomic,retain)IBOutlet UIButton* dateButton;
@property(nonatomic,retain)IBOutlet UIButton* fatButton;
@property(nonatomic,retain)IBOutlet UIButton* waterButton;

-(IBAction)Cancel;
-(IBAction)Done;
-(IBAction)EditWeight;
-(IBAction)EditDate;
-(IBAction)EditFat;
-(IBAction)EditWater;

-(void)setPickers;
-(IBAction)pickersChanged;
-(void)updateView;

-(NSDate*)ClearDate:(NSDate*)d;

@end
