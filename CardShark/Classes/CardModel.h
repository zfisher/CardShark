//
//  CardModel.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/28/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObjectModel.h"
#import "PlayerModel.h"

//This is like, the stereotypical hello-world of enums. :P
typedef enum Suit{
	SPADES,
	CLUBS,
	DIAMONDS,
	HEARTS,
	JOKER
} Suit;

@interface CardModel : GameObjectModel {
	int denomination;
	Suit suit;
	PlayerModel *owner;//Or null if owned by table
}
-(id)initWithDenomination:(int)denom andSuit:(Suit)suit;

@property (readonly) int denomination;
@property (readonly) Suit suit;
@property (retain) PlayerModel *owner;
@end
