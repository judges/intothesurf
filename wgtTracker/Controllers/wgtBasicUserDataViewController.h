//
//  BasicUserDataViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-30.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wgtUser.h"
#import "wgtTrackerRootViewController.h"
#import "wgtSettings.h"
@interface wgtBasicUserDataViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {

	wgtUser* localUser;
	wgtTrackerRootViewController* parent;
	
	UITextField* nameTextField;
	UIButton* heightButton;
	UISegmentedControl* segmentControl;
	UISegmentedControl* unitSegment;
	UIPickerView* pickerView;
	
	NSMutableArray* imperialData;
	
	NSMutableArray* metricData;
	
	NSMutableArray* currentSource;
	
	bool pickerIsUp;
	
	UIToolbar*toolBar;
	UIBarButtonItem*cancelButton;
	UIBarButtonItem*doneButton;
	wgtSettings* _settings;
	
	UIToolbar* toolbar;
}
@property(nonatomic,retain) IBOutlet UITextField* nameTextField;
@property(nonatomic,retain) IBOutlet UIButton* heightButton;
@property(nonatomic,retain) IBOutlet UISegmentedControl* segmentControl;
@property(nonatomic,retain) IBOutlet UISegmentedControl* unitSegment;
@property(nonatomic,retain) IBOutlet UIPickerView* pickerView;
@property(nonatomic,retain) IBOutlet UIToolbar*toolBar;
@property(nonatomic,retain) IBOutlet UIBarButtonItem*cancelButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem*doneButton;
@property(nonatomic,retain) IBOutlet UIToolbar* toolbar;
-(void)initPicker;
-(id)initWithParentViewController:(wgtTrackerRootViewController*)p;
-(id)initWithParentViewController:(wgtTrackerRootViewController*)p AndUser:(wgtUser*)usr;
-(void)setSettings:(wgtSettings*)s;
-(wgtUser*)getUser;


-(IBAction) Done;
-(IBAction) Cancel;
-(IBAction) HeightEdit;
-(IBAction) NameEdit;
-(IBAction) MetricChanged;

-(void)UpdateView;
-(void)SetPicker;


@end
