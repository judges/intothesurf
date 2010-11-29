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
@class Item;

@interface ItemMapViewController : UIViewController<MKMapViewDelegate> {
	AddressAnnotation * addAnnotation;
	IBOutlet MKMapView* mapView;
	Item *mItem;
	IBOutlet UILabel *titleLabel;
	IBOutlet UIView* backgroundView;
	IBOutlet UIImageView *imageView;
	IBOutlet UIBarButtonItem *barButton;
	
}
@property(nonatomic,retain)	IBOutlet MKMapView* mapView;
@property(nonatomic,retain) IBOutlet UILabel *titleLabel;
@property(nonatomic,retain) IBOutlet UIView* backgroundView;
@property(nonatomic,retain) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) IBOutlet UIBarButtonItem *barButton;
-(id)initWithItem:(Item*)i;

-(IBAction) linkPressed:(id)sender;
@end
