//
//  CustomButtonViewController.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-15.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButtonData;

@interface CustomButtonViewController : UIViewController {
	IBOutlet UIImageView *Image;
	IBOutlet UILabel *Label;
	IBOutlet UILabel *SmallLabel;
	IBOutlet UILabel *DetailLabel;
	
	id owner;
	SEL selector;
	CustomButtonData* buttonData;
	
}

@property(nonatomic,retain)IBOutlet	UIImageView *Image;
@property(nonatomic,retain)IBOutlet UILabel *Label;
@property(nonatomic,retain)IBOutlet UILabel *SmallLabel;
@property(nonatomic,retain)IBOutlet UILabel *DetailLabel;

-(id)initWithOwner:(id)own Selector:(SEL)sel ButtonData:(CustomButtonData*)cbd;

@end
