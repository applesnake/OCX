#pragma once 
#import "OCXUnitTestObject.hh"
#import "OCstring.hh"
#import "OCstring+Util.hh"

@interface OCXUT_OCstring_Util : OCXUnitTestObject
{
}
-(BOOL) OCXUT_lastChar;
-(BOOL) OCXUT_firstChar;
-(BOOL) OCXUT_charAtIdx:(int)n;
-(BOOL) OCXUT_firstCharIndexOfChar:(char)c
												withOffset:(size_t)idx;
-(BOOL) OCXUT_trimHeadWithOffset:(size_t)idx;
-(BOOL) OCXUT_trimTailWithOffset:(size_t)idx;

-(BOOL) OCXUT_splitWithOCstr:(OCstring*)sp;
-(BOOL) OCXUT_use:(OCstring*)sp
			concatOCstr:(OCstring*)oc, ...;
-(BOOL)	OCXUT_findOCstr:(OCstring*)ocs;
-(BOOL) OCXUT_findOCstr:(OCstring*)ocs
						 withOffset:(int)n;

-(BOOL) OCXUT_splitWithCstr:(const char*)sp;
-(BOOL) OCXUT_use:(const char*)sp
			concatCstr:(const char*)oc, ...;
-(BOOL)	OCXUT_findCstr:(const char*)ocs;
-(BOOL) OCXUT_findCstr:(const char*)ocs
						withOffset:(int)n;

@end
