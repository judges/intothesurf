//
//  SponsorsCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-03.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "SponsorsCreator.h"
#include "Item.h"

@implementation SponsorsCreator


+(NSArray*) CreateSponsors
{
	NSMutableArray* itemArray = [[NSMutableArray alloc]init];
	
	[itemArray addObject:[Item initWithTitle:@"Hilton"            Image:@"hilton.jpg"         Address:@"425 Waikoloa Beach Drive, Waikoloa, HI 96738"   Info:@"Promotion: " Link:@"www.hiltonwaikoloavillage.com" ll1:19.92353  ll2:-155.88728]];	
	[itemArray addObject:[Item initWithTitle:@"Waikoloa Land Co." Image:@""                   Address:@"Kailua Kona, Hi 96740"                          Info:@"Promotion: " Link:@"www.waikoloabeachresort.com"   ll1:19.92353  ll2:-155.88728]];
	[itemArray addObject:[Item initWithTitle:@"XTerra"            Image:@"xterra.jpg"         Address:@"www.xterrawetsuits.com"                         Info:@"Promotion: " Link:@"www.xterrawetsuits.com"        ll1:19.92353  ll2:-155.88728]];
	[itemArray addObject:[Item initWithTitle:@"Hammer"            Image:@"hammer.jpg"         Address:@"www.hammernutrition.com"                        Info:@"Promotion: " Link:@"www.hammernutrition.com"       ll1:19.92353  ll2:-155.88728]];
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery"      Image:@"konabrew.jpg"       Address:@"75-5629 Kuakini Highway, Kailua-Kona, Hi 96740" Info:@"Promotion: " Link:@"www.konabrewingco.com"         ll1:19.641961 ll2:-155.996461]];
	[itemArray addObject:[Item initWithTitle:@"HawaiiPhotoman"    Image:@"hawaiiphotoman.jpg" Address:@"Kailua Kona, Hi 96740"                          Info:@"Promotion: " Link:@"www.hawaiiphotoman.com"        ll1:19.64273  ll2:-155.99721]];
	[itemArray addObject:[Item initWithTitle:@"Bike Works"        Image:@"bikeworks.jpg"      Address:@"74-5583 Luhia Street, Kailua Kona, Hi 96740"    Info:@"Promotion: " Link:@"www.bikeworkskona.com"         ll1:19.64756  ll2:-155.99867]];

	//[itemArray addObject:[Item initWithTitle:@"McDonalds" Image:@"mcdonalds.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	//[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"HolidayInn.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	//[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Oomph!" Image:@"oomph.png" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	
	return itemArray;
}
@end
