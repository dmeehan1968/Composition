//
//  RecursiveLockingProxy.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCProxy.h"

@interface RecursiveLockingProxy : OCProxy

-(void)lock;
-(void)unlock;

@end
