//
//  triCalcDataSelect.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface triCalcDataSelect : UIViewController {
	UILabel *TitleLabel;
	UITextField *TextField;
	UILabel *MetricsLabel;
	UIButton *DetailsButton;
	
	NSString* t;
	NSString* v;
	NSString* m;
	BOOL b;

	
	id owner;
	SEL delegate;
}
-(void)setActive:(BOOL)act;

-(id)initWithTitle:(NSString*)title Value:(NSString*)val Metrics:(NSString*)m ButtonVisible:(BOOL)btn;
-(void)setOwner:(id)parent delegate:(SEL)sel;



@property(nonatomic,retain) IBOutlet UILabel *TitleLabel;
@property(nonatomic,retain) IBOutlet UITextField *TextField;
@property(nonatomic,retain) IBOutlet UILabel *MetricsLabel;
@property(nonatomic,retain) IBOutlet UIButton *DetailsButton;
@end
