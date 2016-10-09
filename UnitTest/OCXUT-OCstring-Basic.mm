#import "OCXUT-OCstring-Basic.hh"
#include <stdio.h>
#include <stdlib.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCXUT_OCstring_Basic
-(BOOL) OCXUT_initWithCstring{
	OCstring* ps = [[OCstring alloc] initWithCString:"ABCD"];
	if( (*(ps.p)) == "ABCD") {
		[ps release];
		return YES;
	}else {
		[ps release];
		return NO;
	}
};
-(BOOL) OCXUT_initWithOCstring{
	OCstring* ps0 = [OCstring stringWithCString:"ABCD"];
	OCstring* ps1 = [[OCstring alloc] initWithOCstring:ps0];
	if(*(ps1.p) == *(ps0.p)) {
		[ps0 release];
		[ps1 release];
		return YES;
	}else {
		[ps0 release];
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_initWithStdstring{
	string s("ABCD");
	OCstring* ps1 = [[OCstring alloc] initWithStdString:&s];
	if(*(ps1.p) == s){
		[ps1 release];
		return YES;
	}else {
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_stringWithCstring{
	OCstring* ps1 = [OCstring stringWithCString:"ABCD"];
	if(*(ps1.p) == "ABCD") {
		[ps1 release];
		return YES;
	}else {
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_stringWithOCstring{
	OCstring* ps0 = [OCstring stringWithCString:"ABCD"];
	OCstring* ps1 = [OCstring stringWithOCstring:ps0];
	if(*(ps1.p) == "ABCD") {
		[ps0 release];
		[ps1 release];
		return YES;
	}else {
		[ps0 release];
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_stringWithStdstring{
	string s("ABCD");
	OCstring* ps1 = [OCstring stringWithStdString:&s];
	if(*(ps1.p) == "ABCD") {
		[ps1 release];
		return YES;
	}else {
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_length{
	OCstring* ps1 = [OCstring stringWithCString:"0123456789"];
	if([ps1 length] == 10) {
		[ps1 release];
		return YES;
	}
	else {
		[ps1 release];
		return NO;
	}
};
-(BOOL) OCXUT_equalTo{
	OCstring* ps0 = [OCstring stringWithCString:"ABCDEF"];
	OCstring* ps1 = [OCstring stringWithCString:"ABCDEF"];
	OCstring* ps2 = [OCstring stringWithCString:"ABCDEFG"];
	if([ps1 equalTo:ps0] == YES) {
		if([ps1 equalTo:ps2] == NO) {
			[ps0 release];
			[ps1 release];
			[ps2 release];
			return YES;
		}else {
			[ps0 release];
			[ps1 release];
			[ps2 release];
			return NO;
		}
	}else {
		[ps0 release];
		[ps1 release];
		[ps2 release];
		return NO;
	}
};
-(BOOL) OCXUT_lessThan{
	OCstring* ps0 = [OCstring stringWithCString:"DEFG"];
	OCstring* ps1 = [OCstring stringWithCString:"BCDE"];
	OCstring* ps2 = [OCstring stringWithCString:"ACDE"];
	if( ([ps1 lessThan:ps0] == YES) &&
			([ps1 lessThan:ps2] == NO)) {
		[ps0 release];
		[ps1 release];
		[ps2 release];
		return YES;
	}else {
		[ps0 release];
		[ps1 release];
		[ps2 release];
		return NO;
	};
};
-(BOOL) OCXUT_UTF8String{
	OCstring* ps = [OCstring stringWithCString:"ABCD"];
	if([ps UTF8String] == string("ABCD")) {
		[ps release];
		return YES;
	}else {
		[ps release];
		return NO;
	}
};
-(BOOL) OCXUT_clone{
	OCstring* ps = [OCstring stringWithCString:"ABCD"];
	OCstring* ps1 = [ps clone];
	if([ps equalTo:ps1]) {
		[ps release];
		[ps1 release];
		return YES;
	}else {
		[ps release];
		[ps1 release];
		return NO;
	}
};

@end
#pragma clang diagnostic pop
