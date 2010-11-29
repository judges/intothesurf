//
//  RootViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-10-29.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageContainer;

@interface RootViewController : UIViewController {

	UIButton *MessagesButton;
	UILabel *MessagesLabel;
	UIActivityIndicatorView *Acivity;
	
	NSMutableData *msgCountData;
	BOOL requestPending;
	
	MessageContainer *messageContainer;
	BOOL errorDisplayed;
}



@property(nonatomic,retain) IBOutlet UILabel* MessagesLabel;
@property(nonatomic,retain) IBOutlet UIButton* MessagesButton;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView* Acivity;


@property(nonatomic,retain) MessageContainer* messageContainer;

-(void)displayError;

-(void)updateMessageCount;

-(void)finishedQueringUnread:(BOOL)success;

-(void)registrationTouchUpInside:(id)sender;
-(void)travelActivitiesUpInside:(id)sender;
-(void)messagesTouchBeganInside:(id)sender;
-(void)messagesTouchUpInside:(id)sender;

-(void)raceInfoTouchUpInside:(id)sender;
-(void)sponsorsTouchUpInside:(id)sender;
-(void)trainingToolsTouchUp:(id)sender;
@end
