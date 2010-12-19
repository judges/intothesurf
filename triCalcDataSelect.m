//
//  triCalcDataSelect.m
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import "triCalcDataSelect.h"
#import <QuartzCore/QuartzCore.h>

@implementation triCalcDataSelect
@synthesize TitleLabel;
@synthesize TextField;
@synthesize MetricsLabel;
@synthesize DetailsButton;


-(id)initWithTitle:(NSString*)titl Value:(NSString*)val Metrics:(NSString*)mtr ButtonVisible:(BOOL)btn
{
	self = [super init];
	if(self)
	{
	t= titl;
		[t retain];
	v = val;
		[v retain];
	m = mtr;
		[m retain];
	b = btn;
		
	}
	return self;
}

-(void)setOwner:(id)parent delegate:(SEL)sel
{
	owner = parent;
	delegate = sel;
}

-(void)setActive:(BOOL)act
{
	if(act)
	{
		self.view.backgroundColor = [UIColor whiteColor];
		
	}
	else
	{
		self.view.backgroundColor = [UIColor lightGrayColor];
	}

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
    
	TitleLabel.text = t;
	[t release];
	MetricsLabel.text = m;
	[m release];
	TextField.text = v;
	TextField.enabled = NO;
	[v release];
	DetailsButton.hidden= !b;
	
	
	
	[super viewDidLoad];
	
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


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([touches anyObject])
	{
		UITouch * tou = [touches anyObject];
		if(tou.tapCount>0)
		{
			
			[owner performSelector:delegate withObject:self];
		}
	}
	
}


- (void)dealloc {
	
	[TitleLabel release];
	[TextField release];
	[MetricsLabel release];
	[DetailsButton release];
	
    [super dealloc];
}



@end
