//
//  CouponViewController.m
//  Lavaman
//
//  Created by Jakub Dlugosz on 11-08-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "CouponViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CouponViewController
@synthesize ImgView, Lbl;


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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ImgView.image =[UIImage imageNamed:item.CouponImage];
	Lbl.text = item.CouponText;

    [self.view.layer setMasksToBounds:YES];
	[self.view.layer setCornerRadius:10];
	[self.view.layer setBorderColor:[[UIColor blackColor] CGColor]];
	[self.view.layer setBorderWidth:2];	
}
-(IBAction)Close
{
	[owner performSelector:selector withObject:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
