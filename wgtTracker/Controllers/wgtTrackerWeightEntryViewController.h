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
#import "wgtSettings.h"

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
	
	wgtSettings* _settings;
	
	UIBarButtonItem* cancelButton;
	UIBarButtonItem* doneButton;
	UIToolbar* toolbar;
}

-(IBAction)highlihting;
-(void)clearHighlihting;
-(id)initWithOwner:(wgtTrackerUserWeightViewController*)own Entry:(wgtWeightEntry*)entry User:(wgtUser*)usr;

-(void)SetSettings:(wgtSettings*)s;

-(wgtWeightEntry*)getCurrentEntry;

@property(nonatomic,retain)IBOutlet UIPickerView* weightPicker;
@property(nonatomic,retain)IBOutlet UIDatePicker* datePicker;
@property(nonatomic,retain)IBOutlet UIPickerView* fatPicker;
@property(nonatomic,retain)IBOutlet UIPickerView* waterPicker;

@property(nonatomic,retain)IBOutlet UIButton* weightButton;
@property(nonatomic,retain)IBOutlet UIButton* dateButton;
@property(nonatomic,retain)IBOutlet UIButton* fatButton;
@property(nonatomic,retain)IBOutlet UIButton* waterButton;

@property(nonatomic,retain)IBOutlet UIBarButtonItem* cancelButton;
@property(nonatomic,retain)IBOutlet UIBarButtonItem* doneButton;
@property(nonatomic,retain)IBOutlet UIToolbar* toolbar;

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
