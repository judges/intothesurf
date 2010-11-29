//
//  CategoryViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Category;

@interface CategoryViewController : UIViewController {
	Category* category;
	UINavigationController* navControl;
	
//	UIImageView *imgView;
	
	UIButton * btn;
//	UILabel *lbl;//
//	UIColor* tmpALternativeColor;
}
//@property(nonatomic,retain) Category *Category;
@property(nonatomic,retain) IBOutlet UIButton * btn;
//@property(nonatomic,retain) IBOutlet UIImageView* imgView;
//@property(nonatomic,retain) IBOutlet UILabel *lbl;

-(id)initWithCategory:(Category*)cat Navigation:(UINavigationController*)nav;

-(IBAction)btnPressed:(id)sender;

@end
