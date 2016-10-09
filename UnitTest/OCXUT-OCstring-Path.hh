#pragma once
#import "OCXUnitTestObject.hh"
#import "OCstring.hh"
#import "OCstring+Path.hh"
#import "OCstring+ContentUtil.hh"
#import "OCarray.hh"

@interface OCXUT_OCstring_Path : OCXUnitTestObject
-(BOOL) OCXUT_isValidPath;
-(BOOL) OCXUT_isRelativePath;
-(BOOL) OCXUT_isAbsolutePath;

-(BOOL) OCXUT_filename;
-(BOOL) OCXUT_typename;
-(BOOL) OCXUT_pathComponents;
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
							 afterIndex:(int)idx;
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
							beforeIndex:(int)idx;

-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
					 afterComponent:(OCstring*)t;
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
					beforeComponent:(OCstring*)t;

-(BOOL) OCXUT_appendComponent:(OCstring*)s;
-(BOOL) OCXUT_isDirectory;
-(BOOL) OCXUT_isFile;

-(BOOL) OCXUT_removeRoot;
-(BOOL) OCXUT_removePathComponent:(OCstring*)s;
-(BOOL) OCXUT_removePathComponentAtIndex:(int)idx;
-(BOOL) OCXUT_removeLastPathComponent;

-(BOOL)	OCXUT_replacePathComponent:(OCstring*)s
															with:(OCstring*)ns;

-(BOOL) OCXUT_replaceAllPathComponents:(OCstring*)s
													with:(OCstring*)ns;
@end
