//
//  DistributionProxy.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "DistributionProxy.h"

@interface DistributionProxy ()

@property (strong) NSArray *targets;

@end

@implementation DistributionProxy

-(id)initWithTargets:(NSArray *)array {

    if (self) {
        
        _targets = [array copy];
        
    }
    
    return self;
    
}

-(void)forwardInvocation:(NSInvocation *)invocation {
    
    [self.targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        
        if ([target respondsToSelector:[invocation selector]]) {
            
            [invocation setTarget:target];
            *stop = YES;
            
        }
    }];
    
    [invocation invoke];
    
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {

    __block NSMethodSignature *signature = nil;
    
    [self.targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        
        if ([target respondsToSelector:sel]) {
            
            signature = [target methodSignatureForSelector:sel];
            *stop = YES;
        }
        
    }];
    
    return signature;
    
}

@end
