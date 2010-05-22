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
	[deck clearStack];
}

-(BOOL)gameEnded{
	//Should be subclassed. Return YES if the game has met end conditions
	//like uno (person has no more cards); hearts (all players have no more cards
	//blackjack (everybody except for one person has 0 points)
	return NO;
}
-(void)startGame{
	//Should be subclassed. Start the game
}
-(void)endGame{
	//Should be subclassed. End the game.
	
}
-(void)startRound{
		//Sould be subclassed. Start the round
}
-(void)endRound{
	//Should be subclassed. End the round
}
-(void)card:(CardModel*)card placedOnStack:(CardStackModel*)stack{
	//Should probably be subclassed
}

-(NSString*)description{
	return gameName;
}

-(void)dealloc{
	[players release];
	[deck release];
	[delegate release];
	[super dealloc];
}

@end
