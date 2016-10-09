#pragma once
#include "OCstring.hh"
#include "OCstring+UtilOCstyle.hh"
#include "OCstring+UtilCstyle.hh"

@interface OCstring(Util)
-(char) lastChar;
-(char) firstChar;
-(char) charAtIdx:(int)n;
-(int)	firstCharIndexOfChar:(char)c
									withOffset:(size_t)idx;
-(id) trimHeadWithOffset:(size_t)n;
-(id) trimTailWithOffset:(size_t)n;

@end

