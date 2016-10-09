#pragma once
#import "OCXUnitTestObject.hh"
#import "OCcache.hh"

@interface OCXUT_OCcache_Basic : OCXUnitTestObject
-(BOOL)		OCXUT_initWithOCcache:(OCcache*)occ
								 beginElement:(size_t)b
												count:(size_t)c
											 shadow:(BOOL)b;

-(BOOL)		OCXUT_initWithOCcache:(OCcache*)occ;

-(BOOL)		OCXUT_initWithBytes:(void*) bytes
											 size:(size_t) s;

-(BOOL)		OCXUT_initWithIntValue:(int) v
												 count:(size_t)n;
-(BOOL)		OCXUT_initWithUIntValue:(unsigned int) v
													count:(size_t)n;
-(BOOL)		OCXUT_initWithCharValue:(char) v
													count:(size_t)n;
-(BOOL)		OCXUT_initWithUCharValue:(unsigned char) v
													 count:(size_t)n;
-(BOOL)		OCXUT_initWithShortValue:(short)v
													 count:(size_t)n;
-(BOOL)		OCXUT_initWithUShortValue:(unsigned short)v
														count:(size_t)n;
-(BOOL)		OCXUT_initWithLongValue:(long)v
													count:(size_t)n;
-(BOOL)		OCXUT_initWithULongValue:(long)v
													 count:(size_t)n;

-(BOOL)		OCXUT_initWithFloatValue:(float)v
													 count:(size_t)n;
-(BOOL)		OCXUT_initWithDoubleValue:(double)v
														count:(size_t)n;

+(BOOL) OCXUT_OCcacheWithOCcache:(OCcache*)occ;
+(BOOL) OCXUT_shadowOCcacheWithOCcache:(OCcache*)occ
												beginElement:(size_t)b
															 count:(size_t)r;


-(BOOL) OCXUT_count;
-(BOOL)	OCXUT_entryWithOffset:(size_t)offset;

-(BOOL) OCXUT_elementPtrAtIndex:(size_t)i;
@end
