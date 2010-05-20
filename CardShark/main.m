//
//  main.m
//  CardShark
//
//  Created by Andrew Sugaya on 4/28/10.
//  Copyright Mythos 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMStackTrace.h"

void exceptionHandler(NSException *exception) {
	NSString *exceptionString = [[exception reason] stringByAppendingString:[GTMStackTraceFromException(exception) copy] ];
	NSLog(@"Died from: %@", exceptionString);
}

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSSetUncaughtExceptionHandler(&exceptionHandler);
	int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
