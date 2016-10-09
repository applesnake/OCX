#pragma once
#import <objc/NSObject.h>
#include <stdio.h>
#import "OCstring.hh"

#include <string>
using namespace std;

@class OCcache

@interface OCfile : NSObject
{
	FILE*		f;
	string	fname;
}
-(id) init;
-(void) dealloc;
-(id) initWithFile:(FILE*)f;
-(id) initWithFileCname:(const char*)f
									 flag:(const char*)flags;
-(id) initWithFileOCname:(OCstring*)f
										flag:(OCstring*)flags;

+(id) OCfileWithFile:(FILE*)f;
+(id) OCfileWithFileCname:(const char*)f
										 flag:(const char*)flags;
+(id) OCfileWithFileOCname:(OCstring*)f
											flag:(OCstring*)flags;


-(size_t) fileBytes;
-(size_t) leftBytes;
-(size_t) currentPos;
-(void) seekSet;
-(void) seekEnd;
-(void) truncate:(size_t)off;
-(void) seekAt:(size_t)offset;
-(long) readBytes:(size_t)n
			 withBuffer:(void*)buf;
-(long) writeBytes:(size_t)n
				withBuffer:(void*)buf;
-(void) close;

-(OCcache*) readBytes:(size_t)n;
-(OCcache*) readAll;
-(long) writeOCcache:(OCcache*)occ;

+(int) writeFileWithCname:(const char*) fname
							 withProvider:(id)p;

+(int) writeFileWithOCname:(OCstring*) fname
								withProvider:(id)p;

+(int) writeFileWithFile:(FILE*)f
							withProvider:(id)p;

@end
