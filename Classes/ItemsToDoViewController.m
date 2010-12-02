//
//  ItemsToDo.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "ItemsToDoViewController.h"
#include "Item.h"
#include "ItemViewController.h"

@implementation ItemsToDoViewController

-(id)initWithItemArray:(NSArray*)array NavController:(UINavigationController*)navC
{
	self = [super init];
	if(self)
	{
	viewControllers =[[NSMutableArray alloc]init];
	
	for(int i=0;i<[array count];i++)
	{
		Item*c = (Item*)[array objectAtIndex:i];
		
		ItemViewController*ctv = [[ItemViewController alloc] initWithItem:c Navigation:navC];
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
		

	UIScrollView *sv= [[UIScrollView alloc]init];
	sv.frame = CGRectMake(0, 0, 320, 416);
	sv.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	sv.clipsToBounds = YES;        // default is NO, we want to restrict drawing within our scrollview
	sv.scrollEnabled = YES;
	sv.canCancelContentTouches = YES;
	
	[sv setContentSize: CGSizeMake(320,  10+ [viewControllers count] *90)];
	
	
	self.view = sv;
	[sv release];
	
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	
	for (int i=0; i<[viewControllers count]; i++) 
	{
		ItemViewController*ctv = [viewControllers objectAtIndex:i];
		[self.view addSubview:ctv.view];
		int x = 15;
		int y = 10+ 90*i;
		ctv.view.frame = CGRectMake(  x, y, 290, 84);
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
