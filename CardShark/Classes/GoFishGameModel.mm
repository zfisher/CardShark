//
//  GoFishGameModel.mm
//  CardGenius
//
//  Created by Andrew Sugaya on 4/26/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "GoFishGameModel.h"


@implementation GoFishGameModel
-(id)init{
	if(self = [super init]){
		gameName = @"Go Fish";
		minNumberOfPlayers = 2;
		maxNumberOfPlayers = 10;
		numberOfPlayers = 2;
	}
	return self;
}

-(void)initGame{
		
}
@end
