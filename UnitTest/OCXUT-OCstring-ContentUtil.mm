#import "OCXUT-OCstring-ContentUtil.hh"
#import "OCarray.hh"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCXUT_OCstring_ContentUtilOC
-(BOOL) OCXUT_replace:(OCstring*)str
							withStr:(OCstring*)newstr{
	@autoreleasepool{
		OCstring* s0 = S("ABC-xxx-DEF");
		[s0 replace:S("xxx")
				withStr:S("123")];
		if(*(s0.p) != "ABC-123-DEF") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("ABC-xxx-DEF");
		[s0 replace:S("xxx")
				withStr:S("string")];
		if(*(s0.p) != "ABC-string-DEF") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("ABC-xxx-DEF");
		[s0 replace:S("xxx")
				withStr:S("11")];
		if(*(s0.p) != "ABC-11-DEF") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("ABC-xxx-DEF");
		[s0 replace:S("yyy")
				withStr:S("kkk")];
		if(*(s0.p) != "ABC-xxx-DEF") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_replaceAll:(OCstring*)str
								 withStr:(OCstring*)newstr{
	@autoreleasepool{
		OCstring* s0 = S("xxx-yyy-xxx");
		[s0 replaceAll:S("xxx")
					 withStr:S("111")];
		if(*(s0.p) != "111-yyy-111") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("xxx-yyy-xxx");
		[s0 replaceAll:S("xxx")
					 withStr:S("00")];
		if(*(s0.p) != "00-yyy-00"){
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("xxx-yyy-xxx");
		[s0 replaceAll:S("xxx")
					 withStr:S("111111")];
		if(*(s0.p) != "111111-yyy-111111") {
			return NO;
		};
	}
	@autoreleasepool{
		OCstring* s0 = S("xxx-yyy-xxx");
		[s0 replaceAll:S("ttt")
					 withStr:S("111")];
		if(*(s0.p) != "xxx-yyy-xxx") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_stringAfterOffset:(int)n {
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringAfterOffset:4];
		if(*(s1.p) != "56789"){
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringAfterOffset:9];
		if(*(s1.p) != "") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringAfterOffset:-2];
		if(*(s1.p) != "9"){
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringAfterOffset:0];
		if(*(s1.p) != "123456789") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_stringBeforeOffset:(int)n{
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringBeforeOffset:5];
		if(*(s1.p) != "01234") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringBeforeOffset:0];
		if(*(s1.p) != "") {
			return NO;
		};
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringBeforeOffset:-1];
		if(*(s1.p) != "012345678") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("0123456789");
		OCstring* s1 = [s0 stringBeforeOffset:11];
		if(*(s1.p) != "") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_upper{
	@autoreleasepool{
		OCstring* s0 = S("abcdefg");
		[s0 upper];
		if(*(s0.p) != "ABCDEFG") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("ABCDefg");
		[s0 upper];
		if(*(s0.p) != "ABCDEFG") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("1234abcd");
		[s0 upper];
		if(*(s0.p) != "1234ABCD") {
			return NO;
		};
	}
	@autoreleasepool{
		OCstring* s0 = S("1234");
		[s0 upper];
		if(*(s0.p) != "1234") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_lower{
	@autoreleasepool{
		OCstring* s0 = S("ABCDEFG");
		[s0 lower];
		if(*(s0.p) != "abcdefg") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("ABCDefg");
		[s0 lower];
		if(*(s0.p) != "abcdefg") {
			return NO;
		}
	}
	@autoreleasepool{
		OCstring* s0 = S("1234ABCD");
		[s0 lower];
		if(*(s0.p) != "1234abcd") {
			return NO;
		};
	}
	@autoreleasepool{
		OCstring* s0 = S("1234");
		[s0 lower];
		if(*(s0.p) != "1234") {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_toDouble{
	@autoreleasepool{
		OCstring* s = S("123.123");
		if([s toDouble] != 123.123) {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_toInt{
	@autoreleasepool{
		OCstring* s = S("123000");
		if([s toInt] != 123000) {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_toLong{
	@autoreleasepool{
		OCstring* s= S("123000");
		if([s toLong] != 123000) {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_toBOOL{
	@autoreleasepool{
		OCstring* s= S("YES");
		if([s toBOOL] != YES) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("yes");
		if([s toBOOL] != YES) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("Yes");
		if([s toBOOL] != YES) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("yeS");
		if([s toBOOL] != YES) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("NO");
		if([s toBOOL] != NO) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("No");
		if([s toBOOL] != NO) 
			return NO;
	}
	@autoreleasepool{
		OCstring* s= S("no");
		if([s toBOOL] != NO) 
			return NO;
	}
	return YES;
};
-(BOOL) OCXUT_compare:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("123");
		if([s0 compare:S("123")] == YES) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_hasPrefix:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("prefix:String");
		if([s0 hasPrefix:S("prefix")] != YES) {
			return NO;
		}
		if([s0 hasPrefix:S("xxxxxx")] != NO) {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_hasSuffix:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("String:suffix");
		if([s0 hasSuffix:S("suffix")] != YES)
			return NO;
		if([s0 hasSuffix:S("xxxxxx")] != NO)
			return NO;
	}
	return YES;
};
-(BOOL) OCXUT_hasSubstring:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("There is a big boom here.");
		if([s0 hasSubstring:S("boom here")] != YES) {
			return NO;
		}
		if([s0 hasSubstring:S("bom")] != NO) {
			return NO;
		}
	}
	return YES;
};
-(BOOL) OCXUT_lineCount{
	@autoreleasepool{
		OCstring* s0 = S("Line1\nLine2\nLine3");
		OCstring* s1 = S("Line1\nLine2\nLine3\n");
		if([s0 lineCount] == 3 &&
			 [s1 lineCount] == 3) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_getLine:(size_t)n{
	@autoreleasepool{
		OCstring* s0 = S("Line1\nLine2\nLine3");
		OCstring* s1 = S("Line1\nLine2\nLine3\n");
		OCstring* ss0 = [s0 getLine:0];
		if(*(ss0.p) != "Line1") return NO;
		OCstring* ss1 = [s0 getLine:2];
		if(*(ss1.p) != "Line3") return NO;
		OCstring* ss2 = [s1 getLine:0];
		if(*(ss2.p) != "Line1") return NO;
		OCstring* ss3 = [s1 getLine:2];
		if(*(ss3.p) != "Line3") return NO;
	}
	return YES;
};
-(BOOL) OCXUT_addPrefix:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("string");
		[s0 addPrefix:S("prefix:")];
		if(*(s0.p) == "prefix:string") {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_addSuffix:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("string");
		[s0 addSuffix:S(":suffix")];
		if(*(s0.p) =="string:suffix"){
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_matchWithString:(OCstring*)s{
	@autoreleasepool{
		OCstring* s0 = S("abc1234-0000");
		if([s0 matchWithString:S(R"(.*\d{4}-\d{4})")]){
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_matchWithRegex:(std::regex*)r{
	@autoreleasepool{
		std::regex* r = new std::regex(R"(.*\d{4}-\d{4})");
		OCstring* s = S("abc1234-0000");
		if([s matchWithRegex:r]) {
			delete r;
			return YES;
		}
		delete r;
	}
	return NO;
};
-(BOOL) OCXUT_scanWithString:(OCstring*)s{
	@autoreleasepool{
		OCstring* s = S("1111000022223333");
		OCarray* a = [s scanWithString:S(R"(\d{4})")];
		if(a and ([a length] == 4) ) {
			if([[a objectAtIndex:0] equalToCstr:"1111"] &&
				 [[a objectAtIndex:1] equalToCstr:"0000"] &&
				 [[a objectAtIndex:2] equalToCstr:"2222"] &&
				 [[a objectAtIndex:3] equalToCstr:"3333"] ) {
				return YES;
			}
		}
	}
	return NO;
};
-(BOOL) OCXUT_scanWithRegex:(std::regex*)r{
	@autoreleasepool{
		OCstring* s = S("1111000022223333");
		std::regex* r = new std::regex(R"(\d{4})");
		OCarray* a = [s scanWithRegex:r];
		if(a and ([a length] == 4) ) {
			if([[a objectAtIndex:0] equalToCstr:"1111"] &&
				 [[a objectAtIndex:1] equalToCstr:"0000"] &&
				 [[a objectAtIndex:2] equalToCstr:"2222"] &&
				 [[a objectAtIndex:3] equalToCstr:"3333"] ) {
				return YES;
			}
		}
	}
	return NO;
};
-(BOOL) OCXUT_matchWithString:(id)s
										withBlock:(void(^)(id match))blk{
	@autoreleasepool{
		__block int n = 0;
		OCstring* s0 = S("1234-0000-9999");
		[s0 matchWithString:S(R"((\d{4})\-(\d{4})\-(\d{4}))")
						 withBlock:^(id match){
				if([match equalToCstr:"1234"] ||
					 [match equalToCstr:"0000"] ||
					 [match equalToCstr:"9999"]) {
					n += 1;
				}
			}];
		if(n == 3) return  YES;
	}
	return NO;
};
-(BOOL) OCXUT_matchWithRegex:(std::regex*)r
									 withBlock:(void(^)(id match))blk{
	@autoreleasepool{
		__block int n = 0;
		OCstring* s = S("1234-0000-9999");
		std::regex* r = new std::regex(R"((\d{4})\-(\d{4})\-(\d{4}))");
		[s matchWithRegex:r
						withBlock:^(id match){
				if([match equalToCstr:"1234"] ||
					 [match equalToCstr:"0000"] ||
					 [match equalToCstr:"9999"] ) {
					n += 1;
				}
			}];
		if(n == 3) return YES;
	}
	return NO;
};

-(BOOL) OCXUT_scanWithString:(id)s
									 withBlock:(void(^)(id match))blk{
	@autoreleasepool{
		__block int n = 0;
		OCstring* s = S("1234-0000-9999");
		[s scanWithString:S(R"(\d{4})")
						withBlock:^(id match) {
				if([match equalToCstr:"1234"] ||
					 [match equalToCstr:"0000"] ||
					 [match equalToCstr:"9999"] ) {
					n += 1;
				}
			}];
		if(n == 3) return YES;
	}
	return NO;
};
-(BOOL) OCXUT_scanWithRegex:(std::regex*)r
									withBlock:(void(^)(id match))blk{
	@autoreleasepool{
		__block int n = 0;
		OCstring* s = S("1234-0000-9999");
		std::regex* r = new std::regex(R"(\d{4})");
		[s scanWithRegex:r
					 withBlock:^(id match){
				if([match equalToCstr:"1234"] ||
					 [match equalToCstr:"0000"] ||
					 [match equalToCstr:"9999"] ) {
					n += 1;
				}
			}];
		if(n == 3) return YES;
	}
	return NO;
};
@end
#pragma clang diagnostic pop
