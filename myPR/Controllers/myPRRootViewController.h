//
//  myPRRootViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "myPRSettings.h"
#import "myPRaddRecordViewController.h"
@interface myPRRootViewController : UITableViewController<UINavigationControllerDelegate> {

	NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
	
	UIBarButtonItem *addButton;
	myPRSettings* _settings;
	
	myPRaddRecordViewController* _currentViewController;
	int selectedToEdit;
}
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (NSString *)applicationDocumentsDirectory;


@property(nonatomic,retain) IBOutlet UIBarButtonItem *addButton;
-(IBAction)AddRecord;
-(void)SetSettings:(myPRSettings*)s;
-(NSArray*) GetRecords;



@end
