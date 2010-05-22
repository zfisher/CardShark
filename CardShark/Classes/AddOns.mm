//
//  AddOns.mm
//  teevox
//
//  Created by Andrew Sugaya on 3/28/10.
//  Copyright 2010 Mythos. All rights reserved.
//

#import "AddOns.h"


@implementation NSMutableArray (Shuffle)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end


@implementation NSArray (Safe)

-(id)safeObjectAtIndex:(int)index{
	if(index >= 0 && index < [self count]){
		return [self objectAtIndex:index];
	}
	else{
		NSLog(@"Error in safe object: Attempt to get object %d out of %d", index, [self count]);
	}
	return nil;
}

@end



@implementation UIImageView (Reflection)

CGImageRef CreateGradientImage(int pixelsWide, int pixelsHigh)
{
	CGImageRef theCGImage = NULL;
	
	// gradient is always black-white and the mask must be in the gray colorspace
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	
	// create the bitmap context
	CGContextRef gradientBitmapContext = CGBitmapContextCreate(nil, pixelsWide, pixelsHigh,
															   8, 0, colorSpace, kCGImageAlphaNone);
	
	// define the start and end grayscale values (with the alpha, even though
	// our bitmap context doesn't support alpha the gradient requires it)
	CGFloat colors[] = {0.0, 1.0, 1.0, 1.0};
	
	// create the CGGradient and then release the gray color space
	CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
	CGColorSpaceRelease(colorSpace);
	
	// create the start and end points for the gradient vector (straight down)
	CGPoint gradientStartPoint = CGPointZero;
	CGPoint gradientEndPoint = CGPointMake(0, pixelsHigh);
	
	// draw the gradient into the gray bitmap context
	CGContextDrawLinearGradient(gradientBitmapContext, grayScaleGradient, gradientStartPoint,
								gradientEndPoint, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(grayScaleGradient);
	
	// convert the context into a CGImageRef and release the context
	theCGImage = CGBitmapContextCreateImage(gradientBitmapContext);
	CGContextRelease(gradientBitmapContext);
	
	// return the imageref containing the gradient
    return theCGImage;
}

CGContextRef MyCreateBitmapContext(int pixelsWide, int pixelsHigh)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	// create the bitmap context
	CGContextRef bitmapContext = CGBitmapContextCreate (nil, pixelsWide, pixelsHigh, 8,
														0, colorSpace,
														// this will give us an optimal BGRA format for the device:
														(kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
	CGColorSpaceRelease(colorSpace);
	
    return bitmapContext;
}



-(UIImage*)reflectImageWithHeight:(NSUInteger)height{
	if (!height) return nil;
    
	// create a bitmap graphics context the size of the image
	CGContextRef mainViewContentContext = MyCreateBitmapContext(self.bounds.size.width, height);
	
	// offset the context -
	// This is necessary because, by default, the layer created by a view for caching its content is flipped.
	// But when you actually access the layer content and have it rendered it is inverted.  Since we're only creating
	// a context the size of our reflection view (a fraction of the size of the main view) we have to translate the
	// context the delta in size, and render it.
	//
	CGFloat translateVertical= self.bounds.size.height - height;
	CGContextTranslateCTM(mainViewContentContext, 0, -translateVertical);
	
	// render the layer into the bitmap context
	CALayer *layer = self.layer;
	[layer renderInContext:mainViewContentContext];
	
	// create CGImageRef of the main view bitmap content, and then release that bitmap context
	CGImageRef mainViewContentBitmapContext = CGBitmapContextCreateImage(mainViewContentContext);
	CGContextRelease(mainViewContentContext);
	
	// create a 2 bit CGImage containing a gradient that will be used for masking the 
	// main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask
	// function will stretch the bitmap image as required, so we can create a 1 pixel wide gradient
	CGImageRef gradientMaskImage = CreateGradientImage(1, height);
	
	// create an image by masking the bitmap of the mainView content with the gradient view
	// then release the  pre-masked content bitmap and the gradient bitmap
	CGImageRef reflectionImage = CGImageCreateWithMask(mainViewContentBitmapContext, gradientMaskImage);
	CGImageRelease(mainViewContentBitmapContext);
	CGImageRelease(gradientMaskImage);
	
	// convert the finished reflection image to a UIImage 
	UIImage *theImage = [UIImage imageWithCGImage:reflectionImage];
	
	// image is retained by the property setting above, so we can release the original
	CGImageRelease(reflectionImage);
	
	return theImage;
	
}

@end


@implementation NSString (URLString)

-(UIImage*)imageFromURLString{
	return [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self]]];
}

@end


@implementation UIView (FindAndResignFirstResponder)
- (BOOL)findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;     
    }
    for (UIView *subView in self.subviews) {
        if ([subView findAndResignFirstResponder])
            return YES;
    }
    return NO;
}
@end

@implementation UIView (Fader)

-(void)fadeWithDuration:(float)duration toOpacity:(float)opacity{
	CABasicAnimation* fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
	[fade setDuration:duration];
	[fade setToValue:[NSNumber numberWithFloat:opacity]];
	[fade setDelegate:self];
	[fade setValue:@"Fade" forKey:@"animationType"];
	fade.fillMode = kCAFillModeForwards;
	fade.removedOnCompletion = NO;
	fade.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[self.layer addAnimation:fade forKey:@"fadeAnim"];
	
}
- (void)fadeInWithDuration:(float)duration;
{
	[self fadeWithDuration:duration toOpacity:1.0];
}
-(void)fadeOutWithDuration:(float)duration{
[self fadeWithDuration:duration toOpacity:0.0];	
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
	
	NSString* value = [theAnimation valueForKey:@"animationType"];
    if ([value isEqualToString:@"Fade"])
    {
		
		self.layer.opacity = [((CABasicAnimation*)theAnimation).toValue floatValue];
		[self.layer removeAllAnimations];
	}
		
}
@end



@implementation AddOns

@end
