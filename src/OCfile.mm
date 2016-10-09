#import "OCfile.hh"
#import "OCcache.hh"
#include <fcntl.h>
#include <unistd.h>

@implementation OCfile
-(id) init{
	[super init];
	if([self respondsToSelector:@selector(autoChopLineBreaker:)]) {
		[self autoChopLineBreaker:YES];
	}
	f = nil;
	fname = "";
	[self autorelease];
	[self retain];
	return self;
};
-(void) dealloc{
	if(f) fclose(f);
	fname = "";
	[super dealloc];
};
-(id) initWithFile:(FILE*) fh{
	[super init];
	f = fh;
	fname = "";
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithFileCname:(const char*)filename
									 flag:(const char*)flags
{
	[super init];
	f = fopen([filename UTF8String], flags);
	fname = filename;
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithFileOCname:(OCstring*)filename
										flag:(OCstring*)flags{
	[super init];
	f = fopen([filename UTF8String], [flags UTF8String]);
	fname = filename;
	[self autorelease];
	[self retain];
	return self;
}
+(id) OCfileWithFile:(FILE*)f{
	OCfile* ocf = [[OCfile alloc] initWithFile:f];
	return ocf;
};
+(id) OCfileWithFileCname:(const char*)filename
										flag:(const char*)flags{
	OCfile* ocf = [[OCfile alloc] initWithFileCname:filename
																						 flag:flags];
	return ocf;
};
+(id) OCfileWithFileOCname:(OCstring*)filename
											flag:(OCstring*)flags{
	OCfile* ocf =[[OCfile alloc] initWithFileOCname:filename
																						 flag:flags];
	return ocf;
};
-(size_t) fileBytes{
	if(not f) return 0;
	size_t k = ftell(f);
	fseek(f, 0,SEEK_END);
	size_t n = ftell(f);
	fseek(f, k, SEEK_SET);
	return n;
};
-(size_t) leftBytes{
	if(not f) return 0;
	size_t cur = ftell(f);
	fseek(f, 0, SEEK_END);
	size_t ed = ftell(f);
	fseek(f, cur, SEE_SET);
	return ed - cur;
};
-(size_t) currentPos{
	if(not f) return 0;
	return ftell(f);
};
-(void) seekSet{
	if(f) fseek(f, 0, SEEK_SET);
};
-(void) seekEnd{
	if(f) fseek(f, 0, SEEK_END);
};
-(void) truncate:(size_t)off{
	if(f) ftruncate(f,off);
};
-(void) seekAt:(size_t) off{
	if(f) fseek(f, off, SEEK_SET);
};
-(long) readBytes:(size_t)n
			 withBuffer:(void*)buf{
	if(f) return fread(buf, 1, n, f);
	else return 0;
};
-(long) writeBytes:(size_t)n
				withBuffer:(void*)buf{
	if(f) {
		return fwrite(buf, 1, n, buf);
	}else {
		return 0;
	}
};
-(void) close{
	if(f) fclose(f);
};
-(OCcache*) readBytes:(size_t)n{
	if(f) {
		OCcache* occ = [[OCcache alloc] initWithCharValue:0
																								count:n];
		fread(occ.p, 1, n, f);
		return occ;
	}else {
		return nil;
	}
};
-(OCcache*) readAll{
	if(f) {
		size_t n = [self fileBytes];
		return [self readBytes:n];
	}
};
-(long) writeOCcache:(OCcache*)occ{
	if(f) {
		return [self writeBytes:occ.bytes
								 withBuffer:occ.p];
	}
	return 0;
};
+(int) writeFileWithCname:(const char*)fname
						 withProvider:(id)p{
	FILE* f = fopen(fname, "wb");
	if(not f) return -1;
	size_t bytes = [p byteCount];
	size_t offset = [p writeOffset];
	fseek(f, offset, SEEK_SET);
	fwrite([p dataPtr], 1, bytes, f);
	fclose(f);
	return 0;
};
+(int) writeFileWithOCname:(OCstring*)fname
							withProvider:(id)p{
	FILE* f = fopen([fname UTF8String], "wb");
	if(not f) return -1;
	size_t bytes = [p byteCount];
	size_t offset = [p writeOffset];
	fseek(f, offset, SEEK_SET);
	fwrite([p dataPtr], 1, bytes, f);
	fclose(f);
	return 0;
};
+(int) writeFileWithFile:(FILE*)f
						withProvider:(id)p{
	if(not f) return -1;
	size_t bytes = [p byteCount];
	size_t offset = [p writeOffset];
	fseek(f, offset, SEEK_SET);
	fwrite([p dataPtr], 1, bytes, f);
	return 0;
};



@end
