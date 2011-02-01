//
//  myPRRootViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRRootViewController.h"
#import "myPRaddRecordViewController.h"
#import "myPRaddRecordIconCell.h"
#import "myPRRecordViewController.h"


@implementation myPRRootViewController
@synthesize addButton;
-(void)SetSettings:(myPRSettings*)s
{
	_settings=s;
	[_settings retain];
}

-(IBAction)AddRecord
{
	myPRRecord*record = [[myPRRecord alloc] init];
	_currentViewController = [[myPRaddRecordViewController alloc] initWithRecord:record];
	_currentViewController.isEdit=NO;
	[record release];
	[_currentViewController SetSettings:_settings];
	[self.navigationController pushViewController:_currentViewController animated:YES];	
}

-(void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	[viewController viewWillAppear:animated];
}

-(NSArray*) GetRecords
{
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:context];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	
	[request setEntity:entityDesc];
	
	
	NSError *error;
	
	NSArray *objects = [context executeFetchRequest:request error:&error];
	return objects;
	
	
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationController.delegate=self;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	self.navigationController.navigationBar.tintColor = _settings.TintColor;
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.title=@"Records";
	self.navigationItem.rightBarButtonItem =  addButton;
	self.tableView.allowsSelectionDuringEditing= YES;
	_currentViewController=nil;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	if(_currentViewController)
	{
		if (_currentViewController.isSuccess) 
		{
			if(_currentViewController.isEdit)
			{
				NSManagedObject* obj = [[self GetRecords] objectAtIndex:selectedToEdit];
				[myPRRecord EditRecord:[_currentViewController MyRecord] ToObject:obj];
				
				NSError* error;
				[self.managedObjectContext save:&error];
				NSIndexPath *p =[NSIndexPath indexPathForRow:selectedToEdit inSection:0];
				[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			}
			else
			{
				[myPRRecord AddRecord:[_currentViewController MyRecord] ToContext:self.managedObjectContext ];
				NSError* error;
				[self.managedObjectContext save:&error];
				
				
				int newIndex = [[self GetRecords] count]-1;
				NSIndexPath *iPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
				NSArray *indexPaths = [NSArray arrayWithObject:iPath];
				
				[self.tableView beginUpdates];
				[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
				[self.tableView endUpdates];			
			}
		}
		
		[_currentViewController release];
		_currentViewController =nil;
	}
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSArray * objects = [self GetRecords];
	return [objects count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
	myPRaddRecordIconCell *cell = (myPRaddRecordIconCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"myPRaddRecordIconCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[myPRaddRecordIconCell class]])
			{
				cell = (myPRaddRecordIconCell *)currentObject;
			}
		}
    }
	
    
	


	NSArray * arr = [self GetRecords];

	NSManagedObject* obj =  [arr objectAtIndex:indexPath.row];// [arr objectAtIndex:[arr count]-1-indexPath.row];

	myPRRecord * rec = [myPRRecord RecordFromObject:obj];

	cell.Label.text = rec.Name;
    cell.Image.image=[UIImage imageNamed:rec.Icon];
	
	return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
	
	NSManagedObject* managedObject  =[[self GetRecords] objectAtIndex:indexPath.row];
	
	if(tableView.editing)
	{
		
		selectedToEdit = indexPath.row;
		
		
		myPRRecord* rec = [myPRRecord RecordFromObject:managedObject];
		
		_currentViewController = [[myPRaddRecordViewController alloc]initWithRecord:rec];
		_currentViewController.isEdit = YES;
		[_currentViewController SetSettings:_settings];
	
		[self.navigationController pushViewController:_currentViewController animated:YES];
	}
	else
	{
		NSManagedObject* managedObject  =[[self GetRecords] objectAtIndex:indexPath.row];
		myPRRecord* rec = [myPRRecord RecordFromObject:managedObject];
		
		myPRRecordViewController*tmp = [[myPRRecordViewController alloc] initWithRecord:rec];
		[tmp setManagedObject:managedObject andConext:self.managedObjectContext];
		[tmp SetSettings:_settings];
		[self.navigationController pushViewController:tmp animated:YES];
		
	}
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        NSManagedObjectContext *context = self.managedObjectContext;
		NSArray* objects = [self GetRecords];
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

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	if(_currentViewController)
	{
		[_currentViewController release];
	}
	[addButton release];
	[_settings release];
    [super dealloc];
}

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
	
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"myPRDataModel" ofType:@"mom"];
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
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"myPRCoreData.sqlite"]];
    
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

