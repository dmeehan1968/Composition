//
//  Array.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IArray.h"
#import "IArrayDelegate.h"

@interface ArrayImpl : NSObject <IArray>

-(id)initWithDelegate: (id<IArrayDelegate>) delegate;

@end
