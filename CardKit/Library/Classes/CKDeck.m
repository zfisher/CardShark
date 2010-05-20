//
//  CKDeck.m
//  CardKit
//
//  Created by Carter Allen on 5/2/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import "CKDeck.h"

@implementation CKDeck
#pragma mark -
#pragma mark Properties
@synthesize size;
#pragma mark -
#pragma mark Initializers
+ (CKDeck *)standardDeck {
	return [[[self alloc] initWithSize:52 constraints:CKStandardDeck] autorelease];
}
+ (CKDeck *)deckWithSize:(int)theSize constraints:(CKDeckConstraint)constraints, ... {
	va_list args;
	va_start(args, constraints);
	CKDeck *theDeck = [[[self alloc] initWithSize:theSize constraints:args] autorelease];
	va_end(args);
	return theDeck;
}
- (id)initWithSize:(int)theSize constraints:(va_list)constraints {
	if ((self = [super init])) {
		self.size = theSize;
		int constraint;
		for (constraint = (int)constraints; constraint; constraint = (int)va_arg(constraints, id))
			NSLog(@"%d", constraint);
	}
	return self;
}
@end