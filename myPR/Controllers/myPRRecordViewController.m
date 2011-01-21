//
//  myPRRecordViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRRecordViewController.h"
#import "myPRUnitHandlerCreator.h"
#import "myPREntry.h"

@implementation myPRRecordViewController
@synthesize AddButton, ImageView,Label,Toolbar, TableView, EditButton;

-(id)initWithRecord:(myPRRecord*)r
{
	self = [super initWithNibName:@"myPRRecordViewController" bundle:nil];
	if(self)
	{
		_record =r;
		[_record retain];
		
		_unitHandler = [myPRUnitHandlerCreator CreateHandler:_record.Unit];
	}
	return self;
}
-(void)SetSettings:(myPRSettings*)s
{
	_settings= s;
	[_settings retain];
}
-(IBAction)AddAction
{
	myPREntry* entry = [[myPREntry alloc]init];
	entry.Date=[NSDate date];
	_currentEntryEdit =[[myPRaddEntryViewController alloc] initWithRecord:_record Entry:entry andHandler:_unitHandler];
	[_currentEntryEdit setOwner:self Selector:@selector(EndEdit)];
	_currentEntryEdit.isEdit=NO;
	[self.navigationController pushViewController:_currentEntryEdit animated:YES];
}



-(void)EndEdit
{
	if(_currentEntryEdit.isSuccess)
	{
		NSArray* createdItems =[self GetArray];
		//validate and so on.
		if(_currentEntryEdit.isEdit)
		{
			myPREntry* editedEntry= [_currentEntryEdit GetEntry];
			for(int i=0;i<[createdItems count];i++)
			{
				if(i!=editedItem)
				{
					myPREntry* iEntry = [myPREntry EntryFromObject:[createdItems objectAtIndex:i]];
					if([iEntry.Date isEqualToDate:editedEntry.Date])
					{
						UIActionSheet* actionSheet = [[UIActionSheet alloc]
													  initWithTitle:@"Entry with given date already extist. Do You want to overwrite it ?" 
													  delegate:self 
													  cancelButtonTitle:@"No" 
													  destructiveButtonTitle:nil 
													  otherButtonTitles:@"Yes",nil];
						
						[actionSheet showInView:self.navigationController.view];
						[actionSheet release];
						return;
						
						indexToDelete = editedItem;
						editedItem=i;
					}
				}
			}
			
			 NSIndexPath*p =[NSIndexPath indexPathForRow:editedItem inSection:0];
			 
			 id obj = [createdItems objectAtIndex: editedItem];
			 [myPREntry EditEntry:editedEntry ToObject:obj];
			 
			 NSError* error;
			 [_currentContext save:&error];
			 
			 [TableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			 			
			[self.navigationController popViewControllerAnimated:YES];
			 [_currentEntryEdit release];
			_currentEntryEdit = nil;			
		}
		else
		{
			myPREntry* newEntry= [_currentEntryEdit GetEntry];
			for(int i=0;i<[createdItems count];i++)
			{
				myPREntry* iEntry = [myPREntry EntryFromObject:[createdItems objectAtIndex:i]];
				if([iEntry.Date isEqualToDate: newEntry.Date])
				{
					UIActionSheet* actionSheet = [[UIActionSheet alloc]
												  initWithTitle:@"Entry with given date already extist. Do You want to overwrite it ?" 
												  delegate:self 
												  cancelButtonTitle:@"No" 
												  destructiveButtonTitle:nil 
												  otherButtonTitles:@"Yes",nil];
					
					[actionSheet showInView:self.navigationController.view];
					[actionSheet release];
					editedItem = i;
					return;
				}
			}
			[myPREntry AddEntry:newEntry ToContext:_currentContext ToRecord:_currentObject];
			NSError* error;
			[_currentContext save:&error];
			
			[TableView reloadData];
	
			
			[self.navigationController popViewControllerAnimated:YES];
			[_currentEntryEdit release];
			_currentEntryEdit = nil;		
		}
	}
	else
	{
		[self.navigationController popViewControllerAnimated:YES];
		[_currentEntryEdit release];
		_currentEntryEdit = nil;
	}

}

-(void)setManagedObject:(NSManagedObject*)obj andConext:(NSManagedObjectContext*)context
{
	_currentObject = obj;
	[_currentObject retain];
	_currentContext = context;
	[_currentContext retain];
}

-(NSArray*)GetArray
{
	return [myPRRecord GetEntries:_currentObject ToContext:_currentContext];
}

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex==0)
	{
		myPREntry* editedEntry = [_currentEntryEdit GetEntry];
		if(!_currentEntryEdit.isEdit)
		{
			NSIndexPath*p =[NSIndexPath indexPathForRow:editedItem inSection:0];
			
			id obj = [[self GetArray] objectAtIndex: editedItem];
			
			[myPREntry EditEntry:editedEntry ToObject:obj];
			
			
			
			NSError *error = nil;
			if (![_currentContext save:&error]) {
				/*
				 Replace this implementation with code to handle the error appropriately.
				 
				 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
				 */
				NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
				abort();
			}
			
			
			[TableView beginUpdates];
			[TableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			[TableView endUpdates];
		}
		else
		{
			myPREntry* editedEntry = [_currentEntryEdit GetEntry];
			NSIndexPath*p =[NSIndexPath indexPathForRow:editedItem inSection:0];
			
			NSIndexPath*p1 = [NSIndexPath indexPathForRow:indexToDelete inSection:0];
			id obj = [[self GetArray] objectAtIndex: editedItem];
			[myPREntry EditEntry:editedEntry ToObject:obj];
			
			[myPREntry DeleteEntry:[[self GetArray] objectAtIndex:indexToDelete] FromObject:_currentObject FromContext:_currentContext];
			
			
			
			NSError* error;
			[_currentContext save:&error];
			
			
			
			
			[TableView beginUpdates];
			[TableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:p] withRowAnimation:UITableViewRowAnimationLeft];
			[TableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: p1] withRowAnimation:UITableViewRowAnimationFade];
			
			[TableView endUpdates];
			
			
			//wgtWeightEntry*editedEntry = [modalWindow getCurrentEntry];
			
		}
		[self.navigationController popViewControllerAnimated:YES];
		[_currentEntryEdit release];
		_currentEntryEdit = nil;		
			
	}

}

