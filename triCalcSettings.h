//
//  triCalcSettings.h
//  Lavaman
//
//  Created by Todd Wanke on 10-12-18.
//  Copyright 2010 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface triCalcSettings : NSObject {
	UIColor* TintColor;
	UIColor* BackgroundColor;
}

@property(nonatomic,retain)UIColor* TintColor;
@property(nonatomic,retain)UIColor* BackgroundColor;
@end
