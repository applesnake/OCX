#import "OCXUT-OCstring-Path.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCstring_Path* to = [[OCXUT_OCstring_Path alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCstring Path Test - 001"
						description:"OCstring Path Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
