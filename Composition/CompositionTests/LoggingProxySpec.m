#import "Kiwi.h"
#import "LoggingProxy.h"

@interface LPTestObject : NSObject

-(void)targetMethod;

@end

@implementation LPTestObject

-(void)targetMethod {
	
}

@end

SPEC_BEGIN(LoggingProxySpec)

describe(@"Logging Proxy", ^{
	
	__block LoggingProxy *sut;
	__block LPTestObject *testObject;
	
	beforeEach(^{
		testObject = [LPTestObject new];
		
		sut = [[LoggingProxy alloc] initWithProxiedObject:testObject];
		
	});
	
	it(@"should exist", ^{
		
        [sut shouldNotBeNil];
        
    });
	
	it(@"should receive target method", ^{
		
		[[testObject should] receive:@selector(targetMethod)];
		
        [(id)sut targetMethod];
        
    });

	
});

SPEC_END


