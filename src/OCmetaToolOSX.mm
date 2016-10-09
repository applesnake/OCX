#import "OCmetaToolOSX.hh"
#include <stdlib.h>
vector<string> get_objc_method_names_for_class(Class c) {
	unsigned int n = 0;
	Method* methods = class_copyMethodList(c, &n);
	if(n == 0) return {};
	vector<string> v;
	for(unsigned int i = 0;i < n; ++i) {
		const char* p = sel_getName(method_getName(methods[i]));
		v.push_back(p);
	};
	free(methods);
	return v;
};
Method get_objc_imethod_by_name_for_class(Class c, const string& name) {
	SEL s = sel_registerName(name.c_str());
	if(not s) {
		return nil;
	}else {
		return class_getInstanceMethod(c, s);
	}
};
BOOL	set_imethod_for_class(Class c, const string& name, IMP imp, const string& types){
	Method m = class_getInstanceMethod(c, sel_registerName(name.c_str()));
	if(m) {
		method_setImplementation(m, imp);
		return YES;
	}else{
		return class_addMethod(c, sel_registerName(name.c_str()), imp, types.c_str());
	};
};
BOOL set_imethod_for_superclass(Class c, const string& name, IMP imp, const string& types) {
	return class_addMethod(c, sel_registerName(name.c_str()), imp, types.c_str());
};
