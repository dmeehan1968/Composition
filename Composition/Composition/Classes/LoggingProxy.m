//
//  LoggingProxy.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "LoggingProxy.h"

@implementation LoggingProxy

-(void)forwardInvocation:(NSInvocation *)invocation {

	NSLog(@"%@", NSStringFromSelector([invocation selector]));

	[super forwardInvocation:invocation];
	
}

@end
