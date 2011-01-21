//
//  myPRaddRecordViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRaddRecordViewController.h"
#import "myPREnterName.h"
#import "myPRSelectIcon.h"
#import "myPRSelectUnit.h"
#import "myPRUnitHandlerCreator.h"
#import "myPRUnitHandler.h"


@implementation myPRaddRecordViewController
@synthesize cancelButton;
@synthesize doneButton;
@synthesize isSuccess;
@synthesize isEdit;

-(id)initWithRecord:(myPRRecord*)r
{
	self = [super initWithNibName:@"myPRaddRecordViewController" bundle:nil];
	if(self)
	{
		_record= r;
		[_record retain];
		
		NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"myPRaddRecordIconCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[myPRaddRecordIconCell class]])
			{
				_iconCell = (myPRaddRecordIconCell *)currentObject;
			}
		}
		
		nibObjects = [[NSBundle mainBundle]loadNibNamed:@"myPRaddRecordLabelCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[myPRaddRecordLabelCell class]])
			{
				_nameCell = (myPRaddRecordLabelCell *)currentObject;
			}
		}
		_unitCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
		
		nibObjects = [[NSBundle mainBundle]loadNibNamed:@"myPRaddRecordLabelCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[myPRaddRecordLabelCell class]])
			{
				_labelCell = (myPRaddRecordLabelCell *)currentObject;
			}
		}
		
		
		[_nameCell retain];
		[_iconCell retain];
		[_labelCell retain];
		
	}
	return self;
	
}

-(myPRRecord*)MyRecord
{
	return _record;
}

-(IBAction)Done
{
	isSuccess = YES;
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)Cancel
{
	isSuccess = NO;
	[self.navigationController popViewControllerAnimated:YES];
}

-(void)SetSettings:(myPRSettings*)s
{
	_settings =s;
	[_settings retain];
}

-(void)RefreshView
{
	_nameCell.Label.text = _record.Name;
	_nameCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;


	_iconCell.Label.text = [myPRSelectIcon StringForIcon:_record.Icon];
	_iconCell.Image.image=[UIImage imageNamed:_record.Icon];

	
	
	_iconCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	
	myPRUnitHandler* handler= [myPRUnitHandlerCreator CreateHandler:_record.Unit];
	
	_unitCell.textLabel.text = handler.Name;
	_unitCell.detailTextLabel.text = handler.Sample;
	[handler release];
	if(isEdit)
	{
		_unitCell.accessoryType=UITableViewCellAccessoryNone;
		_unitCell.backgroundView.backgroundColor=[UIColor lightGrayColor];
		
	}
	else {
		_unitCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	}
	_labelCell.Label.text = _record.Label;
	_labelCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	
	
}

#pragma mark -
#pragma mark View lifecycle



- (void)viewDidLoad {
    [super viewDidLoad];

	self.navigationItem.leftBarButtonItem= cancelButton;
	self.navigationItem.rightBarButtonItem=doneButton;
	
	if(isEdit)
	{
		self.navigationItem.title=@"Edit Entry";
	}
	else {
		self.navigationItem.title=@"New Entry";
	}

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)viewWillAppear:(BOOL)animated {
    [self RefreshView];
	[super viewWillAppear:animated];
	
}



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
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch (section) {
		case 0:
			return @"Name:";
			//name
			break;
		case 1:
			return @"Icon:";
			//Icon
			break;
		case 2:
			return @"Unit:";
			//Record label.
			break;
		case 3:
			return @"Entry label:";
			//Record unit.
			break;
		default:
			return nil;
			break;
	}
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell* cell=nil;
	switch (indexPath.section) 
	{
		case 0:
			return _nameCell;
		case 1:
			return _iconCell;
		case 2:
			return _unitCell;
		case 3:
			return _labelCell;
	}
	
    return cell;
}

-(void)SetIsEdit:(BOOL)e
{
	isEdit =e;
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
  
	
	switch (indexPath.section) {
		case 0:
		{
			myPREnterName* detail= [[myPREnterName alloc]initWithRecord:_record setName:YES];
			[self.navigationController pushViewController:detail animated:YES];
			[detail release];
			break;
		}
		case 1:
		{
			myPRSelectIcon *detail = [[myPRSelectIcon alloc]initWithRecord:_record];
			[self.navigationController pushViewController:detail animated:YES];
			[detail release];
			break;
		}
		case 2:
		{
			myPRSelectUnit * detail = [[myPRSelectUnit alloc]initWithRecord:_record];
			[self.navigationController pushViewController:detail animated:YES];
			[detail release];
			break;
		}
		case 3:
		{
			myPREnterName* detail = [[myPREnterName alloc]initWithRecord:_record setName:NO];
			[self.navigationController pushViewController:detail animated:YES];
			[detail release];
			break;
		}
	}
	
	
	
	// Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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
	
	[_iconCell release];
	[_nameCell release];
	[_unitCell release];
	[_labelCell release];
	
	
	[_settings release];
	[_record release];
    [super dealloc];
}


@end

