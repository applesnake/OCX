#import "OCXUT-OClist-Basic.hh"
int main(int argc, char* argv[]) {
	OCXUT_OClist_Basic* to = [[OCXUT_OClist_Basic alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OClist Basic Test - 001"
			description:"OClist Basic Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
