#import "OCXUT-OCfile-Basic.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCfile_Basic* to = [[OCXUT_OCfile_Basic alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCfile Basic Test - 001"
						description:"OCfile Basic Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	system("rm ./1");
	if([to fail] > 0) {
		return -1;
	}
	return 0;
};
