//
//  CustomButtonViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-15.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "CustomButtonViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomButtonData.h"

@implementation CustomButtonViewController
@synthesize Image;
@synthesize Label;
@synthesize SmallLabel;
@synthesize DetailLabel;

-(id)initWithOwner:(id)own Selector:(SEL)sel ButtonData:(CustomButtonData*)cbd
{
	if ((self = [self init])) {
		owner= own;
		selector= sel;
		buttonData = cbd;
		[buttonData retain];
    }
    return self;
	
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor blueColor];
	Label.textColor = [UIColor whiteColor];
	DetailLabel.textColor = [UIColor whiteColor];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	Label.textColor = [UIColor blackColor];
	DetailLabel.textColor = [UIColor blackColor];
	[owner performSelector:selector];
	
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.view.backgroundColor = [UIColor whiteColor];
	Label.textColor = [UIColor blackColor];
	DetailLabel.textColor = [UIColor blackColor];
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
	
	
	Label.text = buttonData.Title;
	SmallLabel.text = buttonData.SmallText;
	DetailLabel.text = buttonData.BigText;
	Image.image =[UIImage imageNamed:buttonData.ImageName];
	
	[self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[self.view.layer setBorderWidth:1];
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
	
	[Image release];
	[Label release];
	[SmallLabel release];
	[DetailLabel release];
	
	[buttonData release];
	
    [super dealloc];
}


@end
