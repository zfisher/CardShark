//
//  CardModel.h
//  CardGenius
//
//  Created by Andrew Sugaya on 4/28/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObjectModel.h"

//This is like, the stereotypical hello-world of enums. :P
typedef enum Suit{
	SPADES,
	CLUBS,
	DIAMONDS,
	HEARTS
} Suit;

@interface CardModel : GameObjectModel {
	int denomination;
	Suit suit;
}
-(id)initWithDenomination:(int)denom andSuit:(Suit)suit;

@property (readonly) int denomination;
@property (readonly) Suit suit;

@end