#pragma mark -
#pragma mark View lifecycle

-(IBAction)EditAction
{
	if(TableView.editing)
	{
		[EditButton setStyle:UIBarButtonItemStyleBordered];
		[EditButton setTitle:@"Edit"];
		[TableView setEditing:NO animated:YES];
	}
	else 
	{
		[EditButton setStyle:UIBarButtonItemStyleDone];
		[EditButton setTitle:@"Done"];
		[TableView setEditing:YES animated:YES];
	}
}


- (void)viewDidLoad {
    [super viewDidLoad];

	UIBarButtonItem*split = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	[Toolbar setItems:[NSArray arrayWithObjects:EditButton,split,AddButton,nil]];
	
	[split release];

	ImageView.image = [UIImage imageNamed:_record.Icon];
	Label.text = _record.Name;
	TableView.allowsSelectionDuringEditing= YES;
	TableView.allowsSelection=NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
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
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	return [[self GetArray ] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSArray* array=[self GetArray];
    
	myPREntry* entry = [myPREntry EntryFromObject:[array objectAtIndex:indexPath.row]];
	
	
	NSDateFormatter*formatter =[[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"MMMM dd yyyy"];
	
	cell.textLabel.text = [formatter stringFromDate:entry.Date];
	
	
	
    
	
	
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
	
    editedItem = indexPath.row;
	myPREntry* entry= [myPREntry EntryFromObject:[[self GetArray] objectAtIndex:indexPath.row]];
	
	
	_currentEntryEdit =[[myPRaddEntryViewController alloc] initWithRecord:_record Entry:entry andHandler:_unitHandler];
	_currentEntryEdit.isEdit=YES;
	[_currentEntryEdit setOwner:self Selector:@selector(EndEdit)];

	[self.navigationController pushViewController:_currentEntryEdit animated:YES];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	// Delete the managed object for the given index path
	
	NSArray* objects = [self GetArray];
	NSManagedObject* obj = [objects objectAtIndex:indexPath.row];
	
	
	[myPREntry DeleteEntry:obj FromObject:_currentObject FromContext:_currentContext];
	
	// Save the context.
	NSError *error = nil;
	if (![_currentContext save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	[TableView beginUpdates];
	[TableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];
	[TableView endUpdates];
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
	[EditButton release];
	[TableView release];
	[_currentObject release];
	[_currentContext release];
	if(_currentEntryEdit)
	{
		[_currentEntryEdit release];
	}
	[Toolbar release];
	[_unitHandler release];
	[_settings release];
	[_record release];
	[AddButton release];
	[ ImageView release];
	[Label release];
    [super dealloc];
}


@end

