#import "OCcache.hh"
//#import "OCfile.hh"
#include <string.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCcache
@synthesize p, shadow, bytes, elementByteCount;

-(id)		init{
	[super init];
	p = nil;
	shadow = NO;
	bytes = 0;
	elementByteCount = 0;
	[self autorelease];
	[self retain];
	return self;
};
-(void) dealloc{
	if(p) delete [] (char*)p;
	shadow = NO;
	bytes = 0;
	elementByteCount = 0;
	[super dealloc];
};

-(id)		initWithOCcache:(OCcache*)occ{
	[super init];
	p = new char[occ.bytes];
	shadow = NO;
	bytes = occ.bytes;
	elementByteCount = occ.elementByteCount;
	memcpy(p, occ.p, occ.bytes);
	[self autorelease];
	[self retain];
	return self;
};

-(id)		initWithBytes:(void*) pb
								 size:(size_t)sz
					elementSize:(size_t)e
{
	[super init];
	p = new char[sz];
	shadow = NO;
	bytes = sz;
	memcpy(p,pb, sz);
	elementByteCount = e;
	[self autorelease];
	[self retain];
	return self;
};

-(id)		initWithIntValue:(int) v
									 count:(size_t)n{
	[super init];
	p = new int[n];
	shadow = NO;
	bytes = n * sizeof(int);
	elementByteCount = sizeof(int);
	for(int i = 0;i < n; ++i) ((int*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithUIntValue:(unsigned int) v
										count:(size_t)n{
	[super init];
	p = new unsigned int[n];
	shadow = NO;
	bytes = n * sizeof(unsigned int);
	elementByteCount = sizeof(unsigned int);
	for(int i = 0;i < n; ++i) ((unsigned int*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithCharValue:(char) v
									 count:(size_t)n{
	[super init];
	p = new char[n];
	shadow = NO;
	bytes = n * sizeof(char);
	elementByteCount = sizeof(char);
	for(int i = 0;i < n; ++i) ((char*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithUCharValue:(unsigned char) v
										 count:(size_t)n{
	[super init];
	p = new unsigned char[n];
	shadow = NO;
	bytes = n * sizeof(unsigned char);
	elementByteCount = sizeof(unsigned char);
	for(int i = 0;i < n; ++i) ((unsigned char*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithShortValue:(short)v
										 count:(size_t)n{
	[super init];
	p = new short[n];
	shadow = NO;
	bytes = n * sizeof(short);
	elementByteCount = sizeof(short);
	for(int i = 0;i < n; ++i) ((short*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithUShortValue:(unsigned short)v
										 count:(size_t)n{
	[super init];
	p = new unsigned short[n];
	shadow = NO;
	bytes = n * sizeof(unsigned short);
	elementByteCount = sizeof(unsigned short);
	for(int i = 0;i < n; ++i) ((unsigned short*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithLongValue:(long)v
										 count:(size_t)n{
	[super init];
	p = new long[n];
	shadow = NO;
	bytes = n * sizeof(long);
	elementByteCount = sizeof(long);
	for(int i = 0;i < n; ++i) ((long*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithULongValue:(unsigned long)v
										 count:(size_t)n{
	[super init];
	p = new unsigned long[n];
	shadow = NO;
	bytes = n * sizeof(unsigned long);
	elementByteCount = sizeof(unsigned long);
	for(int i = 0;i < n; ++i) ((unsigned long*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};

-(id)		initWithFloatValue:(float)v
										 count:(size_t)n{
	[super init];
	p = new float[n];
	shadow = NO;
	bytes = n * sizeof(float);
	elementByteCount = sizeof(float);
	for(int i = 0;i < n; ++i) ((float*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};
-(id)		initWithDoubleValue:(double)v
											count:(size_t)n{
	[super init];
	p = new double[n];
	shadow = NO;
	bytes = n * sizeof(double);
	elementByteCount = sizeof(double);
	for(int i = 0;i < n; ++i) ((double*)p)[i] = v;
	[self autorelease];
	[self retain];
	return self;
};

+(id) OCcacheWithOCcache:(OCcache*)occ{
	return [[OCcache alloc] initWithOCcache:occ];
};
-(id) initWithOCcache:(OCcache*)occ
				 beginElement:(size_t)b
								count:(size_t)c
							 shadow:(BOOL)yn{
	[super init];
	if(yn) {
		elementByteCount = occ.elementByteCount;
		bytes = c * elementByteCount;
		p = (char*)occ.p + b * elementByteCount;
		shadow = YES;
	}else {
		elementByteCount = occ.elementByteCount;
		bytes = c * elementByteCount;
		p = new char[bytes];
		memcpy(p, (char*)occ.p + b * elementByteCount , bytes);
		shadow = NO;
	}
	[self autorelease];
	[self retain];
	return self;
};
+(id) shadowOCcacheWithOCcache:(OCcache*)occ
									beginElement:(size_t)b
												 count:(size_t)r{
	return [[OCcache alloc] initWithOCcache:occ
														 beginElement:b
																		count:r
																	 shadow:YES];
};

-(size_t) count{
	return bytes/elementByteCount;
};
-(void*)	entryWithOffset:(size_t)offset{
	return (void*)((char*)p + offset);
};

-(void*) elementPtrAtIndex:(size_t)i{
	return (void*)((char*)p + i * elementByteCount);
};

@end
#pragma clang diagnostic pop
