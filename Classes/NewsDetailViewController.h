//
//  NewsDetailViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-11.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface NewsDetailViewController : UIViewController {
	
	Message *message;
	
	
	IBOutlet UILabel* Title;
	IBOutlet UILabel* Date;
	IBOutlet UIImageView* Image;
	IBOutlet UIView *BackgroundView;
	IBOutlet UITextView *Content;
}

-(id)initWithMessage:(Message*)msg;

@property(nonatomic,retain) IBOutlet UILabel* Title;
@property(nonatomic,retain) IBOutlet UILabel* Date;
@property(nonatomic,retain) IBOutlet UIImageView* Image;
@property(nonatomic,retain) IBOutlet UIView *BackgroundView;
@property(nonatomic,retain) IBOutlet UITextView *Content;

@end
