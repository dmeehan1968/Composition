#import "Kiwi.h"
#import "MutableArrayImpl.h"

SPEC_BEGIN(MutableArrayImplSpec)

describe(@"Mutable Array Implementation", ^{
	
	__block MutableArrayImpl *sut;
	__block id mockDelegate;
	__block NSMutableArray *testData;
	
	beforeEach(^{
	
		testData = [@[] mutableCopy];
		
		mockDelegate = [KWMock mockForProtocol:@protocol(IArrayDelegate)];
		[mockDelegate stub:@selector(storage) andReturn:testData];
		sut = [[MutableArrayImpl alloc] initWithDelegate:mockDelegate];
		
	});
	
	it(@"should exist", ^{
		
		[sut shouldNotBeNil];
		
	});
	
	it(@"should have one element after adding one element", ^{
		
        [sut addObject:@"One"];
		
		[[testData should] haveCountOf:1];
		
		[[testData[0] should] equal:@"One"];
        
    });
	
	it(@"should have two elements after adding two elements", ^{
		
        [sut addObject:@"One"];
		[sut addObject:@"Two"];
		
		[[testData should] haveCountOf:2];
		
		[[testData[0] should] equal:@"One"];
		[[testData[1] should] equal:@"Two"];
        
    });
	
	it(@"should have zero elements after removing element", ^{
		
        [sut addObject:@"One"];
		
		[sut removeObject:@"One"];
		
		[[sut should] haveCountOf:0];
        
    });



});

SPEC_END


