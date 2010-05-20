//
//  CKCard.m
//  CardKit
//
//  Created by Carter Allen on 3/13/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import "CKCard.h"

@implementation CKCard
#pragma mark -
#pragma mark Properties
@synthesize suit;
@synthesize denomination;
@synthesize state;
#pragma mark -
#pragma mark Designated Initializer
+ (CKCard *)cardWithSuit:(CKSuit)theSuit denomination:(int)theDenomination state:(CKCardState)theState {
	return [[[self alloc] initWithSuit:theSuit denomination:theDenomination state:theState] autorelease];
}
#pragma mark -
#pragma mark Secondary Initializers
+ (CKCard *)cardWithString:(NSString *)theString {
	if ([theString length] < 2 || [theString length] > 3) { 
		[NSException raise:@"CKCardInvalidStringLength" format:@"The string passed to the CKCard cardWithString: method (%@) has an invalid length. It must be at least 2 characters, and no more than 3 characters.", theString];
		return nil;
	}
	NSString *firstLetter = [theString substringToIndex:1];
	if (!([firstLetter isEqualToString:@"C"] || [firstLetter isEqualToString:@"D"] || [firstLetter isEqualToString:@"H"] || [firstLetter isEqualToString:@"S"] || [firstLetter isEqualToString:@"J"])) {
		[NSException raise:@"CKCardInvalidStringPrefix" format:@"The string passed to the CKCard cardWithString: method (%@) is invalid. The string must begin with a C, D, H, S, or J.", theString];
		return nil;
	}
	NSString *denominationString = [theString substringWithRange:NSMakeRange(1, [theString length] - 1)];
	CKSuit theSuit;
	int theDenomination = [denominationString intValue];
	if ([firstLetter isEqualToString:@"J"]) {
		if (!([denominationString isEqualToString:@"1"] || [denominationString isEqualToString:@"2"])) {
			[NSException raise:@"CKCardInvalidJokerDenomination" format:@"The string passed to the CKCard cardWithString: method (%@) is invalid. When using the J prefix, you must use either a 1 or a 2 as the suffix.", theString];
			return nil;
		}
		return [[[CKCard alloc] initWithSuit:CKJokerSuit denomination:theDenomination state:CKRegularState] autorelease];
	}
	else if ([firstLetter isEqualToString:@"C"]) theSuit = CKClubSuit;
	else if ([firstLetter isEqualToString:@"D"]) theSuit = CKDiamondSuit;
	else if ([firstLetter isEqualToString:@"H"]) theSuit = CKHeartSuit;
	else theSuit = CKSpadeSuit;
	if (theDenomination > 13 || theDenomination < 1) {
		[NSException raise:@"CKCardInvalidDenominationString" format:@"The string passed to the CKCard cardWithString: method (%@) is invalid. The intValue of the specified prefix must be greater than or equal to 1, and less than or equal to 13.", theString];
		return nil;
	}
	return [[[CKCard alloc] initWithSuit:theSuit denomination:theDenomination state:CKRegularState] autorelease];
}
- (id)initWithSuit:(CKSuit)theSuit denomination:(int)theDenomination state:(CKCardState)theState {
	if (self = [super init]) {
		self.suit = theSuit;
		self.denomination = theDenomination;
		self.state = theState;
	}
	return self;
}
#pragma mark -
#pragma mark Utility Functions
NSString* StringFromSuit(CKSuit theSuit) {
	NSString *suitString;
	switch (theSuit) {
		case CKClubSuit:
			suitString = @"C";
			break;
		case CKDiamondSuit:
			suitString = @"D";
			break;
		case CKHeartSuit:
			suitString = @"H";
			break;
		case CKSpadeSuit:
			suitString = @"S";
			break;
		default:
			suitString = @"X";
			break;
	}
	return suitString;
}
#pragma mark -
#pragma mark Accessors
- (NSString *)stringValue {
	return [NSString stringWithFormat:@"%d%@", self.denomination, StringFromSuit(self.suit)];
}
- (void)dealloc {
    [super dealloc];
}
@end