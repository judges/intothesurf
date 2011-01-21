//
//  myPRSettings.h
//  Lavaman
//
//  Created by Todd Wanke on 11-01-17.
//  Copyright 2011 IntoTheSurf LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface myPRSettings : NSObject {
	UIColor* TintColor;
	UIColor* BackgroundColor;
	UIColor* AlternateColor;
}

@property(nonatomic,retain) UIColor* TintColor;
@property(nonatomic,retain) UIColor* BackgroundColor;
@property(nonatomic,retain) UIColor* AlternateColor;

@end
