//
//  myPREnterName.m
//  Lavaman
//
//  Created by Todd Wanke on 11-01-18.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import "myPREnterName.h"


@implementation myPREnterName


@synthesize TextView;

-(id)initWithRecord:(myPRRecord*)r setName:(BOOL)sn;
{
	self =[super init];
	if(self)
	{
		_record= r;
		[_record retain];
		setName =sn;
		
	}
	return self;
	
}
-(void)SetSettings:(myPRSettings*)s
{
	_settings =s;
	[_settings retain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	if(setName)
	{
		TextView.text = _record.Name;
		self.navigationItem.title=@"Name";
	}
	else 
	{
		TextView.text=_record.Label;
		self.navigationItem.title=@"Label";
	}
	[TextView becomeFirstResponder];
}

-(IBAction)ValueChanged
{
	if(setName)
	{
		_record.Name=TextView.text;
	}
	else 
	{
		_record.Label=TextView.text;
	}
}
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[_settings release];
	[_record release];
	[TextView release];
    [super dealloc];
}


@end

