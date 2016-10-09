#pragma once

#import <objc/NSObject.h>
#include <string>
#include <vector>
#include <map>
using namespace std;

@interface OCXUnitTestObject : NSObject 
{
	string								filterString;
	map<string, BOOL>			methodSwitches;
	map<string, BOOL>			testResults;
	vector<string>				methodNames;
	string								info;
	string								caseName;
	BOOL									showProgress;
	size_t								success;
	size_t								faile;
}
@property (readonly, nonatomic) size_t success;
@property (readonly, nonatomic) size_t fail;
-(int)	scanTestMethodsUseFilter:(const char*)s;
-(BOOL)	setupWithCaseName:(const char*)name
							description:(const char*)desc;
-(BOOL)	teardown;
-(void) start;
-(void) showProcess;

@end
