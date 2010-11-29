//
//  NewsDetailViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "NewsDetailViewController.h"
#include "Message.h"

@implementation NewsDetailViewController

@synthesize Title;
@synthesize Date;
@synthesize Image;
@synthesize BackgroundView;
@synthesize Content;


-(id)initWithMessage:(Message*)msg
{
	self = [super initWithNibName:@"NewsDetailViewController" bundle:nil];
	if(self)
	{
	message = msg;
		[message retain];
		
	}
	return self;
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
    [super viewDidLoad];
	NSDateFormatter *df = [[NSDateFormatter alloc]init];
	[df setDateFormat:@"dd MMMM yyyy HH:mm"];
	
	Title.text = message.Title;
	Date.text = [df stringFromDate:message.Date];
	[df release];
	Image.image = [UIImage imageNamed:message.Sponsor];
	Image.frame = CGRectMake(0, 0, 54, 54);
	Content.text = message.Content;
	
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


- (void)dealloc {
	[message release];
    [super dealloc];
}


@end
