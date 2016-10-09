#import "OCXUT-OCstring-Util.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCstring_Util* to = [[OCXUT_OCstring_Util alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCstring Util Test - 001"
			description:"OCstring Util Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
