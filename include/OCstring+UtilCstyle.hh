#pragma once
#import "OCstring.hh"

@interface OCstring(UtilCstyle)
-(id)		splitWithCstr:(const char*)sp;
-(id)		use:(const char*)sp
 concatCstr:(const char*)oc, ...;

-(int)  findCstr:(const char*)cs;
-(int)	findCstr:(const char*)cs
		 withOffset:(int)n;

@end 
