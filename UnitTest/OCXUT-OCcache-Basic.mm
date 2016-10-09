#import "OCXUT-OCcache-Basic.hh"
#include <string.h>

@implementation OCXUT_OCcache_Basic
-(BOOL)		UCXUT_initWithOCcache:(OCcache*)occ
								 beginElement:(size_t)b
												count:(size_t)c
											 shadow:(BOOL)b{
	@autoreleasepool{
		char str[] = "0123456789";
		int	 ivalues[] = {0,1,2,3,4,5,6,7,8,9};
		OCcache* occ0 = [[OCcache alloc] initWithBytes:(void*)str
																							size:10];
		OCcache* occ1 = [[OCcache alloc] initWithBytes:(void*)ivalues
																							size:(10*sizeof(int))];
		OCcache* occ00 = [[OCcache alloc] initWithOCcache:occ0
																				 beginElement:5
																								count:5
																							 shadow:NO];
		OCcache* occ10 = [[OCcache alloc] initWithOCcache:occ1
																				 beginElement:5
																								count:5
																							 shadow:YES];
		char* p0 = (char*)occ00.p;
		if(!memcmp(p0, "56789", 5) &&
			 ((p0 - 5) != occ0.p)) {
			int* p1 = (int*)occ10.p;
			if( (p1[0] == 5 && p1[1] == 6 && p1[2] == 7 && p1[3] == 8 && p1[4] == 9) &&
					(p1 - 5) == (int*)occ1.p )
				{
					return YES;
				}
		}
	}
	return NO;
};

-(BOOL)		OCXUT_initWithOCcache:(OCcache*)occ{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithBytes:(void*)"0123456789"
																						 size:10];
		OCcache* occ0 = [[OCcache alloc] initWithOCcache:occ];
		if(!memcmp(occ0.p, "0123456789", 10)) {
			return YES;
		}
	}
	return NO;
};

-(BOOL)		OCXUT_initWithBytes:(void*) bytes
											 size:(size_t) s{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithBytes:(void*)"0123456789"
																						 size:10];
		if(!memcmp(occ.p, "0123456789", 10)) {
			return YES;
		}
	}
	return NO;
};

-(BOOL)		OCXUT_initWithIntValue:(int) v
												 count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithIntValue:1
																							 coutn:5];
		int* pi = (int*)occ.p;
		for(int i = 0;i< 5; ++i) {
			if(pi[i] != 1) return NO;
		};
	}
	return YES;
};
-(BOOL)		OCXUT_initWithUIntValue:(unsigned int) v
													count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithUIntValue:0xef000000
																								count: 5];
		unsigned int* pui = (unsigned int*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(pui[i] != 0xef000000){
				return NO;
			}
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithCharValue:(char) v
													count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithCharValue:'a'
																								count:5];
		char* pc = (char*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(pc[i] != 'c')  return NO;
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithUCharValue:(unsigned char) v
													 count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithUCharValue:0xef
																								 count:5];
		unsigned char* puc = (unsigned char*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(puc[i] != 0xef) return NO;
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithShortValue:(short)v
													 count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithShortValue:-32767
																								 count:5];
		short* ps = (short*)occ.p;
		for(int i = 0; i < 5; ++i) {
			if(ps[i] != -32767) return NO;
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithUShortValue:(unsigned short)v
														count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithUShortValue:65535
																									count:5];
		unsigned short* pus = (unsigned short*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(pus[i] != 65535) return NO;
		};
	}
	return YES;
};
-(BOOL)		OCXUT_initWithLongValue:(long)v
													count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithLongValue:0xef000000ef000000
																								count:5];
		long* pl = (long*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(pl[i] != 0xef000000ef000000) return NO;
			if(pl[i] >= 0) return NO;
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithULongValue:(unsigned long)v
													 count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithULongValue:0xef000000ef000000
																								 count:5];
		unsigned long* pl = (unsigned long*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if(pl[i] != 0xef000000ef000000) return NO;
			if(pl[i] < 0) return NO;
		}
	}
	return YES;
};

-(BOOL)		OCXUT_initWithFloatValue:(float)v
													 count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithFloatValue:(float)1.123
																								 count:5];
		float* pf = (float*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if( ((pf[i] - 1.123) < -0.000001) &&
					((pf[i] - 1.123) > 0.000001) ) {
				return NO;
			}
		}
	}
	return YES;
};
-(BOOL)		OCXUT_initWithDoubleValue:(double)v
														count:(size_t)n{
	@autoreleasepool{
		OCcache* occ = [[OCcache alloc] initWithDoubleValue:(double)1.123456789
																									count:5];
		double* pd = (double*)occ.p;
		for(int i = 0;i < 5; ++i) {
			if( ((pd[i] - 1.123456789) < -0.000000001) &&
					((pd[i] - 1.123456789) > 0.0000000001) ) {
				return NO;
			}
		}
	}
	return YES;
};

+(BOOL) OCXUT_OCcacheWithOCcache:(OCcache*)occ{
	@autoreleasepool{
		OCcache* occ0 = [[OCcache alloc] initWithBytes:(void*)"0123456789"
																							size:10];
		OCcache* occ1 = [OCcache OCcacheWithOCcache:occ0];
		if(!memcmp(occ1.p, occ0, 10)) {
			return NO;
		}
	}
	return YES;
};
+(BOOL) OCXUT_shadowOCcacheWithOCcache:(OCcache*)occ
									beginElement:(size_t)b
												 count:(size_t)r{
	@autoreleasepool{
		OCcache* occ0 = [[OCcache alloc] initWithBytes:(char*)"0123456789"
																							size:10];
		OCcache* occ1 = [OCcache shadowOCcacheWithOCcache:occ0
																				 beginElement:1
																								count:9];
		char* p1 = (char*)occ1.p;
		char* p0 = (char*)occ0.p;
		if( ((p1 - 1) == p0) && [occ1 count] == 9 ) {
			return YES;
		}
	}
	return NO;
};


-(BOOL) OCXUT_count{
	@autoreleasepool{
		int values[] = {1,2,3,4,5,6,7,8,9,0};
		OCcache* occ0 = [[OCcache alloc] initWithIntValue:1
																								count:10];
		if([occ0 count] == 10) return YES;
	}
	return NO;
};
-(BOOL)	OCXUT_entryWithOffset:(size_t)offset{
	@autoreleasepool{
		OCcache* occ0 = [[OCcache alloc] initWithIntValue:1
																								count:10];
		char* pi1 = (char*)([occ0 entryWithOffset:3]);
		char* pi0 = (char*)(occ0.p);
		if(pi0 + 3 == pi1) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_elementPtrAtIndex:(size_t)i{
	@autoreleasepool{
		OCcache* occ0 = [[OCcache alloc] initWithIntValue:1
																								count:10];
		int* pi1 = (int*)([occ0 elementPtrAtIndex:3]);
		int* pi0 = (int*)(occ0.p);
		if(pi0 + 3 == pi1) {
			return YES;
		}
	}
	return NO;
};
@end
