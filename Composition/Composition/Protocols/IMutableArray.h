//
//  IMutableArray.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IArrayDelegate.h"

@protocol IMutableArray <NSObject>

@property (weak) id<IArrayDelegate> delegate;

-(void)addObject: (id) object;
-(void)removeObject: (id) object;

@end
