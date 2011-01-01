//
//  SponsorDetailsViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-01.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "SponsorDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation SponsorDetailsViewController
@synthesize ImgView, Lbl, TextView;

-(id)initWithItem:(Item*)i Owner:(id)o Selector:(SEL)s;
{
	self = [super init];
	if(self)
	{
		item = i;
		owner = o;
		selector= s;
		[item retain];
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
	ImgView.image =[UIImage imageNamed:item.Image];
	Lbl.text = item.Title;
	TextView.text = item.Details;

	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor blackColor] CGColor]];
	[self.view.layer setBorderWidth:2];	
	
}

-(IBAction)Close
{
	[owner performSelector:selector withObject:self];
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
	[item release];
	[Lbl release];
	[TextView release];
	[ImgView release];
    [super dealloc];
}


@end
