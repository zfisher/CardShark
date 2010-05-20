//
//  GameModel.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameViewController;


@interface GameModel : NSObject {
	GameViewController *delegate;
	
	int numberOfPlayers;
	int minNumberOfPlayers, maxNumberOfPlayers;
	NSMutableArray *players;
	NSMutableArray *cards;
	NSMutableArray *hotSpots;//Like tokens, hotspots, locations, etc
	NSMutableArray *miscObjects;
	
	NSString *gameName;
}
-(void)initGame;
@property (readonly) int minNumberOfPlayers, maxNumberOfPlayers;
@property (assign) int numberOfPlayers;
@property (retain, nonatomic) GameViewController *delegate;
@property (readonly) NSString *gameName;
@end
