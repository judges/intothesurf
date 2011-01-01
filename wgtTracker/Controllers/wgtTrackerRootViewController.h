//
//  wgtTrackerRootViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-24.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "wgtUser.h"
@class wgtBasicUserDataViewController;

@interface wgtTrackerRootViewController : UITableViewController {


	UIBarButtonItem *addButton;
	
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
	
	int counter;
	BOOL isNewUser;
}


@property(nonatomic,retain) IBOutlet UIBarButtonItem *addButton;
-(IBAction) addUser;


@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;
-(NSArray*) GetUsers;

-(void)DoneUserEdit:(wgtBasicUserDataViewController*)c;
-(void)CancelUserEdit:(wgtBasicUserDataViewController*)c;


@end
