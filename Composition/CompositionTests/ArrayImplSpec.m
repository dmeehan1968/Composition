#import "Kiwi.h"
#import "ArrayImpl.h"

SPEC_BEGIN(ArrayImplSpec)

describe(@"Array Implementation", ^{
	
	__block ArrayImpl *sut;
	__block id mockDelegate;
	
	context(@"with empty storage", ^{
		
		beforeEach(^{
			
			mockDelegate = [KWMock mockForProtocol:@protocol(IArrayDelegate)];
			[mockDelegate stub:@selector(storage) andReturn:@[]];
			
			sut = [[ArrayImpl alloc] initWithDelegate: mockDelegate];
			
		});
		
		it(@"should exist", ^{
			
			[sut shouldNotBeNil];
			
		});
		
		it(@"should have count of zero", ^{
			
			[[sut should] haveCountOf:0];
			
		});
		
	});

	context(@"with one element in storage", ^{
		
		__block NSArray *testArray;
		
		beforeEach(^{
			
			testArray = @[ @"One" ];
			
			mockDelegate = [KWMock mockForProtocol:@protocol(IArrayDelegate)];
			[mockDelegate stub:@selector(storage) andReturn:testArray];
			
			sut = [[ArrayImpl alloc] initWithDelegate: mockDelegate];
			
		});
		
		it(@"should have a count of one", ^{
			
			[[sut should] haveCountOf:1];
			
		});
		
		it(@"should have matching item at index zero", ^{
			
			NSString *actualElement = [sut objectAtIndex:0];
			
			[[actualElement should] equal: testArray[0]];
			
		});
		
	});
	


	
});

SPEC_END


