//
//  CouponPage.m
//  Lavaman
//
//  Created by Jakub Dlugosz on 11-08-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "CouponPage.h"


@implementation CouponPage
@synthesize Lbl,ImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithItem:(Item*)t
{
    self = [super init];
    if(self)
    {
        mItem = t;
    }
    return  self;
}

- (void)dealloc
{
    self.Lbl=nil;
    self.ImageView=nil;
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
    self.Lbl.text = mItem.CouponText;
    self.ImageView.image = [UIImage imageNamed:mItem.CouponImage];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
	
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
