//
//  RecursiveLockingProxy.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "RecursiveLockingProxy.h"
#import <objc/runtime.h>

@interface RecursiveLockingProxy ()

@property (strong) NSRecursiveLock *recursiveLock;

@end

@implementation RecursiveLockingProxy

-(id)initWithProxiedObject:(id<NSObject>)proxiedObject {
	
	if (self = [super initWithProxiedObject:proxiedObject]) {
		
		_recursiveLock = [[NSRecursiveLock alloc] init];

	}
	
	return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation {

	[self lock];

	[super forwardInvocation:invocation];
	
	[self unlock];
	
}

-(void)lock {
	[self.recursiveLock lock];
}

-(void)unlock {
	[self.recursiveLock unlock];
}

@end
