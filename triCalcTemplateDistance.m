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

-(id)initWithBackground:(UIColor*)bgColor owner:(id)o selector:(SEL)s Screen:(int)scr UseMile:(BOOL)useMile
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
				[values addObject:[NSNumber numberWithFloat:(useMile? 0.403:0.4)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 0.757:0.75)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 1.5:1.5)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 3.0:3.0)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 4.008:4.0)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 1.932:1.93)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 3.863:3.86)]];
				if(useMile)
				{
					[titles addObject:@"Super Sprint (0.25 mile)"];
					[titles addObject:@"Sprint (0.47 mile)"];
					[titles addObject:@"Olympic (0.93 mile)"];
					[titles addObject:@"Double Olympic (1.86 mile)"];
					[titles addObject:@"Triple Olympic (2.49 mile)"];
					[titles addObject:@"Half-Ironman (1.2 mile)"];
					[titles addObject:@"Ironman Triathlon (2.4 mile)"];
				}
				else 
				{
					[titles addObject:@"Super Sprint (0.4 km)"];
					[titles addObject:@"Sprint (0.75 km)"];
					[titles addObject:@"Olympic (1.5 km)"];
					[titles addObject:@"Double Olympic (3.0 km)"];
					[titles addObject:@"Triple Olympic (4.00 km)"];
					[titles addObject:@"Ironman Triathlon (1.93 km)"];
					[titles addObject:@"Ironman Triathlon (3.86 km)"];
				}

				break;
			case 1: //Bike
				self.navigationItem.title =@"Bike";
				
				[values addObject:[NSNumber numberWithFloat:(useMile? 9.978:10)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 19.956:20)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 39.912:40)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 79.824:80)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 120.058:120)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 90.124:90)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 180.247:180)]];
				if(useMile)
				{
					[titles addObject:@"Super Sprint (6.2 mile)"];
					[titles addObject:@"Sprint (12.4 mile)"];
					[titles addObject:@"Olympic (24.8 mile)"];
					[titles addObject:@"Double Olympic (49.6 mile)"];
					[titles addObject:@"Triple Olympic (74.6 mile)"];
					[titles addObject:@"Half-Ironman (56 mile)"];
					[titles addObject:@"Ironman Triathlon (112 mile)"];
				}
				else 
				{
					[titles addObject:@"Super Sprint (10 km)"];
					[titles addObject:@"Sprint (20 km)"];
					[titles addObject:@"Olympic (40 km)"];
					[titles addObject:@"Double Olympic (80 km)"];
					[titles addObject:@"Triple Olympic (120 km)"];
					[titles addObject:@"Ironman Triathlon (90 km)"];
					[titles addObject:@"Ironman Triathlon (180 km)"];
				}
				
				break;
			case 2:  //Run
				self.navigationItem.title =@"Run";
				[values addObject:[NSNumber numberWithFloat:(useMile? 2.42:2.5)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 5:5)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 10:10)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 20:20)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 30:30)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 21.09:21.09)]];
				[values addObject:[NSNumber numberWithFloat:(useMile? 42.2:42.2)]];
				if(useMile)
				{
					[titles addObject:@"Super Sprint (1.5 mile)"];
					[titles addObject:@"Sprint (3.1 mile)"];
					[titles addObject:@"Olympic (6.2 mile)"];
					[titles addObject:@"Double Olympic (12.4 mile)"];
					[titles addObject:@"Triple Olympic (18.6 mile)"];
					[titles addObject:@"Half-Ironman (13.1 mile)"];
					[titles addObject:@"Ironman Triathlon (26.2 mile)"];
				}
				else 
				{
					[titles addObject:@"Super Sprint (2.5 km)"];
					[titles addObject:@"Sprint (5 km)"];
					[titles addObject:@"Olympic (10 km)"];
					[titles addObject:@"Double Olympic (20 km)"];
					[titles addObject:@"Triple Olympic (30 km)"];
					[titles addObject:@"Ironman Triathlon (21.09 km)"];
					[titles addObject:@"Ironman Triathlon (42.2 km)"];
				}				break;
			
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

