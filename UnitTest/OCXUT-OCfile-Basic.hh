#pragma once

#pragma once
#import "OCXUnitTestObject.hh"
#import "OCfile.hh"

@interface OCXUT_OCfile_Basic : OCXUnitTestObject
-(BOOL) OCXUT_initWithFile:(FILE*)f;
-(BOOL) OCXUT_initWithFileCname:(const char*)f
									 flag:(const char*)flags;
-(BOOL) OCXUT_initWithFileOCname:(OCstring*)f
										flag:(OCstring*)flags;

-(BOOL) OCXUT_OCfileWithFile:(FILE*)f;
-(BOOL) OCXUT_OCfileWithFileCname:(const char*)f
										 flag:(const char*)flags;
-(BOOL) OCXUT_OCfileWithFileOCname:(OCstring*)f
											flag:(OCstring*)flags;


-(BOOL) OCXUT_fileBytes;
-(BOOL) OCXUT_leftBytes;
-(BOOL) OCXUT_currentPos;
-(BOOL) OCXUT_seekSet;
-(BOOL) OCXUT_seekEnd;
-(BOOL) OCXUT_truncate:(size_t)off;
-(BOOL) OCXUT_seekAt:(size_t)offset;
-(BOOL) OCXUT_readBytes:(size_t)n
			 withBuffer:(void*)buf;
-(BOOL) OCXUT_writeBytes:(size_t)n
				withBuffer:(void*)buf;

-(BOOL) OCXUT_readBytes:(size_t)n;
-(BOOL) OCXUT_readAll;
-(BOOL) OCXUT_writeOCcache:(OCcache*)occ;

// -(BOOL) OCXUT_writeFileWithCname:(const char*) OCXUT_fname
// 							 withProvider:(BOOL)p;

// -(BOOL) OCXUT_writeFileWithOCname:(OCstring*) OCXUT_fname
// 								withProvider:(BOOL)p;

// -(BOOL) OCXUT_writeFileWithFile:(FILE*)f
// 									 withProvider:(BOOL)p;
@end

