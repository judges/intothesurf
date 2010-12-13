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

@property(nonatomic,retain) NSString *Title;
@property(nonatomic,retain) NSString *SmallText;
@property(nonatomic,retain) NSString *BigText;
@property(nonatomic,retain) NSString *ImageName;

@end
