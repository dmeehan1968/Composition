#import "Kiwi.h"
#import "Array.h"

SPEC_BEGIN(ArraySpec)

describe(@"Array", ^{
	
	__block Array *sut;
	
	context(@"an empty array", ^{
		
		
		beforeEach(^{
			
			sut = [[Array alloc] init];
			
		});
		
		it(@"should exist", ^{
			
			[sut shouldNotBeNil];
			
		});

		it(@"should have a count of zero", ^{
			
			[[sut should] haveCountOf:0];
			
		});

		
	});
	
	context(@"with non-empty array", ^{
		
		__block NSArray *testArray;
		
		beforeEach(^{
			
            testArray = @[ @"One", @"Two", @"Three" ];
			sut = [[Array alloc] initWithArray: testArray];
			
		});
		
		it(@"should have three elements", ^{
			
			[[sut should] haveCountOf:3];
			
		});

		it(@"should match first element", ^{
			
			[[[sut objectAtIndex:0] should] equal: @"One"];
			
		});
		
		it(@"should match last element", ^{
			
			[[[sut objectAtIndex:2] should] equal: @"Three"];
			
		});

	});
	
    context(@"with mutable array", ^{
        
        __block NSMutableArray *testArray;
        
        beforeEach(^{
            
            testArray = [@[ @"One" ] mutableCopy];
            
            sut = [[Array alloc] initWithArray:testArray];
            
        });
        
        it(@"mutating by adding to the passed array should not affect the created array", ^{
            
            [testArray addObject:@"Two"];
            
            [[sut should] haveCountOf:1];
            
        });
        
        
        it(@"mutating by removing from the passed array should not affect the created array", ^{
            
            [testArray removeAllObjects];
            
            [[sut should] haveCountOf:1];
            
        });
        
        
    });
    



	
});

SPEC_END


