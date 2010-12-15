//
//  RegistrationResultsPhotos.m
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "RegistrationResultsPhotos.h"
#import "CustomButtonViewController.h"
#import "CustomButtonData.h"

@implementation RegistrationResultsPhotos


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        
		CustomButtonData *cbd = [[CustomButtonData alloc]
								 initWithTitle:@"Registration" 
								 SmallText:@"Race is currently sold out, please add yourself to the waitlist" 
								 BigText:@"Status: Sold Out" 
								 ImageName:@"calc.png"];
		
		reg=[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(registrationTouchUpInside:)ButtonData:cbd ];
		[cbd release];
		CGSize s = reg.view.frame.size;
		reg.view.frame = CGRectMake(10, 40, s.width, s.height);
		
		cbd = [[CustomButtonData alloc]
			   initWithTitle:@"Photos" 
			   SmallText:@"Check yourself and your friends out here" 
			   BigText:@"Promotion: 10% off" 
			   ImageName:@"hawaiiphotoman.jpg"];
		
		photo =[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(photosTouchUpInside:)ButtonData:cbd ];
		[cbd release];
		s = photo.view.frame.size;
		photo.view.frame = CGRectMake(10, 140, s.width, s.height);
		
		cbd = [[CustomButtonData alloc]
			   initWithTitle:@"Results " 
			   SmallText:@"View all results for the current and past events" 
			   BigText:@"Racer's Hub Results" 
			   ImageName:@"results.png"];
		
		
		res =[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(resultsTouchUpInside:)ButtonData:cbd ];
		[cbd release];
		s = res.view.frame.size;
		res.view.frame = CGRectMake(10, 240, s.width, s.height);
    }
    return self;
}


-(void)registrationTouchUpInside:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.lavamantriathlon.com"]];
}
-(void)resultsTouchUpInside:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://theracershub.com"]];
}
-(void)photosTouchUpInside:(id)sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.hawaiiphotoman.com"]];
}

-(void)viewWillAppear:(BOOL)animated
{
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
	
	self.title = @"Registration";

	[self.view addSubview:reg.view];
	[self.view addSubview:res.view];
	[self.view addSubview:photo.view];
		
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
	[reg release];
	[photo release];
	[res release];
    [super dealloc];
}


@end
