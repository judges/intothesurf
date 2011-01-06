//
//  wgtWeightPicker.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-02.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface wgtWeightPicker : NSObject<UIPickerViewDataSource,UIPickerViewDelegate> {
	float currentWeight;
	NSMutableArray* lbsArray;
	NSMutableArray* kgArray;
	NSMutableArray* currentArray;
	UIPickerView* picker;
	
	id owner;
	SEL selector;
}
-(id)initWithPicker:(UIPickerView*)p Owner:(id)own Selector:(SEL)sel;
-(float)GetWeight;
-(void)SetWeight:(float)wgt;
-(void)SetUseImperial:(BOOL)useImp;
@end
