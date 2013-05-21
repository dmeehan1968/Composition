#import "Kiwi.h"
#import "RecursiveLockingProxy.h"

@interface RLPTest : NSObject

-(void)targetMethod;

@end

@implementation RLPTest

-(void)targetMethod {
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end

SPEC_BEGIN(RecursiveLockingProxySpec)

describe(@"RecursiveLockingProxy", ^{
	
	__block RecursiveLockingProxy *sut;
	__block RLPTest *testObject;
	
	beforeEach(^{
	
		testObject = [RLPTest new];
		
		sut = [[RecursiveLockingProxy alloc] initWithTarget:testObject];
		
	});
	
	it(@"should exist", ^{
		
        [sut shouldNotBeNil];
        
    });
	
	it(@"should invoke method on target object", ^{
		
		[[testObject should] receive:@selector(targetMethod)];
		
        [(id)sut targetMethod];
        
    });
	
	xit(@"should call lock and unlock around method call", ^{
	
		// Cannot currently be tested due to Kiwi stub additions missing from NSProxy
		[[sut should] receive:@selector(lock)];
		
        [(id)sut targetMethod];
        
    });

	
});

SPEC_END


