//
//  Array.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IArrayDelegate.h"
#import "IArray.h"

@interface Array : NSProxy <IArray>

-(id)init;
-(id)initWithArray: (NSArray *)array;

@end