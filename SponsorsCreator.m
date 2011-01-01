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
	
	[itemArray addObject:[Item initWithTitle:@"Hilton Waikoloa"    Image:@"hilton.jpg"         Address:@"425 Waikoloa Beach Dr, Waikoloa, HI"                    Info:@"" Link:@"www.hiltonwaikoloavillage.com" ll1:19.92353  ll2:-155.88728  Details:@"Lorem ipsum"]];	
	[itemArray addObject:[Item initWithTitle:@"Queens MarketPlace" Image:@"queens.jpg"         Address:@"201 Waikoloa Beach Dr, Waikoloa, HI"                    Info:@"" Link:@"www.queensmarketplace.net"     ll1:19.91360  ll2:-155.87997]]; 

	[itemArray addObject:[Item initWithTitle:@"Bike Works"         Image:@"bikeworks.jpg"      Address:@"201 Waikoloa Beach Dr, Waikoloa, HI"                    Info:@"" Link:@"www.bikeworkskona.com"         ll1:19.91360  ll2:-155.87997]];
	[itemArray addObject:[Item initWithTitle:@"XTerra Wetsuits"    Image:@"xterra.jpg"         Address:@"www.xterrawetsuits.com"                                 Info:@"" Link:@"www.xterrawetsuits.com"        ll1:32.88040  ll2:-117.18359]]; 
	[itemArray addObject:[Item initWithTitle:@"Hammer Nutrition"   Image:@"hammer.jpg"         Address:@"www.hammernutrition.com"                                Info:@"" Link:@"www.hammernutrition.com"       ll1:19.64273  ll2:-155.99721]];

	[itemArray addObject:[Item initWithTitle:@"HawaiiPhotoman"     Image:@"hawaiiphotoman.jpg" Address:@"Kailua Kona, HI"                                        Info:@"" Link:@"www.hawaiiphotoman.com"        ll1:19.64273  ll2:-155.99721]];

	[itemArray addObject:[Item initWithTitle:@"Kona Brewery"       Image:@"konabrew.jpg"       Address:@"75-5629 Kuakini Hwy, Kailua-Kona, HI"                   Info:@"" Link:@"www.konabrewingco.com"         ll1:19.641961 ll2:-155.996461]];
	[itemArray addObject:[Item initWithTitle:@"Jackie Reys"	       Image:@"jackiereys.jpg"     Address:@"75-5995 Kuakini Hwy, Kailua-Kona, HI 808.327.0209"      Info:@"" Link:@"www.jackiereys.com"            ll1:19.62707  ll2:-155.98135]];	
	[itemArray addObject:[Item initWithTitle:@"Starbucks"	       Image:@"starbucks.jpg"      Address:@"201 Waikoloa Beach Dr, Waikoloa, HI"                    Info:@"" Link:@"www.starbucks.com"             ll1:19.91370  ll2:-155.87999]];	
 
	[itemArray addObject:[Item initWithTitle:@"Fair Wind Cruises"  Image:@"fairwinds.jpg"      Address:@"78-7130 Kaleiopapa Street, Kailua-Kona, HI 808.322.2788"  Info:@"" Link:@"www.fair-wind.com"             ll1:19.56177  ll2:-155.96215]];
	[itemArray addObject:[Item initWithTitle:@"Ocean Sports"	   Image:@"oceansports.jpg"    Address:@"69-275 Waikoloa Beach Drive, Kailua-Kona HI"              Info:@"" Link:@"www.hawaiioceansports.com"     ll1:19.91697  ll2:-155.88473]];
	
	return itemArray;
}
@end
