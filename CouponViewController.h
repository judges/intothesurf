//
//  CouponViewController.h
//  Lavaman
//
//  Created by Jakub Dlugosz on 11-08-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface CouponViewController : UIViewController {
    UIImageView *ImgView;
	UILabel *Lbl;
    id owner;
	SEL selector;
    Item* item;
}
@property(nonatomic,retain) IBOutlet UIImageView *ImgView;
@property(nonatomic,retain) IBOutlet UILabel *Lbl;

-(id)initWithItem:(Item*)i Owner:(id)o Selector:(SEL)s;

-(IBAction)Close;
@end
