//
//  PasteCalculatorViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PasteCalculatorViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
	UISegmentedControl* segment;
	UIPickerView* picker;
	
	UILabel *mkTestField;
	UIButton *distanceTextField;
	
	UIButton *timeTextField;
	UILabel *perWhat;
	UILabel *paceLabel;

	bool lock;
	int editMode;
	
	
	float distance;
	int time;
	
	NSMutableArray *pickerDataArray;
}

@property(nonatomic,retain) IBOutlet UISegmentedControl* segment;
@property(nonatomic,retain)	IBOutlet UIPickerView* picker;

@property(nonatomic,retain) IBOutlet UILabel *mkTextField;
@property(nonatomic,retain)	IBOutlet UIButton *distanceTextField;
@property(nonatomic,retain)	IBOutlet UIButton *timeTextField;

@property(nonatomic,retain) IBOutlet UILabel *paceLabel;
@property(nonatomic,retain) IBOutlet UILabel *perWhat;

-(IBAction)textClick:(id)sender;
-(IBAction) SegmentChanges:(id)sender;
-(void)initPicker;
-(void)updateDisplay;
@end
