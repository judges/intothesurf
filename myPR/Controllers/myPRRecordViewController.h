//
//  myPRRecordViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myPRRecord.h"
#import "myPRSettings.h"
#import "myPRUnitHandler.h"
#import "myPRaddEntryViewController.h"

@interface myPRRecordViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate> {
	
	myPRRecord* _record;
	myPRSettings* _settings;
	myPRUnitHandler* _unitHandler;
	
	myPRaddEntryViewController* _currentEntryEdit;
	
	
	UIImageView* ImageView;
	UILabel* Label;
	UIBarButtonItem* AddButton;
	UIBarButtonItem* EditButton;

	UIToolbar* Toolbar;
	UITableView* TableView;
	
	NSManagedObject* _currentObject;
	NSManagedObjectContext* _currentContext;
	int editedItem;
	int indexToDelete;
}


-(void)EndEdit;

@property(nonatomic,retain) IBOutlet UITableView* TableView;
@property(nonatomic,retain) IBOutlet UIImageView* ImageView;
@property(nonatomic,retain) IBOutlet UILabel* Label;
@property(nonatomic,retain) IBOutlet UIBarButtonItem* AddButton;
@property(nonatomic,retain) IBOutlet UIBarButtonItem* EditButton;
@property(nonatomic,retain) IBOutlet UIToolbar* Toolbar;


-(void)setManagedObject:(NSManagedObject*)obj andConext:(NSManagedObjectContext*)context;
-(id)initWithRecord:(myPRRecord*)r;
-(void)SetSettings:(myPRSettings*)s;
-(IBAction)AddAction;
-(IBAction)EditAction;
-(NSArray*)GetArray;
-(IBAction)ShowGraph;
@end
