#import "OCXUnitTestObject.hh"

#import "OCmetaToolOSX.hh"
#include <algorithm>


@implementation OCXUnitTestObject
@synthesize success, fail;
-(id) init{
	[super init];
	showProgress = NO;
	return self;
};
-(void) dealloc{
	[self teardown];
	[super dealloc];
};
-(int)	scanTestMethodsUseFilter:(const char*)filter{
	Class c = [self class];
	methodNames = std::move(get_objc_method_names_for_class(c));
	for(auto& i : methodNames) {
		if(i.find(filter) != string::npos) {
			methodSwitches[i] = YES;
		}
	}
	filterString = filter;
	return methodSwitches.size();
};
-(BOOL)	setupWithCaseName:(const char*)name
							description:(const char*)desc
{
	caseName = name;
	desc = desc;
	char buf[1024] = {0};
	sprintf(buf, "<> SETUP  <> [Case: %s]\n", name);
	info += buf;
	sprintf(buf, "-> Total Test Methods: %d\n", methodSwitches.size());
	info += buf;
	sprintf(buf, "-> Desc: %s\n", desc);
	info += buf;
	return YES;
};
-(BOOL)	teardown
{
	char buf[1024] = {0};
	string result;
	sprintf(buf, "-> [Testing Finish] <- \n");
	result += buf;
	int succ = 0;
	for(auto& p : testResults) {
		if(p.second == YES) {
			succ += 1;
		}
	};
	success = succ;
	fail = testResults.size() - succ;

	sprintf(buf, "-> SUCCESS: %d\n", succ);
	result += buf;
	sprintf(buf, "-> FAIL:    %d\n", testResults.size() - succ);
	result += buf;
	sprintf(buf, "<> FINISH <> [Case: %s] \n\n", caseName.c_str());
	result += buf;
	printf("%s", result.c_str());
	return YES;
};
-(void) start {
	printf("%s", info.c_str());
	printf("-> [Testing Begin] <-\n");
	unsigned int total = methodSwitches.size();
	unsigned int n = 0;
	int width = 120;
	
	size_t nf = filterString.size();
	char buffer[1024];
	for(auto& i : methodNames) {
		const string& name = i;
		if(methodSwitches[name] == YES) {
			if(showProgress) {
				sprintf(buffer, "-> [%4d/%-4d] %s : %s ",
								n + 1,
								total,
								filterString.c_str(),
								(name.c_str() + nf));
				size_t len = strlen(buffer);
				size_t left = width - len - 3;
				for(int i = 0 ;i < left; ++i) {
					strcat(buffer, ".");
				}
				printf("%s", buffer);
			}
			id t = [self performSelector:sel_registerName(name.c_str())];
			if(t) {
				printf(" [OK]\n");
			}else {
				printf(" [NG]\n");
			}
			testResults[name] = t ? YES : NO;
			
		}else {
			printf("-> [%4d/-%4d] IGNORE: %32s \n", name.c_str());
		}
		n += 1;
	};
};
-(void) showProgress{
	showProgress = YES;
};

@end
