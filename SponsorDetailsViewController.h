//
//  SponsorDetailsViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-01.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface SponsorDetailsViewController : UIViewController {
	UIImageView *ImgView;
	UILabel *Lbl;
	UITextView *TextView;
	
	id owner;
	SEL selector;
	
	Item* item;
}
@property(nonatomic,retain) IBOutlet UIImageView *ImgView;
@property(nonatomic,retain) IBOutlet UILabel *Lbl;
@property(nonatomic,retain) IBOutlet UITextView *TextView;

-(id)initWithItem:(Item*)i Owner:(id)o Selector:(SEL)s;

-(IBAction)Close;
@end
