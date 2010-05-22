//
//  GameModel.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerModel.h"//Imported for subclasses
#import "CardModel.h"
#import "CardStackModel.h"
@class GameViewController;


@interface GameModel : NSObject {
	GameViewController *delegate;
	
	int numberOfPlayers;
	int minNumberOfPlayers, maxNumberOfPlayers;
	NSMutableArray *players;
	CardStackModel *deck;
	NSMutableArray *hotSpots;
	
	NSString *gameName;
}
-(void)initGame;
-(void)initPlayers;
-(void)initDeck;
-(void)startGame;
-(void)endGame;
-(void)startRound;
-(void)endRound;
-(void)card:(CardModel*)card placedOnStack:(CardStackModel*)stack;
@property (readonly) int minNumberOfPlayers, maxNumberOfPlayers;
@property (assign) int numberOfPlayers;
@property (retain, nonatomic) GameViewController *delegate;
@property (readonly) NSString *gameName;
@end
