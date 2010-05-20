//
//  AddOns.h
//  teevox
//
//  Created by Andrew Sugaya on 3/28/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ARC4RANDOM_MAX      0x100000000LL

@interface UIImageView (Reflection)
-(UIImage*)reflectImageWithHeight:(NSUInteger)height;

@end

@interface UIView (FindAndResignFirstResponder)
- (BOOL)findAndResignFirstResponder;
@end

@interface UIView (Fader)

-(void)fadeWithDuration:(float)duration toOpacity:(float)opacity;
-(void)fadeInWithDuration:(float)duration;
-(void)fadeOutWithDuration:(float)duration;

@end


@interface NSString (URLString)
-(UIImage*)imageFromURLString;

@end

@interface NSArray (Safe)

-(id)safeObjectAtIndex:(int)index;

@end




@interface AddOns : NSObject {

}

@end
