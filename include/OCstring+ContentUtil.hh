#pragma once
#include "OCstring.hh"

#include <regex>

@interface OCstring(ContentUtilOC)
-(id) replace:(OCstring*)str
			withStr:(OCstring*)new_str;

-(id) replaceAll:(OCstring*)str
				 withStr:(OCstring*)new_str;

-(id) stringAfterOffset:(int)n;
-(id) stringBeforeOffset:(int)n;
-(id) upper;
-(id) lower;

-(double) toDouble;
-(float)	toFloat;
-(int)		toInt;
-(long)		toLong;
-(BOOL)		toBOOL;
-(int)		compare:(OCstring*)s;
-(BOOL)		hasPrefix:(OCstring*)s;
-(BOOL)		hasSuffix:(OCstring*)s;
-(BOOL)		hasSubstring:(OCstring*)s;
-(int)		lineCount;
-(id)			getLine:(size_t)n;
-(id)			addPrefix:(OCstring*)s;
-(id)			addSuffix:(OCstring*)s;
 
+(std::regex*)	regexWithString:(OCstring*)s;
-(id)			matchWithString:(OCstring*)s;
-(id)			matchWithRegex:(std::regex*)r;
-(id)			scanWithString:(OCstring*)s;
-(id)			scanWithRegex:(std::regex*)r;

-(void) matchWithString:(OCstring*)s
							withBlock:(void(^)(id match)) blk;

-(void) matchWithRegex:(std::regex*)r
						 withBlock:(void(^)(id match)) blk;

-(void) scanWithString:(OCstring*)s
						 withBlock:(void(^)(id match)) blk;

-(void) scanWithRegex:(std::regex*)r
						withBlock:(void(^)(id match)) blk;

@end
