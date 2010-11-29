//
//  TrainingTools.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "TrainingToolsViewController.h"
#import "PasteCalculatorViewController.h"
#import "CustomButtonViewController.h"
#import "CustomButtonData.h"

@implementation TrainingToolsViewController


-(void) paceCalculatorTouchUp
{
	PasteCalculatorViewController *pcvc = [[PasteCalculatorViewController alloc]init];
	[self.navigationController pushViewController:pcvc animated:YES];
	[pcvc release];
}

-(void) nutritioninstTouchUp
{
	
}
-(void) TriathlonCoachTouchUp
{
	
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
       
		CustomButtonData *cbd = [[CustomButtonData alloc] 
								 initWithTitle:@"Pace Calculator" 
								 SmallText:@"created by: Intothesurf.com" 
								 BigText:@"Promotion: free" 
								 ImageName:@"calc.png"];
		
		pace=[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(paceCalculatorTouchUp) ButtonData:cbd];
		[cbd release];
		
		CGSize s = pace.view.frame.size;
		pace.view.frame = CGRectMake(10, 40, s.width, s.height);
		
		cbd = [[CustomButtonData alloc] 
			   initWithTitle:@"Nutritionist" 
			   SmallText:@"www.nutritionisthere.com" 
			   BigText:@"Lavaman Promo: 1 month free" 
			   ImageName:@"carolina.png"];
		nutri =[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(nutritioninstTouchUp) ButtonData:cbd];
		[cbd release];
		s = nutri.view.frame.size;
		nutri.view.frame = CGRectMake(10, 140, s.width, s.height);
		
		
		cbd = [[CustomButtonData alloc] 
			   initWithTitle:@"Trathlon Coach" 
			   SmallText:@"www.tricoachwebsite.com" 
			   BigText:@"Lavaman Promo: 1 month free" 
			   ImageName:@"neil.png"];
		
		coach =[[CustomButtonViewController alloc]initWithOwner:self Selector:@selector(TriathlonCoachTouchUp) ButtonData:cbd];
		[cbd release];
		
		s = coach.view.frame.size;
		coach.view.frame = CGRectMake(10, 240, s.width, s.height);
			
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lavamanbackground.jpg"]]];
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	self.title = @"Training Tools";
	
	[self.view addSubview:pace.view];
	[self.view addSubview:coach.view];
	[self.view addSubview:nutri.view];
	


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
	[pace release];
	[nutri release];
	[coach release];
	
    [super dealloc];
}


@end
