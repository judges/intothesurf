//
//  myPRaddRecordViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPRRecord.h"
#import "myPRSettings.h"
#import "myPRaddRecordIconCell.h"
#import "myPRaddRecordLabelCell.h"

@interface myPRaddRecordViewController : UITableViewController {
	
	myPRRecord* _record;
	myPRSettings* _settings;
	
	myPRaddRecordIconCell* _iconCell;
	myPRaddRecordLabelCell* _nameCell;
	UITableViewCell* _unitCell;
	myPRaddRecordLabelCell* _labelCell;
	
	
	BOOL isEdit;
	UIBarButtonItem* cancelButton;
	UIBarButtonItem* doneButton;
	
	BOOL isSuccess;
}
@property BOOL isSuccess;
@property BOOL isEdit;
@property(nonatomic,retain) IBOutlet UIBarButtonItem* cancelButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem* doneButton;

-(IBAction)Done;
-(IBAction)Cancel;

-(id)initWithRecord:(myPRRecord*)r;
-(void)SetSettings:(myPRSettings*)s;
-(void)SetIsEdit:(BOOL)e;
-(void)RefreshView;
-(myPRRecord*)MyRecord;

@end
