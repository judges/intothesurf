//
//  wgtTrackerUserWeightViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "wgtWeightPicker.h"
#import "wgtUser.h"
#import "wgtTrackerWeightEntryViewController.h"
#import "wgtButtonEntry.h"
#import "wgtSettings.h"

@interface wgtTrackerUserWeightViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, UIActionSheetDelegate> {
	UIPickerView* weightPicker;
	UIView* greyOutView;
	
	UIBarButtonItem * closePickerButton;
	
	UIBarButtonItem *editTableButton;
	UIBarButtonItem *addTableButton;
	UITableView* mTableView;
	
	wgtWeightPicker* weightPickerController;
	
	NSManagedObject* currentObject;
	NSManagedObjectContext* currentContext;
	wgtUser *currentUser;
	
	wgtTrackerWeightEntryViewController* modalWindow;
	BOOL IsNew;
	int editedIndex;
	int indexToDelete;
	//NSMutableArray* currentArray;
	
	
	wgtButtonEntry* targetWeight;
	
	UIToolbar* upperToolbar;
	UIToolbar* bottomToolbar;
	UIBarButtonItem *charButton;
	
	wgtSettings* mySettings;
	
}

-(id)initWithManagedObject:(NSManagedObject*)obj andConext:(NSManagedObjectContext*)context;

-(void)SetSettings:(wgtSettings*)s;

-(void)WeightChanged;
-(IBAction)EnterTargetWeight;
-(IBAction)CommitTargetWeight;

-(IBAction)AddMeasure;
-(IBAction)EditMeasure;

-(IBAction)ShowGraph;

-(void)EditDone;
-(void)EditCancel;

-(NSArray*) GetArray;

@property(nonatomic,retain)IBOutlet UIPickerView* weightPicker;
@property(nonatomic,retain)IBOutlet UIBarButtonItem * closePickerButton;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *editTableButton;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *addTableButton;
@property(nonatomic,retain)IBOutlet UITableView* mTableView;

@property(nonatomic,retain)IBOutlet UIToolbar* upperToolbar;
@property(nonatomic,retain)IBOutlet UIToolbar* bottomToolbar;
@property(nonatomic,retain)IBOutlet UIBarButtonItem *charButton;

@end
