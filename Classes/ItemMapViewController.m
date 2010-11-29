//
//  ItemMapViewController.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-16.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "ItemMapViewController.h"
#import "AddressAnnotation.h"
#import "Item.h"
#import <QuartzCore/QuartzCore.h>

@implementation ItemMapViewController

@synthesize mapView;
@synthesize titleLabel;
@synthesize backgroundView;
@synthesize imageView;
@synthesize barButton;


-(id)initWithItem:(Item*)i
{
	self =[super init];
	if(self)
	{
		mItem = i;
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

-(CLLocationCoordinate2D) addressLocation
{
	CLLocationCoordinate2D location;
	location.latitude = 19.660694;
	location.longitude = -155.99556;
	return location;
}

-(IBAction) linkPressed:(id)sender
{
	NSString * Title = [mItem.Title stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	NSString * Address = [mItem.Address stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	
	[[UIApplication sharedApplication]openURL:
	 [NSURL URLWithString:
	  [NSString stringWithFormat:@"http://maps.google.com/maps?hl=en&ll=19.660694,-155.99556&z=8&daddr=%@+%@",Title,Address]]];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lavamanbackground.jpg"]]];
	
	self.navigationItem.rightBarButtonItem = barButton;
	[mapView.layer setMasksToBounds:YES];
	[mapView.layer setCornerRadius:10];
	[mapView.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[mapView.layer setBorderWidth:1];
	
	[backgroundView.layer setMasksToBounds:YES];
	[backgroundView.layer setCornerRadius:10];
	[backgroundView.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
	[backgroundView.layer setBorderWidth:1];
	
	titleLabel.text = mItem.Title;
	imageView.image = [UIImage imageNamed:mItem.Image];
	
	
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	
	span.latitudeDelta = 0.2;
	span.longitudeDelta = 0.2;
	
	CLLocationCoordinate2D location = [self addressLocation];
	region.span=span;
	region.center = location;
	if(addAnnotation!=nil)
	{
		[mapView removeAnnotation:addAnnotation];
		[addAnnotation release];
		addAnnotation=nil;
	}
	
	addAnnotation = [[AddressAnnotation alloc]initWithCoordinate:location Title:mItem.Title Message:mItem.Address];
	[mapView addAnnotation:addAnnotation];
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
	
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKPinAnnotationView *annView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"currentLocation"];
	annView.pinColor = MKPinAnnotationColorGreen;
	annView.animatesDrop = TRUE;
	annView.canShowCallout = YES;
	annView.calloutOffset = CGPointMake(-5, -5);
	
	return annView;
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
    [super dealloc];
}


@end