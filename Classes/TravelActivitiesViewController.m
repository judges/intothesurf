//
//  ThingsToSeeAndDo.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "TravelActivitiesViewController.h"
#include "CategoryViewController.h"
#import <iAd/iAd.h>

@implementation TravelActivitiesViewController


-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	if(!isBannerVisible)
	{
		isBannerVisible = !isBannerVisible;
		[UIView beginAnimations:@"" context:nil];
		banner.frame = CGRectMake(banner.frame.origin.x, banner.frame.origin.y-50, 320, 50);
		[UIView setAnimationDuration:0.5];
		[UIView commitAnimations];
	}
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
	{
		return YES;	
	}
	else {
		return NO;
	}

	
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if(isBannerVisible)
	{
		isBannerVisible = !isBannerVisible;
		[UIView beginAnimations:@"" context:nil];
		banner.frame = CGRectMake(banner.frame.origin.x, banner.frame.origin.y+50, 320, 50);
		[UIView setAnimationDuration:0.5];
		[UIView commitAnimations];
		
	}
	NSLog([error localizedDescription]);
}

-(id)initWithCategoryArray:(NSArray*)array NavController:(UINavigationController*)navC
{
	self = [super init];
	
	if(self)
	{
		viewControllers =[[NSMutableArray alloc]init];
		
		for(int i=0;i<[array count];i++)
		{
			Category*c = (Category*)[array objectAtIndex:i];
			
			CategoryViewController*ctv = [[CategoryViewController alloc] initWithCategory:c Navigation:navC];
			[viewControllers addObject:ctv];
			[ctv release];
		}
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
	

	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lavamanbackground.jpg"]]];
	[self.navigationController setNavigationBarHidden:NO animated:YES];

	self.title=@"Travel / Activities";
	for (int i=0; i<[viewControllers count]; i++) 
	{
		CategoryViewController*ctv = [viewControllers objectAtIndex:i];
		
		[self.view addSubview:ctv.view];
		int x = i%2==0?20:170;
		int y = 20 + (i/2) * (ctv.view.frame.size.height +15);
		ctv.view.frame = CGRectMake(  x, y, ctv.view.frame.size.width, ctv.view.frame.size.height);
	}
	
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
	[viewControllers release];
    [super dealloc];
}


@end
