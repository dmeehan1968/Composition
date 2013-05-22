//
//  OCProxy.m
//  Composition
//
//  Created by Dave Meehan on 22/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <objc/runtime.h>
#import <objc/Protocol.h>

#import "OCProxy.h"

@interface OCProxy ()

@property (strong) id proxiedObject;

@end


@implementation OCProxy

-(id)initWithProxiedObject:(id<NSObject>)proxiedObject {

	NSAssert(proxiedObject, @"proxiedObject must be non-nil");
	
    _proxiedObject = proxiedObject;
    
    return self;
    
}

-(void)forwardInvocation:(NSInvocation *)invocation {
	
	[invocation setTarget:self.proxiedObject];
	
	[self logInvocation: invocation];
	
	[invocation invoke];
	
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {

	Method method = class_getInstanceMethod([self class], sel);
	NSMethodSignature *signature = nil;
	
	if (method) {
		
		const char *encoding = method_getTypeEncoding(method);
		signature = [NSMethodSignature signatureWithObjCTypes:encoding];
		
	} else {
		
		signature = [self.proxiedObject methodSignatureForSelector:sel];
		
	}
	
	[self logMethodSignature: signature forSelector: sel];
	
	return signature;
}

-(BOOL)respondsToSelector:(SEL)aSelector {

	BOOL proxiedObjectResponds = NO;
	Method method = class_getInstanceMethod([self class], aSelector);

	if (! method) {

		proxiedObjectResponds = [self.proxiedObject respondsToSelector:aSelector];
		
	}
	
	[self logRespondsToSelector: aSelector withProxy: method ? YES : NO orProxiedObject: proxiedObjectResponds];
	
	return method ? YES : proxiedObjectResponds;
}

-(void)setProxyLogging:(BOOL)proxyLogging {
	
	_proxyLogging = proxyLogging;
	
	if ([self.proxiedObject respondsToSelector:@selector(setProxyLogging:)]) {

		[self.proxiedObject setProxyLogging:proxyLogging];
	}

}

-(void)logRespondsToSelector: (SEL) sel withProxy: (BOOL) withProxy orProxiedObject: (BOOL) withProxiedObject {
	
	if (! self.isProxyLogging) {
		return;
	}
	
	NSLog(@"<%@> respondsToSelector: %@ withProxy: %@ orProxiedObject: %@", NSStringFromClass([self class]), NSStringFromSelector(sel), withProxy ? @"Yes" : @"No", withProxiedObject ? @"Yes" : @"No");
}

-(void)logInvocation: (NSInvocation *) invocation {

	if (! self.isProxyLogging) {
		return;
	}
	
	NSLog(@"<%@> invocation on: %@", NSStringFromClass([self class]), [invocation target]);
	
	NSArray *argNames = [NSStringFromSelector([invocation selector]) componentsSeparatedByString:@":"];

	[argNames enumerateObjectsUsingBlock:^(NSString *argName, NSUInteger idx, BOOL *stop) {
		

		if ([argName length] > 0) {
			
			const char *argType = NULL;
			__unsafe_unretained id argValue = nil;
			
			NSString *argDescription = nil;

			if ([[invocation methodSignature] numberOfArguments] > idx+2) {
				argType = [[invocation methodSignature] getArgumentTypeAtIndex:idx+2];
			}
			
			
			if (argType) {
				
				if (strcmp(argType, "#") == 0) {

					[invocation getArgument:&argValue atIndex:idx + 2];
					
					argDescription = NSStringFromClass(argValue);
					
				} else if (strcmp(argType, "@") == 0) {

					[invocation getArgument:&argValue atIndex:idx + 2];
					
					if (argValue) {
						
						argDescription = [NSString stringWithFormat:@"%@='%@'",NSStringFromClass([argValue class]), [argValue description]];
						
					} else {
						
						argDescription = @"<nil>";
					}
					
				} else if (strcmp(argType, "q") == 0) {
					
					NSInteger intValue = 0;
					
					[invocation getArgument:&intValue atIndex:idx + 2];
					
					argDescription = [NSString stringWithFormat:@"int=%ld", intValue];
					
				} else {
					
					argDescription = [NSString stringWithFormat:@"typecode=%s, not handled", argType];
				}
				
			}
			
			NSLog(@"\t%lu: %@%@", idx, argName, argType ? [NSString stringWithFormat:@": %@", argDescription] : @"");
		}
	}];
	
}

-(void)logMethodSignature: (NSMethodSignature *) signature forSelector: (SEL) sel {
	
	if (! self.isProxyLogging) {
		return;
	}
	
	NSLog(@"<%@> methodSignatureForSelector: %@ = %p", NSStringFromClass([self class]), NSStringFromSelector(sel), signature);
}

@end
