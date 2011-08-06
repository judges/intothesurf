//
//  Item.h
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Item : NSObject {
	NSString* Title;
	NSString* Image;
	NSString* AddressLink;
	NSString* Address;
	NSString* Info;
	NSString* Details;
	
	float Ll1;
	float Ll2;
    
    NSString* CouponText;
    NSString* CouponImage;
}

@property(nonatomic,retain)  NSString* Title;
@property(nonatomic,retain)  NSString* Image;
@property(nonatomic,retain)  NSString* AddressLink;
@property(nonatomic,retain)  NSString* Address;
@property(nonatomic,retain)  NSString* Info;
@property(nonatomic,retain)  NSString* Details;
@property(nonatomic,retain)  NSString* CouponText;
@property(nonatomic,retain)  NSString* CouponImage;
@property float Ll1;
@property float Ll2;


+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link;
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link  coupontext:(NSString*)ct couponimage:(NSString*)ci;
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2;
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2  coupontext:(NSString*)ct couponimage:(NSString*)ci;
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2 Details:(NSString*)det;
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2 Details:(NSString*)det  coupontext:(NSString*)ct couponimage:(NSString*)ci;
@end
