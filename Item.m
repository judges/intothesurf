//
//  Item.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "Item.h"


@implementation Item
@synthesize Title;
@synthesize Address;
@synthesize Info;
@synthesize Image;
@synthesize AddressLink;
@synthesize Ll1;
@synthesize Ll2;
@synthesize Details;
@synthesize CouponText;
@synthesize CouponImage;



+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = -1;
	itm.Ll2=-1;
	[itm autorelease];
	

	return itm;
}
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link coupontext:(NSString*)ct couponimage:(NSString*)ci
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = -1;
	itm.Ll2=-1;
    itm.CouponImage=ci;
    itm.CouponText=ct;
	[itm autorelease];
	
    
	return itm;
}

+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = ll1;
	itm.Ll2= ll2;
	[itm autorelease];
	
	return itm;
}

+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2 coupontext:(NSString*)ct couponimage:(NSString*)ci
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = ll1;
	itm.Ll2= ll2;
    itm.CouponImage=ci;
    itm.CouponText=ct;
	[itm autorelease];
	
	return itm;
}


+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2 Details:(NSString*)det 
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = ll1;
	itm.Ll2= ll2;
	itm.Details = det;
	[itm autorelease];
	
	return itm;
	
	
}
+(id)initWithTitle:(NSString*)title Image:(NSString*)img Address:(NSString*)adr Info:(NSString*)inf Link:(NSString*)link ll1:(float)ll1 ll2:(float)ll2 Details:(NSString*)det coupontext:(NSString*)ct couponimage:(NSString*)ci
{
	Item *itm = [[Item alloc]init];
	itm.Title =title;
	itm.Address=adr;
	itm.Info = inf;
	itm.Image = img;
	itm.AddressLink =link;
	itm.Ll1 = ll1;
	itm.Ll2= ll2;
	itm.Details = det;
    itm.CouponImage=ci;
    itm.CouponText=ct;
	[itm autorelease];
	
	return itm;
	
	
}



-(void) dealloc
{
	self.Details = nil;
	[Title release];
	[Image release];
	[AddressLink release];
	[Address release];
	[Info release];
	self.Details=nil;
    self.CouponText=nil;
    self.CouponImage=nil;
	[super dealloc];
}


@end
