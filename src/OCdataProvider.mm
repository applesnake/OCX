#import "OCdataProvider.hh"

@implementation OCdataProvider
@synthesize dataPlacement, occ;
-(id) init{
	[super init];
	occ = nil;
	dataPlacement = 0;
	[self autorelease];
	[self retain];
	return self;
};
-(void) dealloc{
	occ = nil;
	dataPlacement = 0;
	[super dealloc];
};
-(id) initWithOCcache:(OCcache*)o
						placement:(size_t)t{
	[super init];
	occ = o;
	dataPlacement = t;
	[self autorelease];
	[self retain];
	return self;
};
+(id) OCdataProviderWithOCcache:(OCcache*)o
											placement:(size_t)t{
	OCdataProvider* dp = [[OCdataProvider alloc] initWithOCcache:o
																										 placement:t];
	return dp;
};

-(size_t) byteCount{
	return occ.bytes;
};
-(size_t) writeOffset{
	return dataPlacement;
};
-(void*) dataPtr{
	return occ.p;
};
-(size_t) elementSizeInByte{
	return occ.elementByteCount;
};
-(size_t) elementCount{
	return [occ count];
};

@end
