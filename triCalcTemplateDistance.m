//
//  triCalcTemplateDistance.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-19.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcTemplateDistance.h"


@implementation triCalcTemplateDistance


#pragma mark -
#pragma mark View lifecycle

-(id)initWithBackground:(UIColor*)bgColor owner:(id)o selector:(SEL)s Screen:(int)scr
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if(self)
	{
		owner = o;
		selector =s;
		color = bgColor;
		[color retain];
		titles = [[NSMutableArray alloc]init];
		values = [[NSMutableArray alloc]init];
		
		switch (scr) {
			case 0: //Swim
				self.navigationItem.title =@"Swim";
				
				[titles addObject:@"500 meters"];
				[values addObject:[NSNumber numberWithFloat:0.5]];
				[titles addObject:@"1000 meters"];
				[values addObject:[NSNumber numberWithFloat:1]];
				[titles addObject:@"1500 meters"];
				[values addObject:[NSNumber numberWithFloat:1.5]];
				[titles addObject:@"2000 meters"];
				[values addObject:[NSNumber numberWithFloat:2.0]];
				[titles addObject:@"Olympic"];
				[values addObject:[NSNumber numberWithFloat:1.5]];
				[titles addObject:@"Half ironman"];
				[values addObject:[NSNumber numberWithFloat:1.93]];
				[titles addObject:@"Ironman"];
				[values addObject:[NSNumber numberWithFloat:3.86]];
				break;
			case 1: //Bike
				self.navigationItem.title =@"Bike";
				 [titles addObject:@"5 km"];
				 [values addObject:[NSNumber numberWithFloat:5]];
				 [titles addObject:@"10 km"];
				 [values addObject:[NSNumber numberWithFloat:10]];
				 [titles addObject:@"20 km"];
				 [values addObject:[NSNumber numberWithFloat:20]];
				 [titles addObject:@"Olympic"];
				 [values addObject:[NSNumber numberWithFloat:40]];
				 [titles addObject:@"Half ironman"];
				 [values addObject:[NSNumber numberWithFloat:90]];
				 [titles addObject:@"Ironman"];
				 [values addObject:[NSNumber numberWithFloat:180]];
				break;
			case 2:  //Run
				self.navigationItem.title =@"Run";
				  [titles addObject:@"1 km"];
				  [values addObject:[NSNumber numberWithFloat:1]];
				  [titles addObject:@"3 km"];
				  [values addObject:[NSNumber numberWithFloat:3]];
				  [titles addObject:@"5 km"];
				  [values addObject:[NSNumber numberWithFloat:5]];
				  [titles addObject:@"Olympic"];
				  [values addObject:[NSNumber numberWithFloat:10]];
				  [titles addObject:@"Half ironman"];
				  [values addObject:[NSNumber numberWithFloat:21.09]];
				  [titles addObject:@"Ironman"];
				  [values addObject:[NSNumber numberWithFloat:42.2]];
				break;
			
		}
		
	}
	return self;
	
}


- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor= color;
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
    return [titles count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
	cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    // Configure the cell...
    
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
    
	
	
	for(int i=0;i< [titles count];i++)
	{
		NSIndexPath* index = [NSIndexPath indexPathForRow:i inSection:0];
		[tableView cellForRowAtIndexPath:index].accessoryType = UITableViewCellAccessoryNone;
	}
	
	[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	
	[owner performSelector:selector withObject:[values objectAtIndex:indexPath.row]];
	
	
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
	[color release];
	[titles release];
	[values release];
    [super dealloc];
}


@end

