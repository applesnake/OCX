#import "OCcachePrivate.hh"
#include <string.h>

template<typename T>
void* new_buffer_with_value(T t, size_t n) {
	T* pt = new T[n];
	for(size_t i = 0; i < n; ++i) {
		pt[i] = t;
	}
	return (void*)pt;
};
template<>
void* new_buffer_with_value(char t, size_t n) {
	char* pt = new char[n];
	memset(pt, t, n);
	return (void*)pt;
};
template<>
void* new_buffer_with_value(unsigned char t, size_t n) {
	unsigned char* pt = new unsigned char[n];
	memset(pt, t, n);
	return (void*)pt;
};

@implementation OCcache 
@synthesize shadow, bytes, elementByteCount;
-(id) init{
	[super init];
	p = nil;
	bytes = 0;
	elementByteCount = 1;
	shadow = NO;
	return self;
};
-(void) dealloc{
	if(not shadow) {
		if(p) delete [] (char*)p;
	}else {
		p = nil;
	}
	bytes = 0;
	elementByteCount = 1;
	shadow = NO;
	[super dealloc];

};
-(id) initWithBytes:(void*) pv
							 size:(size_t)n {
	[super init];
	p = new_buffer_with_value<char>(0, n);
	bytes = n;
	elementByteCount = 1;
	memcpy(p, pv, n);
	return self;
};
-(id)		initWithIntValue:(int) v
									 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<int>(v, n);
	bytes = n * sizeof(int);
	elementByteCount = sizeof(int);
	return self;
};
-(id)		initWithUIntValue:(unsigned int) v
										count:(size_t)n{
	[super init];
	p = new_buffer_with_value<unsigned int>(v, n);
	bytes = n * sizeof(unsigned int);
	elementByteCount = sizeof(unsigned int);
	return self;
};

-(id)		initWithCharValue:(int) v
									 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<char>(v, n);
	bytes = n * sizeof(char);
	elementByteCount = sizeof(char);
	return self;
};
-(id)		initWithUCharValue:(unsigned char) v
										 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<unsigned char>(v, n);
	bytes = n * sizeof(unsigned char);
	elementByteCount = sizeof(unsigned char);
	return self;
};

-(id)		initWithShortValue:(short) v
										 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<short>(v, n);
	bytes = n * sizeof(short);
	elementByteCount = sizeof(short);
	return self;
};
-(id)		initWithUShortValue:(unsigned short) v
										 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<unsigned short>(v, n);
	bytes = n * sizeof(unsigned short);
	elementByteCount = sizeof(unsigned short);
	return self;
};
-(id)		initWithLongValue:(long) v
										count:(size_t)n{
	[super init];
	p = new_buffer_with_value<long>(v, n);
	bytes = n * sizeof(long);
	elementByteCount = sizeof(long);
	return self;
};
-(id)		initWithULongValue:(unsigned long) v
										 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<unsigned long>(v, n);
	bytes = n * sizeof(unsigned long);
	elementByteCount = sizeof(unsigned long);
	return self;
};

-(id)		initWithFloatValue:(float) v
									 count:(size_t)n{
	[super init];
	p = new_buffer_with_value<float>(v, n);
	bytes = n * sizeof(float);
	elementByteCount = sizeof(float);
	return self;
};
-(id)		initWithDoubleValue:(double) v
											count:(size_t)n{
	[super init];
	p = new_buffer_with_value<double>(v, n);
	bytes = n * sizeof(double);
	elementByteCount = sizeof(double);
	return self;
};
-(id)		initWithOCcache:(OCcache*)occ{
	[super init];
	p = new char[occ->bytes];
	memcpy(p, occ->p, occ->bytes);
	bytes = occ->bytes;
	elementByteCount = occ->elementByteCount;
	shadow = NO;
	return self;
};

+(id) OCcacheWithOCcache:(OCcache*)occ{
	return [[OCcache alloc] initWithOCcache:occ];
};
+(id) shadowOCcacheWithOCcache:(OCcache*)occ
									beginElement:(size_t)b
												 count:(size_t)r
{
	OCcache* nocc = [[OCcache alloc] init];
	nocc->shadow = YES;
	char* p = (char*)(occ->p);
	nocc->p = p + b * occ->elementByteCount;
	nocc->bytes = r * occ->elementByteCount;
	nocc->elementByteCount = occ->elementByteCount;
	return nocc;
};

+(id) shadowOCcacheWithOCcache:(OCcache*)occ
										 beginByte:(size_t)b
												 count:(size_t)r
{
	OCcache* nocc = [[OCcache alloc] init];
	nocc->shadow = YES;
	char* pc = (char*)(occ->p);
	nocc->p = pc + b;
	nocc->bytes = r;
	nocc->elementByteCount = occ->elementByteCount;
	return nocc;
};

-(size_t) count{
	return bytes/elementByteCount;
};
-(void*) entryWithOffset:(size_t)n{
	return (void*)((char*)p + n);
};
-(void*) elementPtrAtIndex:(size_t) i{
	if((i * elementByteCount) >= (bytes)) {
		return nil;
	}
	return (void*)((char*)p + i*elementByteCount);
};

@end

