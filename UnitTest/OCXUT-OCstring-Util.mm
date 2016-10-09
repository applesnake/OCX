#pragma once

#import "OCXUT-OCstring-Util.hh"
#import "OCarray.hh"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"
@implementation OCXUT_OCstring_Util
-(BOOL) OCXUT_lastChar{
	OCstring* ocs = S("OCXUT-OCstring-Util");
	if([ocs lastChar] == 'l') {
		[ocs release];
		return YES;
	}else {
		[ocs release];
		return NO;
	};
};
-(BOOL) OCXUT_firstChar{
	OCstring* ocs = S("OCXUT-OCstring-Util");
	if([ocs firstChar] == 'O') {
		[ocs release];
		return YES;
	}else {
		[ocs release];
		return NO;
	}
};
-(BOOL) OCXUT_charAtIdx:(int)n{
	OCstring* ocs = S("OCXUT-OCstring-Util");
	if( ([ocs charAtIdx:4] == 'T') &&
			([ocs charAtIdx:-1] == 'l') &&
			([ocs charAtIdx:-4] == 'U') )
		{
			[ocs release];
			return YES;
		}
	else {
		[ocs release];
		return NO;
	}
};
-(BOOL) OCXUT_firstCharIndexofChar:(char)c
												withOffset:(size_t)idx{
	OCstring* ocs = S("OCXUT-OCstring-Util");
	if( ([ocs firstCharIndexOfChar:'U'
						withOffset:0] == 3) &&
			([ocs firstCharIndexOfChar:'O'
						withOffset:1] == 6) 
			){
		[ocs release];
		return YES;
	}else {
		[ocs release];
		return NO;
	}
};
-(BOOL) OCXUT_trimHeadWithOffset:(size_t)n{
	OCstring* s = S("OCXUT-OCstring-Util");
	OCstring* ocs[3] = {
		[s trimHeadWithOffset:5],
		[s trimHeadWithOffset:0],
		[s trimHeadWithOffset:([s length] - 1)]
	};
	if( (*(ocs[0].p) == "-OCstring-Util") &&
			(*(ocs[1].p) == "OCXUT-OCstring-Util") &&
			(*(ocs[2].p) == "l"))
		{
			for(int i = 0;i < 3;++i) [ocs[i] release];
			return YES;
		}
	else
		{
			for(int i = 0;i < 3;++i) [ocs[i] release];
			return NO;
		}
};
-(BOOL) OCXUT_trimTailWithOffset:(size_t)n{
	OCstring* s = S("OCXUT-OCstring-Util");
	OCstring* ocs[3] = {
		[s trimTailWithOffset:5],
		[s trimTailWithOffset:0],
		[s trimTailWithOffset:([s length] - 1)]};
	if( (*(ocs[0].p) == "OCXUT") &&
			(*(ocs[1].p) == "") &&
			(*(ocs[2].p) == "OCXUT-OCstring-Uti"))
		{
			for(int i = 0;i < 3;++i) [ocs[i] release];
			return YES;
		}	
	else 
		{
			for(int i = 0;i < 3;++i) [ocs[i] release];
			return NO;
		}
};
-(BOOL) OCXUT_splitWithOCstr:(OCstring*)sp{
	OCstring* s = S("OCXUT-OCstring-Util");
	OCstring* t = S("-");
	OCarray* a = [s splitWithOCstr:t];
	if([a length] == 3) {
		if( [[a objectAtIndex:0] equalToCstr:"OCXUT"] &&
				[[a objectAtIndex:1] equalToCstr:"OCstring"] &&
				[[a objectAtIndex:2] equalToCstr:"Util"] )
			{
				[s release];
				[a release];
				[t release];
				return YES;
			}
	}else{
		[s release];
		[a release];
		[t release];
		return NO;
	};
};
-(BOOL) OCXUT_splitWithCstr:(const char*)sp{
	OCstring* s = S("OCXUT-OCstring-Util");
	OCarray* a = [s splitWithCstr:"-"];
	if([a length] == 3) {
		if( [[a objectAtIndex:0] equalToCstr:"OCXUT"] &&
				[[a objectAtIndex:1] equalToCstr:"OCstring"] &&
				[[a objectAtIndex:2] equalToCstr:"Util"] )
			{
				[s release];
				[a release];
				return YES;
			}
	}else{
		[s release];
		[a release];
		return NO;
	};
};

