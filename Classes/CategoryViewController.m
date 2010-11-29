//
//  CategoryViewController.m
//  Lavaman
//
//  Created by Todd ;;; on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "CategoryViewController.h"
#import <QuartzCore/QuartzCore.h>
#include "Category.h"
#include "ItemsToDoViewController.h"


@implementation CategoryViewController
//@synthesize Category;
@synthesize btn;


-(id)initWithCategory:(Category*)cat Navigation:(UINavigationController*)nav
{
	self=[super init];
	
	if(self)
	{
		category = cat;
		[category retain];
		navControl =nav;
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

-(IBAction)btnPressed:(id)sender
{
	ItemsToDoViewController *itd = [[ItemsToDoViewController alloc]initWithItemArray:category.Items NavController:navControl];
	itd.title = category.LabelTxt;
	[navControl pushViewController:itd animated:YES];
	[itd release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
	/*if(tmpALternativeColor)
	{
		[tmpALternativeColor release];
		tmpALternativeColor = nil;
	}
	
	tmpALternativeColor = self.view.backgroundColor;
	[tmpALternativeColor retain];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	lbl.text = category.LabelTxt;
	imgView.image=[UIImage imageNamed:category.ImageName];
	
	
	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[self.view.layer setBorderWidth:1];
*/
	[btn setTitle:category.LabelTxt forState:UIControlStateNormal];
}
/*
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = tmpALternativeColor;
	lbl.textColor = [UIColor whiteColor];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	lbl.textColor = [UIColor blackColor];
	
	ItemsToDoViewController *itd = [[ItemsToDoViewController alloc]initWithItemArray:category.Items NavController:navControl];
	itd.title = category.LabelTxt;
	[navControl pushViewController:itd animated:YES];
	[itd release];

}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	lbl.textColor = [UIColor blackColor];
}
*/

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
	
	/*if(tmpALternativeColor)
	{
		[tmpALternativeColor release];
		tmpALternativeColor = nil;
	}
	[imgView release];
	[lbl release];*/
	[btn release];
	[category release];
    [super dealloc];
}


@end
