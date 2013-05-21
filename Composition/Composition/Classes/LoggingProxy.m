//
//  LoggingProxy.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "LoggingProxy.h"

@interface LoggingProxy ()

@property (strong) id target;

@end

@implementation LoggingProxy

-(id)initWithTarget:(id)target {
	
	if (self) {
		_target = target;
	}
	return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation {

	NSLog(@"%@", NSStringFromSelector([invocation selector]));
	
	[invocation setTarget: self.target];
	[invocation invoke];
	
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
	
	return [self.target methodSignatureForSelector:sel];
}

@end
