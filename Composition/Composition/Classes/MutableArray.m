//
//  MutableArray.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "MutableArray.h"
#import "ArrayImpl.h"
#import "MutableArrayImpl.h"
#import "LoggingProxy.h"
#import "RecursiveLockingProxy.h"
#import "DistributionProxy.h"

@interface MutableArray ()

@property (strong) id implementation;
@property (strong) NSMutableArray *storage;

@end


@implementation MutableArray

-(id)init {
    
    return [self initWithArray:@[]];
    
}

-(id)initWithArray:(NSArray *)array {
    
    if (self) {
        
        id immutableArray = [[ArrayImpl alloc] initWithDelegate:self];
        id mutableArray = [[MutableArrayImpl alloc] initWithDelegate: self];
        
        id forwarder = [[DistributionProxy alloc] initWithArray: @[ immutableArray, mutableArray ]];
        
        id locker = [[RecursiveLockingProxy alloc] initWithTarget:forwarder];
        
        _implementation = [[LoggingProxy alloc] initWithTarget:locker];
        
        _storage = [array mutableCopy];
    }
    
    return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation {
    
    [invocation setTarget:self.implementation];
    [invocation invoke];
    
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    return [self.implementation methodSignatureForSelector: sel];
    
}

@end
