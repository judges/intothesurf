//
//  CouponPage.h
//  Lavaman
//
//  Created by Jakub Dlugosz on 11-08-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface CouponPage : UIViewController {
    UILabel* Lbl;
    UIImageView* ImageView;
    Item* mItem;
}
-(id)initWithItem:(Item*)t;

@property(nonatomic,retain) IBOutlet UILabel* Lbl;
@property(nonatomic,retain) IBOutlet UIImageView* ImageView;

@end
