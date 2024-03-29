//
//  wgtTrackerRootViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-24.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "wgtTrackerRootViewController.h"
#import "wgtBasicUserDataViewController.h"
#import "wgtTrackerUserCell.h"
#import "wgtTrackerUserWeightViewController.h"

@implementation wgtTrackerRootViewController
@synthesize addButton;


-(id)initWithSettings:(wgtSettings*)s
{

		self = [super initWithNibName:@"wgtTrackerRootViewController" bundle:nil];
		if (self != nil) {
			_settings=s;
			[_settings retain];
		}
		return self;


}

-(IBAction)addUser
{	
	isNewUser = YES;
	wgtBasicUserDataViewController *userEdit = [[wgtBasicUserDataViewController alloc]initWithParentViewController:self];
	[userEdit setSettings:_settings];
	//userEdit.view.frame = self.navigationController.view.frame;
	
	[self.navigationController.view addSubview:userEdit.view];
}

#pragma mark -
#pragma mark View lifecycle

/*
-(id)init
{
	self=[super init];
	if(self)
	{
		
	}
	return self;
}
*/

- (void)dealloc {
	[_settings release];
	[managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
    [super dealloc];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 
	 self.navigationController.navigationBar.tintColor =_settings.TintColor;
	 //self.view.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
	 
	 
	 counter= 0;
	self.navigationItem.rightBarButtonItem = addButton;
	 self.navigationItem.leftBarButtonItem = self.editButtonItem;
	 self.navigationItem.title = @"Users";
	 self.tableView.allowsSelectionDuringEditing= YES;
	
	 [super viewDidLoad];
	
 }
 

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




#pragma mark -
#pragma mark TableViewDataSource



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	NSArray * objects = [self GetUsers];
	return [objects count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSManagedObject* managedObject  =[[self GetUsers] objectAtIndex:indexPath.row];
	
	if(tableView.editing)
	{
		isNewUser = NO;
		selectedToEdit = indexPath.row;
	

		wgtUser* usr = [wgtUser UserFromObject:managedObject];
		
		wgtBasicUserDataViewController *userEdit = [[wgtBasicUserDataViewController alloc]initWithParentViewController:self	AndUser:usr];
			[userEdit setSettings:_settings];
	//	userEdit.view.frame = self.navigationController.view.frame;
		[self.navigationController.view addSubview:userEdit.view];
	}
	else
	{
		wgtTrackerUserWeightViewController* tmp = 
		[[wgtTrackerUserWeightViewController alloc] initWithManagedObject:managedObject andConext:self.managedObjectContext];

		[tmp SetSettings:_settings];
		[self.navigationController pushViewController:tmp animated:YES];
		[tmp release];
	}


}

-(void)DoneUserEdit:(wgtBasicUserDataViewController*)c
{
	if(isNewUser)
	{
		[wgtUser AddUser:[c getUser] ToContext:self.managedObjectContext ];
		NSError* error;
		[self.managedObjectContext save:&error];
		
		
		int newIndex = [[self GetUsers] count]-1;
		NSIndexPath *iPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
		NSArray *indexPaths = [NSArray arrayWithObject:iPath];
		
		[self.tableView beginUpdates];
		[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		[self.tableView endUpdates];
	}
	else
	{
		NSManagedObject* obj = [[self GetUsers] objectAtIndex:selectedToEdit];
		[wgtUser EditUser:[c getUser] ToObject:obj];
		
		NSError* error;
		[self.managedObjectContext save:&error];
		NSIndexPath *p =[NSIndexPath indexPathForRow:selectedToEdit inSection:0];
		[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
		
		
	}

	[c.view removeFromSuperview];
	[c release];
}
-(void)CancelUserEdit:(wgtBasicUserDataViewController*)c
{
	[c.view removeFromSuperview];
	[c release];
}

-(NSArray*) GetUsers
{
	NSManagedObjectContext *context = self.managedObjectContext;
	
	NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	
	[request setEntity:entityDesc];
	

	NSError *error;
	
	NSArray *objects = [context executeFetchRequest:request error:&error];
	return objects;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        NSManagedObjectContext *context = self.managedObjectContext;
		NSArray* objects = [self GetUsers];
		NSManagedObject* obj = [objects objectAtIndex:indexPath.row];
        [context deleteObject:obj];
        
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
		[self.tableView beginUpdates];
		[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];
		[self.tableView endUpdates];
	}   	
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    	
	static NSString *CellIdentifier = @"cell";
    
	wgtTrackerUserCell *cell = (wgtTrackerUserCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"wgtTrackerUserCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[wgtTrackerUserCell class]])
			{
				cell = (wgtTrackerUserCell *)currentObject;
			}
		}
    }
	
	
	
	NSArray * arr = [self GetUsers];

	NSManagedObject* obj =  [arr objectAtIndex:indexPath.row];// [arr objectAtIndex:[arr count]-1-indexPath.row];

	wgtUser * usr = [wgtUser UserFromObject:obj];
	
	cell.Name.text = usr.Name;
	if(usr.IsMale)
	{
		cell.Gender.image =[UIImage imageNamed:@"male_small.png"];
	}
	else
	{
		cell.Gender.image =[UIImage imageNamed:@"female_small.png"];
	}
	cell.Height.text =[usr FormatHeight];
	
	return cell;
}


#pragma mark -
#pragma mark Delegate





#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
	
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"wgtTrackerDataModel" ofType:@"mom"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"CoreDataTest.sqlite"]];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end

