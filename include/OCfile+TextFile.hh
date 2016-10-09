#import "OCfile.hh"

@interface OCfile(TextFile)
-(id)	initWithTextFile:(FILE*)f;
+(id) OCfileWithTextFile:(FILE*)f;
-(id)	initWithTextFileCname:(const char*)f;
+(id) OCfileWithTextFileCname:(FILE*)f;
-(id)	initWithTextFileOCname:(OCstring*)f;
+(id) OCfileWithTextFileOCname:(OCstring*)f;

-(void)		autoChopLineBreaker:(BOOL)yes_no;
-(char*)	readLine;
-(id)			readLines:(size_t)n;
-(id)			readAllLines;
-(void)		each_lines:(void(^)(const char*, size_t len))cb;

@end
