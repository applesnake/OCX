#import "OCXUT-OCstring-ContentUtil.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCstring_ContentUtilOC* to = [[OCXUT_OCstring_ContentUtilOC alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCstring Content Util Test - 001"
						description:"OCstring Content Util Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
