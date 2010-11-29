//
//  Category.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Category : NSObject {

	NSString *ImageName;
	NSString *LabelTxt;
	
	NSArray *Items;
}

@property(nonatomic,retain) NSString* ImageName;
@property(nonatomic,retain) NSString* LabelTxt;
@property(nonatomic,retain)NSArray* Items;

+(id)categoryWithImageName:(NSString*)img Label:(NSString*)lbl Items:(NSArray*)items;

@end
