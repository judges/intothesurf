//
//  myPRaddEntryViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPREntry.h"
#import "myPRUnitHandler.h"
#import "myPRRecord.h"

@interface myPRaddEntryViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate> {

	BOOL isDateUp;
	
	myPREntry* _entry;
	myPRUnitHandler* _handler;
	myPRRecord* _record;
	NSMutableArray* _pickerDataArray;

	UIPickerView* Picker;
	UIDatePicker* DatePicker;
	UILabel*Label;
	
	UIButton* DateButton;
	UIButton* ValueButton;
	
	UIBarButtonItem* CancelButton;
	UIBarButtonItem* DoneButton;
	
	
	BOOL isSuccess;
	BOOL isEdit;
	
	id _owner;
	SEL _selector;
	
}
@property BOOL isSuccess;
@property BOOL isEdit;

-(id)initWithRecord:(myPRRecord*)r Entry:(myPREntry*)e andHandler:(myPRUnitHandler*)h;
-(void)setOwner:(id)owner Selector:(SEL)selector;
-(NSDate*)ClearDate:(NSDate*)d;
-(myPREntry*)GetEntry;
@property(nonatomic,retain)IBOutlet UIPickerView* Picker;
@property(nonatomic,retain)IBOutlet UIDatePicker* DatePicker;
@property(nonatomic,retain)IBOutlet UILabel*Label;

@property(nonatomic,retain)IBOutlet UIButton* DateButton;
@property(nonatomic,retain)IBOutlet UIButton* ValueButton;

@property(nonatomic,retain)IBOutlet UIBarButtonItem* CancelButton;
@property(nonatomic,retain)IBOutlet UIBarButtonItem* DoneButton;

-(IBAction)DoneAction;
-(IBAction)CancelAction;
-(IBAction)ValueChanged;
-(IBAction)DateAction;
-(IBAction)ValueAction;


-(void)RefreshData;


@end
