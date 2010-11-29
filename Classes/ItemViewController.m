//
//  ItemViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "ItemViewController.h"
#include "Item.h"
#import <QuartzCore/QuartzCore.h>
#include "ItemMapViewController.h"

@implementation ItemViewController
@synthesize item;
@synthesize imgView;
@synthesize titleLbl;
@synthesize addressLbl;
@synthesize infoLbl;
@synthesize detailsBtn;

//init as a list element.
-(id)initWithItem:(Item*)cat Navigation:(UINavigationController*)nav
{
	self = [super init];
	if(self)
	{
		item = cat;
		[item retain];
		navControl = nav;
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

-(void)btnPressed:(id)sender
{
	ItemMapViewController *mvc=[[ItemMapViewController alloc]initWithItem:item];
	[navControl pushViewController:mvc animated:YES];
	[mvc release];
	
	//launch map or map controller.
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	tmpALternativeColor = self.view.backgroundColor;
	[tmpALternativeColor retain];
	self.view.backgroundColor = [UIColor whiteColor];
	
	titleLbl.text = item.Title;
	addressLbl.text = item.Address;
	infoLbl.text = item.Info;
	imgView.image = [UIImage imageNamed:item.Image];
	
	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[self.view.layer setBorderWidth:1];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = tmpALternativeColor;
	titleLbl.textColor = [UIColor whiteColor];
	addressLbl.textColor = [UIColor whiteColor];
	infoLbl.textColor = [UIColor whiteColor];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	titleLbl.textColor = [UIColor blackColor];
	addressLbl.textColor = [UIColor blackColor];
	infoLbl.textColor = [UIColor blackColor];
	
	
	[self btnPressed:nil];	

}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	titleLbl.textColor = [UIColor blackColor];
	addressLbl.textColor = [UIColor blackColor];
	infoLbl.textColor = [UIColor blackColor];
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
    [super dealloc];
}


@end
