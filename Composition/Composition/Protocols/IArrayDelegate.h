//
//  IArrayDelegate.h
//  Composition
//
//  Created by Dave Meehan on 21/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IArrayDelegate <NSObject>

-(NSArray *)storage;
-(void)setStorage: (NSArray *)storage;

@end
