//
//  ItemMapViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-16.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AddressAnnotation.h"
#import "SponsorDetailsViewController.h"
#import "CouponViewController.h"
@class Item;

@interface ItemMapViewController : UIViewController<MKMapViewDelegate> {
	AddressAnnotation * addAnnotation;
	IBOutlet MKMapView* mapView;
	Item *mItem;
	IBOutlet UILabel *titleLabel;
	IBOutlet UIView* backgroundView;
	IBOutlet UIImageView *imageView;
	IBOutlet UIBarButtonItem *barButton;
	
	IBOutlet UIButton  *link;
	
	UIButton *details;
	UIView *greyOutView;
    
    UIViewController* modalController;
	//SponsorDetailsViewController* sponsorDetails;
    
    UIButton* couponButton;
	
}
@property(nonatomic,retain) IBOutlet UIButton* details;

@property(nonatomic,retain)	IBOutlet MKMapView* mapView;
@property(nonatomic,retain) IBOutlet UILabel *titleLabel;
@property(nonatomic,retain) IBOutlet UIView* backgroundView;
@property(nonatomic,retain) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *barButton;
@property(nonatomic,retain) IBOutlet UIButton  *link;
@property(nonatomic,retain) IBOutlet  UIButton* couponButton;
-(id)initWithItem:(Item*)i;

-(IBAction) linkPressed:(id)sender;
-(IBAction) link:(id)sender;
-(IBAction) showDetails;
-(IBAction) couponAction;
-(void) closeDetails;
@end
