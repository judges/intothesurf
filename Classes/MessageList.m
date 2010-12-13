//
//  MessageList.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-31.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "MessageList.h"
#include "MessageContainer.h"
#include "NewsDetailViewController.h"
#include "NewsHeaderTableViewCell.h"
#include "Message.h"

@implementation MessageList


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	[self.navigationController setNavigationBarHidden:NO animated:YES];
	self.title = @"Messages";
	[self.tableView setSeparatorColor:[UIColor lightGrayColor]];
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

-(id)initWithMessageContainer:(MessageContainer*)mc
{
	self = [super initWithNibName:@"MessageList" bundle:nil];
	if(self)
	{
		messageContainer= mc;
		[messageContainer retain];
	}
	return self;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [messageContainer.MessageArray count];
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"customCell";
    
    NewsHeaderTableViewCell *cell = (NewsHeaderTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
	if (cell == nil) {
		NSArray *nibObjects = [[NSBundle mainBundle]loadNibNamed:@"NewsHeaderTableViewCell" owner:nil options:nil];
		for(id currentObject in nibObjects)
		{
			if([currentObject isKindOfClass:[NewsHeaderTableViewCell class]])
			{
				cell = (NewsHeaderTableViewCell *)currentObject;
			}
		}
    }
	
	Message*msg = [messageContainer GetMessageAtIndex: [self reverseIndex:indexPath.row]];
	
	NSDateFormatter* dateFormatter= [[NSDateFormatter alloc]init];
	[dateFormatter setDateFormat:@"dd MMMM yyyy hh:mm"];
	

	
	[[cell Title]setText:msg.Title];
	
	
	[[cell Date] setText: [dateFormatter stringFromDate:msg.Date]];
	[[cell Image] setImage:[UIImage imageNamed:msg.Sponsor]];
	if(msg.Read)
	{
		
		[cell BackgroundView].backgroundColor =[UIColor whiteColor];
		cell.Title.font = [UIFont fontWithName:@"Helvetica" size:17];
		cell.Date.font = [UIFont fontWithName:@"Helvetica" size:13];
		cell.Star.hidden=YES;
	}
	else 
	{
		cell.Title.font = [UIFont boldSystemFontOfSize:17];//  [UIFont fontWithName:@"Helvetica Bold" size:17];
		cell.Date.font = [UIFont boldSystemFontOfSize:13];
			cell.Star.hidden=NO;
		CGSize s = [ msg.Title sizeWithFont:cell.Title.font];
		cell.Star.frame = CGRectMake(cell.Title.frame.origin.x + s.width +2, cell.Star.frame.origin.y, cell.Star.frame.size.width, cell.Star.frame.size.height);
		
		//[cell BackgroundView].backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.33 alpha:1];
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

-(int)reverseIndex:(int)i
{
	return [messageContainer.MessageArray count] -1-i;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
	Message *m = [messageContainer GetMessageAtIndex: [self reverseIndex:indexPath.row]];
	NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithMessage:m];  
	
	if(!m.Read)
	{
		m.Read =YES;
		[messageContainer NotifyAboutMessageCountChange];
	}
	
	
	NSArray *tmpArray =[[NSArray alloc]initWithObjects:indexPath,nil];
	
	[tableView reloadRowsAtIndexPaths:tmpArray withRowAnimation:UITableViewRowAnimationNone];
	[tmpArray release];
	
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];
	 
		
	
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
    [super dealloc];
}


@end

