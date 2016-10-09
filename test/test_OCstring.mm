#import "OCstring+Printer.hh"
#import "OCmetaToolOSX.hh"

#import <stdarg.h>
#include <objc/runtime.h>

id test_user_method(id t, SEL s,  ...){
	printf("Object: 0x%x\n", t);
	printf("%s\n", sel_getName(s));
	OCstring* ocs = (OCstring*)t;
	printf("This is test for function: set_method_for_class.: %s\n", ocs.p);
	return t;
};
@interface TObj: NSObject
-(BOOL) test;
-(BOOL) test2;
@end

@implementation TObj
-(BOOL) test{
	return YES;
};
-(BOOL) test2{
	return NO;
};
@end

int main(int argc, char* argv[]) {
	OCstring* t = [OCstring stringWithCString:"ABC"];
	id t2 = [S("123") retain];
	[t2 puts];
	[t puts];
	vector<string> v = std::move(get_objc_method_names_for_class([t class]));
	for(int i = 0;i < v.size(); ++i) {
		printf("%s\n", v[i].c_str());
	};
	Method m = get_objc_imethod_by_name_for_class([t class], "UTF8String");
	if(m) printf("UTF8String: YES\n");
	else printf("UTF8String: NO\n");

	BOOL ok = set_imethod_for_class([t class], "testUserMethod", (IMP)(test_user_method), "v");
	if(ok) {
		printf("set OK.\n");
		[t testUserMethod];
	}else{
		printf("Fail.\n");
	};
	TObj* to = [[TObj alloc] init];
	printf("%d\n", [to performSelector:@selector(test)]);
	printf("%d\n", [to performSelector:@selector(test2)]);
	
	return 0;
};
