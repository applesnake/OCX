#import "OCXUT-OCstring-Basic.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCstring_Basic* to = [[OCXUT_OCstring_Basic alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCstring Basic Test - 001"
			description:"Class OCstring Basic Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
