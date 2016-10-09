#pragma once

// Objective-C Meta data extract methods with C++ interfaces.
// 1. Objective-C sytle - Secondary
// 2. CXX style - Important


#include <vector>
#include <string>
using namespace std;

#include <objc/objc.h>
#include <objc/runtime.h>

vector<string>	get_objc_method_names_for_class(Class c);
Method					get_objc_imethod_by_name_for_class(Class c,
																									 const string& name);
BOOL						set_imethod_for_class(Class c,
																			const string& name,
																			IMP imp,
																			const string& types);
BOOL						set_imethod_for_superclass(Class c,
																					 const string& name,
																					 IMP imp);
