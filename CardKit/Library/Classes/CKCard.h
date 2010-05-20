//
//  CKCard.h
//  CardKit
//
//  Created by Carter Allen on 3/13/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	CKHeartSuit,
	CKDiamondSuit,
	CKSpadeSuit,
	CKClubSuit,
	CKJokerSuit
} CKSuit;

typedef enum {
	CKRegularState,
	CKPulsingState,
	CKBorderedState,
	CKFlippedState
} CKCardState;

@interface CKCard : NSObject {
	CKSuit suit;
	int denomination;
	CKCardState state;
}
#pragma mark -
#pragma mark Properties
@property (nonatomic, assign) CKSuit suit;
@property (nonatomic, assign) int denomination;
@property (nonatomic, assign) CKCardState state;
#pragma mark -
#pragma mark Designated Initializer
+ (CKCard *)cardWithSuit:(CKSuit)theSuit denomination:(int)theDenomination state:(CKCardState)theState;
#pragma mark -
#pragma mark Secondary Initializers
+ (CKCard *)cardWithString:(NSString *)theString;
- (id)initWithSuit:(CKSuit)theSuit denomination:(int)theDenomination state:(CKCardState)theState;
#pragma mark -
#pragma mark Accessors
- (NSString *)stringValue;
@end