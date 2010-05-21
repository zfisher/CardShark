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
	it should be subclassed. See the BlackjackModel for an example.
 
	
 
 */
#import "GameModel.h"
#import "CardModel.h"
#import "CardStackModel.h"


@implementation GameModel
@synthesize delegate;
@synthesize minNumberOfPlayers, maxNumberOfPlayers;
@synthesize numberOfPlayers;
@synthesize gameName;


-(id)init{
	if(self = [super init]){
		gameName = @"MetaGame";
		players = [[NSMutableArray alloc] init];
		deck = [[NSMutableArray alloc] init];
	}
	return self;
}
-(void)initGame{
	//Should be subclassed. Called when a new game is started.
	//Initialize game objects here
	[self initPlayers];
	[self initDeck];
	[self runGame];
}
-(void)initPlayers{
	//Should be subclassed, but call this superclass. Initialize players.
	[players removeAllObjects];
}
-(void)initDeck{
	//Should be subclassed, but call this superclass. Initialize the deck.
	[deck removeAllObjects];
}

-(void)runGame{
	//Should be subclassed.
}
-(void)endGame{
	//Should be subclassed. End the game.
	
}
-(void)card:(CardModel*)card placedOnStack:(CardStackModel*)stack{
	
}

-(void)dealloc{
	[players release];
	[deck release];
	[delegate release];
	[super dealloc];
}

@end
