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
	
	[itemArray addObject:[Item initWithTitle:@"Hilton" Image:@"hilton.jpg" Address:@"425 Waikoloa Beach Drive, Waikoloa, HI 96738" Info:@"Promotion: " Link:@"http://www.hiltonwaikoloavillage.com/" ll1:39.75049 ll2:-84.193726]];	
	[itemArray addObject:[Item initWithTitle:@"Waikoloa Land Co." Image:@"hawaiiphotoman.jpg" Address:@"Kailua Kona, Hi 96740" Info:@"Promotion: " Link:@"http://www.waikoloabeachresort.com/" ll1:39.75049 ll2:-84.193726]];
	[itemArray addObject:[Item initWithTitle:@"XTerra" Image:@"xterra.jpg" Address:@"http://www.xterrawetsuits.com/" Info:@"Promotion: " Link:@"http://www.xterrawetsuits.com/"]];
	[itemArray addObject:[Item initWithTitle:@"Hammer" Image:@"hammer.jpg" Address:@"http://www.hammernutrition.com/" Info:@"Promotion: " Link:@"http://www.hammernutrition.com/"]];
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery" Image:@"konabrew.jpg" Address:@"75-5629 Kuakini Highway, Kailua-Kona, Hi 96740" Info:@"Promotion: " Link:@"http://konabrewingco.com" ll1:19.641961 ll2:-155.996461]];
	[itemArray addObject:[Item initWithTitle:@"HawaiiPhotoman" Image:@"hawaiiphotoman.jpg" Address:@"Kailua Kona, Hi 96740" Info:@"Promotion: " Link:@"http://www.hawaiiphotoman.com/" ll1:39.75049 ll2:-84.193726]];
	[itemArray addObject:[Item initWithTitle:@"Bike Works" Image:@"bikeworks.jpg" Address:@"74-5583 Luhia Street, Kailua Kona, Hi 96740" Info:@"Promotion:" Link:@"http://www.bikeworkskona.com/" ll1:39.75049 ll2:-84.193726]];
	//[itemArray addObject:[Item initWithTitle:@"McDonalds" Image:@"mcdonalds.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	//[itemArray addObject:[Item initWithTitle:@"Holiday Inn" Image:@"HolidayInn.JPG" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Starbucks" Image:@"starbucks.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 10% off" Link:@""]];	
	//[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Oomph!" Image:@"oomph.png" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	//[itemArray addObject:[Item initWithTitle:@"Coca-Cola" Image:@"coca_cola.jpg" Address:@"23 str, Kailua-Kona" Info:@"Promotion: 5% off" Link:@""]];
	
	return itemArray;
}
@end
