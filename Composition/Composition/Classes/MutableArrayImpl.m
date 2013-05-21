//
//  MutableArrayImpl.m
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import "MutableArrayImpl.h"

@interface MutableArrayImpl ()

@property (weak) id<IArrayDelegate> delegate;

@end

@implementation MutableArrayImpl

@synthesize delegate = _delegate;

-(id)initWithDelegate:(id<IArrayDelegate>)delegate {
	
	if (self = [super init]) {
		
		_delegate = delegate;
	}
	return self;
}

-(NSMutableArray *) storage {
	
	id storage = [self.delegate storage];
	
	NSAssert([storage isKindOfClass:[NSMutableArray class]], @"Storage must be mutable array");
	
	return storage;
}

-(void)addObject:(id)object {
	
	[[self storage] addObject:object];
	
}

-(void)removeObject:(id)object {
	
	[[self storage] removeObject:object];
	
}

@end
