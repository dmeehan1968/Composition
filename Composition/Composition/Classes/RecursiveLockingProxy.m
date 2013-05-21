//
//  RecursiveLockingProxy.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "RecursiveLockingProxy.h"

@interface RecursiveLockingProxy ()

@property (strong) id target;
@property (strong) NSRecursiveLock *recursivelock;

@end

@implementation RecursiveLockingProxy

-(id)initWithTarget: (id) target {
	
	if (self) {

		_target = target;
		_recursivelock = [[NSRecursiveLock alloc] init];
		
	}
	return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation {
	
	[self lock];
	
	[invocation setTarget: self.target];
	[invocation invoke];
	
	[self unlock];
	
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
	
	return [self.target methodSignatureForSelector:sel];
	
}

-(void)lock {
	[self.recursivelock lock];
}

-(void)unlock {
	[self.recursivelock unlock];
}

@end
