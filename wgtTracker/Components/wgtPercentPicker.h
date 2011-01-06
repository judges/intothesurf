//
//  wgtPercentPicker.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-06.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface wgtPercentPicker : NSObject<UIPickerViewDataSource,UIPickerViewDelegate> {
	int currentPercent;
	
	int minValue;
	NSMutableArray* dataArray;
	
	UIPickerView* picker;
	id owner;
	SEL selector;
	
}
-(id)initWithPicker:(UIPickerView*)p Owner:(id)own Selector:(SEL)sel MinPercent:(int)min MaxPercent:(int)max;
-(int)GetPercent;
-(void)SetPercent:(int)per;
@end
