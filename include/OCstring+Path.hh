#pragma once

#import "OCstring.hh"

@interface OCstring(Path)
-(BOOL)		isValidPath;
-(BOOL)		isRelativePath;
-(BOOL)		isAbsolutePath;

-(id)			filename;
-(id)			typename;
-(id)			pathComponents;
-(id)			insertPathComponent:(OCstring*)s
							 afterIndex:(int)idx;
-(id)			insertPathComponent:(OCstring*)s
							beforeIndex:(int)idx;

-(id)			insertPathComponent:(OCstring*)s
							 afterComponent:(OCstring*)t;
-(id)			insertPathComponent:(OCstring*)s
							beforeComponent:(OCstring*)t;

-(id)			appendComponent:(OCstring*)s;
-(BOOL)		isDirectory;
-(BOOL)		isFile;

-(id)			removeRootPath;
-(id)			removePathComponent:(OCstring*)s;
-(id)			removePathComponentAtIndex:(int)idx;
-(id)			removeLastPathComponent;

-(id)			replacePathComponent:(OCstring*)s
													with:(OCstring*)ns;

-(id)			replaceAllPathComponents:(OCstring*)s
															with:(OCstring*)ns;

@end
