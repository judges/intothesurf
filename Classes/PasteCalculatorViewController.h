//
//  PasteCalculatorViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PasteCalculatorViewController : UIViewController<UITextFieldDelegate> {
	IBOutlet UISegmentedControl* segment;
	IBOutlet UILabel *mkTextField;
	IBOutlet UITextField *distanceTextField;
	IBOutlet UITextField *hourTextField;
	IBOutlet UITextField *minuteTextField;
	IBOutlet UITextField *secondTextField;
	IBOutlet UIButton *calculatorButton;
	IBOutlet UILabel *perWhat;
	IBOutlet UILabel *paceLabel;
	IBOutlet UIBarButtonItem *closeButon;
	
}

@property(nonatomic,retain) IBOutlet UISegmentedControl* segment;
@property(nonatomic,retain) IBOutlet UILabel *mkTextField;
@property(nonatomic,retain)	IBOutlet UITextField *distanceTextField;
@property(nonatomic,retain) IBOutlet UITextField *hourTextField;
@property(nonatomic,retain) IBOutlet UITextField *minuteTextField;
@property(nonatomic,retain) IBOutlet UITextField *secondTextField;
@property(nonatomic,retain) IBOutlet UIButton *calculatorButton;

@property(nonatomic,retain) IBOutlet UILabel *paceLabel;
@property(nonatomic,retain) IBOutlet UILabel *perWhat;

@property(nonatomic,retain)	IBOutlet UIBarButtonItem *closeButon;


-(IBAction) CalculateButtonPressed:(id)sender;
-(IBAction) CloseButtonPressed:(id)sender;
-(IBAction) SegmentChanges:(id)sender;

@end
