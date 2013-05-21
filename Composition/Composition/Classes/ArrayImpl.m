//
//  Array.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "ArrayImpl.h"

@implementation ArrayImpl

@synthesize delegate = _delegate;

-(id)initWithDelegate:(id<IArrayDelegate>)delegate {
	
	if (self = [super init]) {
		_delegate = delegate;
	}
	return self;
}

-(NSInteger)count {
	return [[self.delegate storage] count];
}

-(id)objectAtIndex:(NSInteger)index {
	return [[self.delegate storage] objectAtIndex:index];
}

@end
