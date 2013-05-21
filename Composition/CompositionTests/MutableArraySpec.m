#import "Kiwi.h"
#import "MutableArray.h"

SPEC_BEGIN(MutableArraySpec)

describe(@"Mutable Array", ^{
    
	__block MutableArray *sut;
	
	beforeEach(^{
		
		sut = [[MutableArray alloc] init];
		
	});
	
    context(@"with empty array", ^{
        
        it(@"should exist", ^{
            
            [sut shouldNotBeNil];
            
        });
        
        it(@"should have zero count", ^{
            
            [[sut should] haveCountOf:0];
            
        });
        
        it(@"should be able to add a element", ^{
            
            [sut addObject:@"One"];
            
            [[sut should] haveCountOf:1];
            
            [[[sut objectAtIndex:0] should] equal:@"One"];
            
        });
        
        it(@"should be able to add and remove an element", ^{
            
            [sut addObject:@"One"];
            
            [sut removeObject:@"One"];
            
            [[sut should] haveCountOf:0];
            
        });


        
    });
    

});

SPEC_END


