//
//  LoggingProxy.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoggingProxy : NSProxy

-(id)initWithTarget: (id) target;

@end
