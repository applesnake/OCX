#import "OCXUT-OCcache-Basic.hh"

int main(int argc, char* argv[]) {
	OCXUT_OCcache_Basic* to = [[OCXUT_OCcache_Basic alloc] init];
	[to scanTestMethodsUseFilter:"OCXUT_"];
	[to setupWithCaseName: "OCcache Basic Test - 001"
						description:"OCcache Basic Methods Test."];
	[to showProgress];
	[to start];
	[to teardown];
	if([to fail] > 0) {
		return -1;
	}
	return 0;

	return 0;
};
