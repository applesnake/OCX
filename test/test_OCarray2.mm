#import "OCarray.hh"
#import "OCXUT-OCarray-Basic.hh"
int main(int argc, char* argv[]) {
	OCXUT_OCarray_Basic* to = [[OCXUT_OCarray_Basic alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCarray Basic Test - 001"
			description:"OCarray Basic Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
