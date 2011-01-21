//
//  myPRSelectIcon.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-19.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPRSelectIcon.h"
#import "myPRaddRecordIconCell.h"

@implementation myPRSelectIcon

-(id)initWithRecord:(myPRRecord*)r
{
	self = [super init];
	if(self)
	{
		_record=r;
		[_record retain];
		
		_iconArray = [[NSMutableArray alloc] init];
		[_iconArray addObject:@"myPRbike.png"];
		[_iconArray addObject:@"myPRgym.png"];
		[_iconArray addObject:@"myPRswim.png"];
	}
	
	return self;
}
-(void)SetSettings:(myPRSettings*)s
{
	_settings=s;
	[_settings retain];
}

+(NSString*)StringForIcon:(NSString*)icon
{
	if( [icon isEqualToString:@"myPRbike.png"])
	{
		return @"Bike";
	}else if( [icon isEqualToString:@"myPRgym.png"])
	{
		return @"Gym";
	}else if( [icon isEqualToString:@"myPRswim.png"])
	{
		return @"Swim";
	}
	
	return nil;
}

#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

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
    return [_iconArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"cell";
    
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
	NSString* str =[_iconArray objectAtIndex:indexPath.row];
	cell.Label.text = [myPRSelectIcon StringForIcon:str];
	cell.Image.image=[UIImage imageNamed:str];
	
	if([_record.Icon isEqualToString:str])
	{
		cell.accessoryType= UITableViewCellAccessoryCheckmark;
	}
	else
	{
		cell.accessoryType= UITableViewCellAccessoryNone;
	}
	
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
  
	UITableViewCell*cell;
	for(int i=0;i<[tableView.visibleCells count];i++)
	{
	cell = [tableView.visibleCells objectAtIndex:i];
		cell.accessoryType= UITableViewCellAccessoryNone;
	}
	
	cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	_record.Icon = [_iconArray objectAtIndex:indexPath.row];
	
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
	[_iconArray release];
	[_settings release];
	[_record release];
    [super dealloc];
}


@end

