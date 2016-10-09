#import "OCXUT-OCstring-Path.hh"
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

@implementation OCXUT_OCstring_Path
-(BOOL) OCXUT_isValidPath{
	@autoreleasepool{
		char cwd[1024];
		getcwd(cwd, sizeof(cwd));
		OCstring* s = [OCstring stringWithCString:cwd];
		if([s isValidPath]) {
			strcat(cwd, "/temp");
			OCstring* s2 = [OCstring stringWithCString:cwd];
			if([s2 isValidPath] == NO) {
				return YES;
			}
		}
	}
	return NO;
};
-(BOOL) OCXUT_isRelativePath{
	@autoreleasepool{
		OCstring* s0 = [OCstring stringWithCString:"../path1/path2"];
		OCstring* s1 = [OCstring stringWithCString:"/path0/path1/path2"];
		OCstring* s2 = [OCstring stringWithCString:"path1/path2"];
		if([s0 isRelativePath] &&
			 (not [s1 isRelativePath]) &&
			 [s2 isRelativePath]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_isAbsolutePath{
	@autoreleasepool{
		OCstring* s0 = [OCstring stringWithCString:"../path1/path2"];
		OCstring* s1 = [OCstring stringWithCString:"/path0/path1/path2"];
		OCstring* s2 = [OCstring stringWithCString:"path1/path2"];
		if((not [s0 isAbsolutePath]) &&
			 ([s1 isAbsolutePath]) &&
			 (not [s2 isAbsolutePath])) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_filename{
	@autoreleasepool{
		OCstring* t = S("/path1/path2/path3/filename");
		OCstring* t2 = S("/path1/path2/path3/path4/");
		if([[t filename] equalToCstr:"filename"] &&
			 [[t2 filename] equalToCstr:""]) {
			return YES;
		}else {
			return NO;
		}
	}
};
-(BOOL) OCXUT_typename{
	@autoreleasepool{
		OCstring* t = S("/path1/path2/path3/flilename.type");
		OCstring* t2 = S("/path1/path2/path3/flilename");
		if([[t typename] equalToCstr:"type"] &&
			 [[t2 typename] equalToCstr:""])
			{
				return YES;
			}
		else
			return NO;
	}
};
-(BOOL) OCXUT_pathComponents{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		OCarray* a = [t pathComponents];
		if([a length] == 6) {
			if(([[a objectAtIndex:0] equalToCstr:"/"]) &&
				 ([[a objectAtIndex:1] equalToCstr:"A"]) &&
				 ([[a objectAtIndex:2] equalToCstr:"B"]) &&
				 ([[a objectAtIndex:3] equalToCstr:"C"]) &&
				 ([[a objectAtIndex:4] equalToCstr:"D"]) &&
				 ([[a objectAtIndex:5] equalToCstr:"E"]) ) {
				return YES;
			}else {
				return NO;
			}
		}else {
			return NO;
		}
	};
};
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
											 afterIndex:(int)idx{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		[t insertPathComponent:S("X")
								afterIndex:0];
		if([t equalToCstr:"/A/X/B/C/D/E"]){
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
											beforeIndex:(int)idx{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		[t insertPathComponent:S("X")
							 beforeIndex:0];
		if([t equalToCstr:"/X/A/B/C/D/E"]){
			return YES;
		}
		return NO;
	}
};

-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
									 afterComponent:(OCstring*)t{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		[t insertPathComponent:S("X")
						afterComponent:S("B")];
		if([t equalToCstr:"/A/B/X/C/D/E"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_insertPathComponent:(OCstring*)s
									beforeComponent:(OCstring*)t{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		[t insertPathComponent:S("X")
					 beforeComponent:S("B")];
		if([t equalToCstr:"/A/X/B/C/D/E"]) {
			return YES;
		}
		return NO;
	}
};

-(BOOL) OCXUT_appendComponent:(OCstring*)s{
	@autoreleasepool{
		OCstring* t = S("/A/B/C/D/E");
		[t appendComponent:S("X")];
		if([t equalToCstr:"/A/B/C/D/E/X"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_isDirectory{
	@autoreleasepool{
		char cwd[1024];
		getcwd(cwd, sizeof(cwd));
		OCstring* s = S(cwd);
		if([s isDirectory]) {
			strcat(cwd, "/temp");
			OCstring* s2 = S(cwd);
			if([s2 isDirectory] == NO) {
				return YES;
			}
			return NO;
		}
		return NO;
	}
};
-(BOOL) OCXUT_isFile{
	@autoreleasepool{
		system("echo 1 > 1");
		char cwd[1024];
		getcwd(cwd, sizeof(cwd));
		strcat(cwd, "/1");
		OCstring* s = S(cwd);
		if([s isFile]) {
			getcwd(cwd, sizeof(cwd));
			strcat(cwd, "/2");
			OCstring* s2 = S(cwd);
			if(not [s2 isFile]) {
				return YES;
			}
			return NO;
		}
		return NO;
	};
};
-(BOOL) OCXUT_removeRoot{
	@autoreleasepool{
		OCstring* s = S("/A/B/C/D/E");
		[s removeRoot];
		if([s equalToCstr:"A/B/C/D/E"]) {
			return YES;
		}
		return NO;
	}
};

-(BOOL) OCXUT_removePathComponent:(OCstring*)s{
	@autoreleasepool{
		OCstring* s = S("/A/B/C/D/E");
		[s removePathComponent:S("C")];
		if([s equalToCstr:"/A/B/D/E"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_removePathComponentAtIndex:(int)idx{
	@autoreleasepool{
		OCstring* s = S("/A/B/C/D/E");
		[s removePathComponentAtIndex:3];
		if([s equalToCstr:"/A/B/C/E"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_removeLastPathComponent{
	@autoreleasepool{
		OCstring* s = S("/A/B/C/D/E");
		[s removeLastPathComponent];
		if([s equalToCstr:"/A/B/C/D"]) {
			return YES;
		}
		return NO;
	}
};

-(BOOL)	OCXUT_replacePathComponent:(OCstring*)s
															with:(OCstring*)ns{
	@autoreleasepool{
		OCstring* s= S("/A/B/C/D/E");
		[s replacePathComponent:S("B")
											 with:S("X")];
		if([s equalToCstr:"/A/X/C/D/E"]) {
			return YES;
		}
		return NO;
	};
};

-(BOOL) OCXUT_replaceAllPathComponents:(OCstring*)s
													with:(OCstring*)ns{
	@autoreleasepool{
		OCstring* s = S("/A/B/B/B/E");
		[s replaceAllPathComponents:S("B")
													 with:S("X")];
		if([s equalToCstr:"/A/X/X/X/E"]) {
			return YES;
		}
		return NO;
	};
};
@end
