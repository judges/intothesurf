//
//  ThingsToSeeAndDoCreator.m
//  Lavaman
//
//  Created by Todd Wanke on 10-11-02.
//  Copyright 2010 OHHI Ventures. All rights reserved.
//

#import "TravelActivitiesCreator.h"
#include "Category.h"
#include "Item.h"

@implementation TravelActivitiesCreator

+(NSArray*) CreateTravelActivities
{
	NSMutableArray *itemArray = [[NSMutableArray alloc]init];
	NSMutableArray *array =[[NSMutableArray alloc]init];
		
	// food    
	[itemArray addObject:[Item initWithTitle:@"Kona Brewery" Image:@"konabrew.jpg"   Address:@"75-5629 Kuakini Hwy, Kailua-Kona, HI"     Info:@"Promotion: coming soon" Link:@"www.konabrewery.com"  ll1:19.641961 ll2:-155.99646]];	
	[itemArray addObject:[Item initWithTitle:@"Jackie Reys"  Image:@"jackiereys.jpg" Address:@"75-5995 Kuakini Highway, Kailua-Kona, HI" Info:@"Promotion: coming soon" Link:@"www.jackiereys.com"   ll1:19.62707  ll2:-155.98135]];	
	[itemArray addObject:[Item initWithTitle:@"Starbucks"    Image:@"starbucks.jpg"  Address:@"201 Waikoloa Beach Dr, Waikoloa, HI"      Info:@"Promotion: coming soon" Link:@"www.starbucks.com"    ll1:19.91370  ll2:-155.87999]];	
	[array addObject:[Category categoryWithImageName:@"food_category.png" Label:@"Food" Items:itemArray]];
	[itemArray release];
	
	//activities
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Fair Wind Cruises" Image:@"fairwinds.jpg"    Address:@"78-7130 Kaleiopapa Street, Kailua-Kona" Info:@"Promotion: coming soon" Link:@"www.fair-wind.com"     ll1:19.56177  ll2:-155.96215]];	
	[itemArray addObject:[Item initWithTitle:@"Ocean Sports"      Image:@"oceansports.jpg"  Address:@"69-275 Waikoloa Beach Drive HI 96738"   Info:@"Promotion: coming soon" Link:@"hawaiioceansports.com" ll1:19.91697  ll2:-155.88473]];		
	[array addObject:[Category categoryWithImageName:@"activities_category.png" Label:@"Activities" Items:itemArray]];
	[itemArray release];
		
	//shopping
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Queens Marketplace" Image:@"queens.jpg"      Address:@"201 Waikoloa Beach Drive, Waikoloa, HI" Info:@"Promotion: "       Link:@"www.queensmarketplace.net"]];	
	[array addObject:[Category categoryWithImageName:@"shopping_category.png" Label:@"Shopping" Items:itemArray]];
	[itemArray release];
	
	//places
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Coming Soon"     Image:@"comingsoon.jpg" Address:@"lavamantriathlon.com" Info:@"Promotion: " Link:@"www.lavamantriathlon.com"]];	
	[array addObject:[Category categoryWithImageName:@"places_category.png" Label:@"Sites" Items:itemArray]];
	[itemArray release];
	
	//hotels
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Hilton"          Image:@"hilton.jpg"     Address:@"425 Waikoloa Beach Drive, Waikoloa, HI" Info:@"Promotion: " Link:@"www.hilton.com"]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Lodging" Items:itemArray]];
	[itemArray release];
	
	//gear
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Bike Works"      Image:@"bikeworks.jpg" Address:@"201 Waikoloa Beach Dr, Waikoloa, HI"          Info:@"Promotion: " Link:@"www.bikeworks.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Hammer"          Image:@"hammer.jpg"    Address:@"4952 Whitefish Stage Rd, Whitefish, MT 59937" Info:@"Promotion: " Link:@"www.hammernutrition.com"]];	
	[itemArray addObject:[Item initWithTitle:@"XTerra Wetsuits" Image:@"xterra.jpg"    Address:@"8380 Miramar Mall, San Diego, CA 92121"       Info:@"Promotion: " Link:@"www.xterrawetsuits.com"]];	
	[array addObject:[Category categoryWithImageName:@"cart.jpg" Label:@"Gear" Items:itemArray]];
	[itemArray release];
	
	//coaching
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Eric Neilsen"     Image:@"eric.jpg"     Address:@"Kailua-Kona, HI" Info:@"" Link:@"www.coachericneilsen.com"]];	
	[itemArray addObject:[Item initWithTitle:@"Luis De La Torre" Image:@"luis.jpg"     Address:@"Kailua-Kona, HI" Info:@"" Link:@"www.luisdelatorre.com"]];	
	[array addObject:[Category categoryWithImageName:@"karolina.jpg" Label:@"Coaching" Items:itemArray]];
	[itemArray release];
	
	//nightlife
	itemArray =[[NSMutableArray alloc]init];
	[itemArray addObject:[Item initWithTitle:@"Coming Soon" Image:@"comingsoon.jpg"   Address:@"lavamantriathlon.com" Info:@"Promotion: " Link:@"www.lavamantriathlon.com"]];	
	[array addObject:[Category categoryWithImageName:@"" Label:@"Nightlife" Items:itemArray]];
	[itemArray release];
		
	return array;	
}
@end