-(BOOL) OCXUT_use:(OCstring*)sp
			concatOCstr:(OCstring*)oc, ...{
	OCstring* oc_ary[] = {
		S("A"),
		S("B"),
		S("C"),
		S("D+FIN")
	};
	OCstring* s0 = S("Head");
	OCstring* sp0 = S("-");
	OCstring* ts = [s0 use:sp0
										 concatOCstr: oc_ary[0], oc_ary[1], oc_ary[2], oc_ary[3], nil];
	if( *(ts.p) == "Head-A-B-C-D+FIN") {
		for(int i = 0;i < 4; ++i) [oc_ary[i] release];
		[s0 release];
		[ts release];
		[sp0 release];
		return YES;
	}else {
		for(int i = 0;i < 4; ++i) [oc_ary[i] release];
		[s0 release];
		[ts release];
		[sp0 release];
		return NO;
	}
};
-(BOOL) OCXUT_findOCstr:(OCstring*)ocs{
	OCstring* s0 = S("OCXUT-OCstring-Util");
	OCstring* s1 = S("OCstring");
	OCstring* s2 = S("ABCD");
	int n = [s0 findOCstr:s1];
	int m = [s0 findOCstr:s2];
	if(n == 6 && m == -1) {
		[s0 release];
		[s1 release];
		[s2 release];
		return YES;
	}else {
		[s0 release];
		[s1 release];
		[s2 release];
		return NO;
	}
};
-(BOOL) OCXUT_findOCstr:(OCstring*)ocs 
						 withOffset:(int)nn{
	OCstring* s0 = S("OCXUT-OCstring-Util");
	OCstring* s1 = S("ing");
	OCstring* s2 = S("xxx");
	int n = [s0 findOCstr:s1
							withOffset:5];
	int m = [s0 findOCstr:s2
							withOffset:5];
	if(n == 11 && m == -1) {
		[s0 release];
		[s1 release];
		[s2 release];
		return YES;
	}else {
		[s0 release];
		[s1 release];
		[s2 release];
		return NO;
	};
};

-(BOOL) OCXUT_use:(const char*)sp
			concatCstr:(const char*)pc, ...{
	OCstring* s0 = S("Head");
	OCstring* s1 = [s0 use:"-"
										 concatCstr:"A","B", "C", "D+FIN", nil];
	if( *(s1.p) == "Head-A-B-C-D+FIN") {
		[s0 release];
		[s1 release];
		return YES;
	}else {
		[s0 release];
		[s1 release];
		return NO;
	}
};
-(BOOL) OCXUT_findCstr:(const char*)pcs{
	OCstring* s0 = S("OCXUT-OCstring-Util");
	int n = [s0 findCstr:"OCstring"];
	int m = [s0 findCstr:"ABCD"];
	if(n == 6 && m == -1) {
		[s0 release];
		return YES;
	}else {
		[s0 release];
		return NO;
	}
};
-(BOOL) OCXUT_findCstr:(const char*)pcs
						 withOffset:(int)nn
{
	OCstring* s0 = S("OCXUT-OCstring-Util");
	int n = [s0 findCstr:"ing"
							withOffset:5];
	int m = [s0 findCstr:"xxx"
							withOffset:5];
	if(n == 11 && m == -1) {
		[s0 release];
		return YES;
	}else {
		[s0 release];
		return NO;
	};
};

@end
#pragma clang diagnostic pop
