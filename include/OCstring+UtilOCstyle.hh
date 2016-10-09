#pragma once
#import "OCstring.hh"

@interface OCstring(UtilOCstyle)
-(id)		splitWithOCstr:(OCstring*)sp;
-(id)		use:(OCstring*)sp
concatOCstr:(OCstring*)oc, ...;
-(int)  findOCstr:(OCstring*)ocs;
-(int)	findOCstr:(OCstring*)ocs
			 withOffset:(int)n;
@end
