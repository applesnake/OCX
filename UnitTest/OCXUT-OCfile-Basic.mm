#import "OCXUT-OCfile-Basic.hh"
#include <string.h>
#include <stdlib.h>


@implementation OCXUT_OCfile_Basic
-(BOOL) OCXUT_initWithFile:(FILE*)f{
	@autoreleasepool{
		system("echo 1 > 1");
		FILE* ff = fopen("./1", "r");
		OCfile* ocf = [[OCfile alloc] initWithFile:ff];
		if(ocf.f == ff) {
			[ocf close];
			return YES;
		}
		return NO;
	};
};
-(BOOL) OCXUT_initWithFileCname:(const char*)f
									 flag:(const char*)flags{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [[OCfile alloc] initWithFileCname:"./1"
																							 flag:"r"];
		if(ocf.f != nil) {
			[ocf close];
			return YES;
		}
		return NO;
	};
};
-(BOOL) OCXUT_initWithFileOCname:(OCstring*)f
										flag:(OCstring*)flags{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [[OCfile alloc] initWithFileOCname:S("./1")
																								flag:S("r")];
		if(ocf.f != nil) {
			[ocf close];
			return YES;
		}
		return NO;
	};
};

-(BOOL) OCXUT_OCfileWithFile:(FILE*)f{
	@autoreleasepool{
		system("echo 1 > 1");
		FILE* ff = fopen("./1", "r");
		OCfile* ocf = [OCfile OCfileWithFile:ff];
		if(ocf.f == ff) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_OCfileWithFileCname:(const char*)f
														 flag:(const char*)flags{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		if(ocf.f != nil) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_OCfileWithFileOCname:(OCstring*)f
											flag:(OCstring*)flags{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [OCfile OCfileWithFileOCname:S("./1")
																					flag:S("r")];
		if(ocf.f != nil) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};

-(BOOL) OCXUT_fileBytes{
	@autoreleasepool{
		system("echo 123 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		if([ocf fileBytes] == 4) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_leftBytes{
	@autoreleasepool{
		system("echo 123 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		fseek(ocf.f, 1, SEEK_SET);
		if([ocf leftBytes] == 3) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_currentPos{
	@autoreleasepool{
		system("echo 123 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		fseek(ocf.f, 3, SEEK_SET);
		if([ocf currentPos] == 3) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_seekSet{
	@autoreleasepool{
		system("echo 12345 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		fseek(ocf.f, 3, SEEK_SET);
		[ocf seekSet];
		if(ftell(ocf.f) == 0) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_seekEnd{
	@autoreleasepool{
		system("echo 123456 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1"
																				 flag:"r"];
		[ocf seekEnd];
		if(ftell(ocf.f) == 7) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};

-(BOOL) OCXUT_seekAt:(size_t)offset{
	@autoreleasepool{
		system("echo 123456 > 1 ");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
		[ocf seekAt:3];
		char buf[128] = {0};
		size_t n = fread(buf, 1, sizeof(buf), ocf.f);
		if(n == 4 && !strcmp(buf, "456\n")) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_readBytes:(size_t)n
						 withBuffer:(void*)buf{
	@autoreleasepool{
		system("echo 123456 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
		char buf[128] = {0};
		if([ocf readBytes:6
					 withBuffer:buf] == 6) {
			if(!strcmp(buf, "123456") ){
				[ocf close];
				return YES;
			}
		}
		return NO;
	}
};
-(BOOL) OCXUT_writeBytes:(size_t)n
							withBuffer:(void*)buf{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"w"];
		long t = [ocf writeBytes:5
									withBuffer:(void*)"2345"];
		if(t == 5) {
			[ocf close];
			[ocf release];
			ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
			char buf[128] = {0};
			if([ocf readBytes:sizeof(buf)
						 withBuffer:buf] == 5) {
				if(!strcmp(buf, "2345")) {
					return YES;
				}
			}
		}
		return NO;
	}
};
-(BOOL) OCXUT_readBytes:(size_t)n{
	@autoreleasepool{
		system("echo 12345 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
		OCcache* occ = [ocf readBytes:5];
		if(!strcmp((char*)(occ.p), "12345")) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_readAll{
	@autoreleasepool{
		system("echo 12345-abcdef > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
		OCcache* occ = [ocf readAll];
		if(!strcmp((char*)(occ.p), "12345-abcdef\n")) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_writeOCcache:(OCcache*)occ{
	@autoreleasepool{
		system("echo 1 > 1");
		OCfile* ocf = [OCfile OCfileWithFileCname:"./1" flag:"w"];
		OCcache* occ = [[OCcache alloc] initWithCharValue:'a'
																								count:5];
		[ocf writeOCcache:occ];
		[ocf close];
		[ocf release];
		ocf = [OCfile OCfileWithFileCname:"./1" flag:"r"];
		OCcache* occ2 = [ocf readAll];
		if(!memcmp((char*)(occ2.p), "aaaaa", 5)) {
			[ocf close];
			return YES;
		}
		return NO;
	}
};

// -(BOOL) OCXUT_writeFileWithCname:(const char*) OCXUT_fname
// 							 withProvider:(BOOL)p{
// };

// -(BOOL) OCXUT_writeFileWithOCname:(OCstring*) OCXUT_fname
// 								withProvider:(BOOL)p{
// };

// -(BOOL) OCXUT_writeFileWithFile:(FILE*)f
// 									 withProvider:(BOOL)p{
// };
@end
