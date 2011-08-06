//
//  ItemViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;

@interface ItemViewController : UIViewController {

	Item*item;
	UINavigationController* navControl;

	UIImageView *imgView;
	UILabel *titleLbl;
	UILabel *addressLbl;
	UILabel *infoLbl;
	
	UIButton *detailsBtn;
	UIColor*tmpALternativeColor;
UIButton *couponButton;
}

-(id)initWithItem:(Item*)cat Navigation:(UINavigationController*)nav;
-(void)btnPressed:(id)sender;

-(IBAction)couponPressed;

@property(nonatomic,retain)  Item* item;

@property(nonatomic,retain) IBOutlet UIImageView* imgView;
@property(nonatomic,retain) IBOutlet UILabel *titleLbl;
@property(nonatomic,retain) IBOutlet UILabel *addressLbl;
@property(nonatomic,retain) IBOutlet UILabel *infoLbl;

@property(nonatomic,retain) IBOutlet UIButton *detailsBtn;
@property(nonatomic,retain) IBOutlet UIButton *couponButton;
@end
