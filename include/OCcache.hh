#pragma once
#import <objc/NSObject.h>
#include <stdlib.h>
#include <stdio.h>
@class OCfile;

@interface OCcache : NSObject
{
	void*		p;
	size_t	bytes;
	size_t	elementBytes;
	BOOL		shadow;
}
@property (readonly, nonatomic) void* p;
@property (readonly, nonatomic) BOOL shadow;
@property (readonly, nonatomic) size_t bytes;
@property (readonly, nonatomic) size_t elementByteCount;

-(id)		init;
-(void) dealloc;

-(id)		initWithOCcache:(OCcache*)occ
                        beginElement:(size_t)b
                            count:(size_t)c
                            shadow:(BOOL)b;

-(id)		initWithOCcache:(OCcache*)occ;

-(id)		initWithBytes:(void*) bytes
                    size:(size_t) s
					elementSize:(size_t)e;

-(id)		initWithIntValue:(int) v
									 count:(size_t)n;
-(id)		initWithUIntValue:(unsigned int) v
										count:(size_t)n;
-(id)		initWithCharValue:(char) v
										count:(size_t)n;
-(id)		initWithUCharValue:(unsigned char) v
										 count:(size_t)n;
-(id)		initWithShortValue:(short)v
										 count:(size_t)n;
-(id)		initWithUShortValue:(unsigned short)v
                        count:(size_t)n;
-(id)		initWithLongValue:(long)v
										count:(size_t)n;
-(id)		initWithULongValue:(unsigned long)v
										 count:(size_t)n;

-(id)		initWithFloatValue:(float)v
										 count:(size_t)n;
-(id)		initWithDoubleValue:(double)v
											count:(size_t)n;

+(id) OCcacheWithOCcache:(OCcache*)occ;
+(id) shadowOCcacheWithOCcache:(OCcache*)occ
									beginElement:(size_t)b
												 count:(size_t)r;


-(size_t) count;
-(void*)	entryWithOffset:(size_t)offset;

-(void*) elementPtrAtIndex:(size_t)i;

@end


