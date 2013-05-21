//
//  MutableArrayImpl.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMutableArray.h"

@interface MutableArrayImpl : NSObject <IMutableArray>

-(id)initWithDelegate: (id<IArrayDelegate>) delegate;

@end
