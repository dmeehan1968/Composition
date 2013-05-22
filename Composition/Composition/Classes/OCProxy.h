//
//  OCProxy.h
//  Composition
//
//  Created by Dave Meehan on 22/05/2013.
//  Copyright (c) 2013 Dave Meehan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCProxy : NSProxy

@property (nonatomic, assign, getter = isProxyLogging) BOOL proxyLogging;

-(id)initWithProxiedObject: (id<NSObject>)proxiedObject;


@end
