//
//  CardModel.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/28/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "CardModel.h"


@implementation CardModel
@synthesize suit, denomination;
@synthesize owner;

-(id)initWithDenomination:(int)denom andSuit:(Suit)s{
	if(self = [super init]){
		denomination = denom;
		suit = suit;
		owner = nil;//Owned by table
	}
	return self;
}

-(void)dealloc{
	[owner release];
	[super dealloc];
}
@end
