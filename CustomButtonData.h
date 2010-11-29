//
//  CustomButtonData.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-17.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomButtonData : NSObject {
	NSString *Title;
	NSString *SmallText;
	NSString *BigText;
	NSString *ImageName;
}

-(id)initWithTitle:(NSString*)title SmallText:(NSString*)smallTest BigText:(NSString*)bigText ImageName:(NSString*)imageName;

@property(nonatomic,readonly) NSString *Title;
@property(nonatomic,readonly) NSString *SmallText;
@property(nonatomic,readonly) NSString *BigText;
@property(nonatomic,readonly) NSString *ImageName;

@end
