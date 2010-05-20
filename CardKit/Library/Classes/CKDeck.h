//
//  CKDeck.h
//  CardKit
//
//  Created by Carter Allen on 5/2/10.
//  Copyright 2010 Opt-6 Products, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	CKStandardDeck,
	CKExcludeJokers,
	CKIncludeJokers,
	CKExcludeHearts,
	CKIncludeHearts,
	CKExcludeDiamonds,
	CKIncludeDiamonds,
	CKExcludeSpades,
	CKIncludeSpades,
	CKExcludeClubs,
	CKIncludeClubs
} CKDeckConstraint;

@interface CKDeck : NSObject {
	int size;
}
#pragma mark -
#pragma mark Properties
@property (assign) int size;
+ (CKDeck *)standardDeck;
+ (CKDeck *)deckWithSize:(int)theSize constraints:(CKDeckConstraint)constraints, ...;
- (id)initWithSize:(int)theSize constraints:(va_list)constraints;
@end