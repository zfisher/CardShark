//
//  GameModel.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//
/*
	This class is the model for a given game.
	Specifically, this class should not be instantiated--
	it should be subclassed. See the GoFishModel for an example.
 
	
 
 */
#import "GameModel.h"


@implementation GameModel
@synthesize delegate;
@synthesize minNumberOfPlayers, maxNumberOfPlayers;
@synthesize numberOfPlayers;
@synthesize gameName;


-(id)init{
	if(self = [super init]){
		gameName = @"MetaGame";
		players = [[NSMutableArray alloc] init];
		cards = [[NSMutableArray alloc] init];
		hotSpots = [[NSMutableArray alloc] init];
		miscObjects = [[NSMutableArray alloc] init];
	}
	return self;
}
-(void)initGame{
	//Should be subclassed. Called when a new game is started.
	//Initialize game objects here
	
	
}
-(void)dealloc{
	[delegate release];
	[super dealloc];
}

@end
