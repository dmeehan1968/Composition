//
//  MutableArray.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IArray.h"
#import "IMutableArray.h"

@interface MutableArray : NSProxy <IArray, IMutableArray, IArrayDelegate, NSLocking>

-(id)init;
-(id)initWithArray: (NSArray *)array;

@end
