#pragma once
#import "OCXUnitTestObject.hh"
#import "OCstring.hh"
#import "OCstring+ContentUtil.hh"

@interface OCXUT_OCstring_ContentUtilOC : OCXUnitTestObject
-(BOOL) OCXUT_replace:(OCstring*)str
							withStr:(OCstring*)newstr;
-(BOOL) OCXUT_relaceAll:(OCstring*)str
								withStr:(OCstring*)new_str;
-(BOOL) OCXUT_stringAfterOffset:(int)n;
-(BOOL) OCXUT_stringBeforeOffset:(int)n;
-(BOOL) OCXUT_upper;
-(BOOL) OCXUT_lower;
-(BOOL) OCXUT_toDouble;
-(BOOL) OCXUT_toFloat;
-(BOOL) OCXUT_toInt;
-(BOOL) OCXUT_toLong;
-(BOOL) OCXUT_toBOOL;
-(BOOL) OCXUT_compare:(OCstring*)s;
-(BOOL) OCXUT_hasPrefix:(OCstring*)s;
-(BOOL) OCXUT_hasSuffix:(OCstring*)s;
-(BOOL) OCXUT_hasSubstring:(OCstring*)s;
-(BOOL) OCXUT_lineCount;
-(BOOL) OCXUT_getLine:(size_t)n;
-(BOOL) OCXUT_addPrefix:(OCstring*)s;
-(BOOL) OCXUT_addSuffix:(OCstring*)s;
-(BOOL) OCXUT_matchWithString:(OCstring*)s;
-(BOOL) OCXUT_matchWithRegex:(std::regex*)r;
-(BOOL) OCXUT_scanWithString:(OCstring*)s;
-(BOOL) OCXUT_scanWithRegex:(std::regex*)r;

-(BOOL) OCXUT_matchWithString:(id)s
										withBlock:(void(^)(id match))blk;
-(BOOL) OCXUT_matchWithRegex:(std::regex*)r
									 withBlock:(void(^)(id match))blk;

-(BOOL) OCXUT_scanWithString:(id)s
										withBlock:(void(^)(id match))blk;
-(BOOL) OCXUT_scanWithRegex:(std::regex*)r
									withBlock:(void(^)(id match))blk;



	


@end
