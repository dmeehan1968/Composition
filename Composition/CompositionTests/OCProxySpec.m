#import "Kiwi.h"
#import "OCProxy.h"

@protocol OCProxyTestObject <NSObject>

-(void)voidMethod;
-(void)voidMethodWithObject: (id) object;
-(void)voidMethodWithInt:(NSInteger) intValue;

@end


@interface OCProxyTestObject : NSObject <OCProxyTestObject>

@end

@implementation OCProxyTestObject

-(void)voidMethod { }
-(void)voidMethodWithObject:(id)object { }
-(void)voidMethodWithInt:(NSInteger) intValue { }

@end

SPEC_BEGIN(OCProxySpec)

describe(@"OCProxy", ^{
    
	__block OCProxy *sut;
	__block OCProxyTestObject *proxiedObject;
    
	beforeEach(^{
		
		proxiedObject = [OCProxyTestObject new];
		
		sut = [[OCProxy alloc] initWithProxiedObject:proxiedObject];
		
	});
	
	it(@"should exist", ^{
		
        [sut shouldNotBeNil];
        
    });
    
	it(@"should have proxy logging disabled by default", ^{
		
        [[theValue([sut isProxyLogging]) should] beNo];
        
    });
	
	it(@"should allow logging to be enabled", ^{
		
		[sut setProxyLogging:YES];
		
		[[theValue([sut isProxyLogging]) should] beYes];
		
	});
	
	it(@"should allow logging to be disabled", ^{
		
		[sut setProxyLogging:NO];
		
		[[theValue([sut isProxyLogging]) should] beNo];
		
	});
	
	context(@"with logging", ^{
		
		beforeEach(^{
			
			[sut setProxyLogging:YES];
			
		});
		
		it(@"should conform to protocol", ^{
			
			[[sut should] conformToProtocol:@protocol(OCProxyTestObject)];
			
		});
		
		it(@"should be kind of class", ^{
			
			[[sut should] beKindOfClass:[OCProxyTestObject class]];
			
		});
		
		it(@"should be member of class", ^{
			
			[[sut should] beMemberOfClass:[OCProxyTestObject class]];
			
		});
		
		it(@"should respond to proxied object method", ^{
			
			[[sut should] respondToSelector:@selector(voidMethod)];
			
		});
		
		it(@"should forward to proxied object", ^{
			
			[[proxiedObject should] receive:@selector(voidMethod)];
			
			[(id)sut voidMethod];
			
		});

		it(@"should forward to proxied object for method with object argument", ^{
			
			NSString *object = @"One";
			
			[[proxiedObject should] receive:@selector(voidMethodWithObject:) withArguments:object];
			
			[(id)sut voidMethodWithObject: object];
			
		});
		
		it(@"should forward to proxied object for method with integer argument", ^{
			
			NSInteger value = 123;
			
			[[proxiedObject should] receive:@selector(voidMethodWithInt:) withArguments:theValue(value)];
			
			[(id)sut voidMethodWithInt: value];
			
		});
		
	});
	

	
    
});

SPEC_END


