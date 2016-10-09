#import "OCXUnitTestObject.hh"

@interface TestUnitTest : OCXUnitTestObject 
{
}
-(BOOL) myTest_case01;
-(BOOL) myTest_case02;
-(BOOL) myTest_case03;
@end
@implementation TestUnitTest
-(BOOL) myTest_case01{
	return YES;
};
-(BOOL) myTest_case02{
	return NO;
};
-(BOOL) myTest_case03{
	return YES;
};
@end

int main(int argc,char* argv[]) {
	TestUnitTest* tut = [[TestUnitTest alloc] init];
	[tut scanTestMethodsUseFilter:"myTest_"];
	
	[tut setupWithCaseName:"TUT-01"
			 description:"TestUnitTest No.01"];
	[tut showProgress];
	[tut start];
	[tut teardown];
	return 0;
};
