#pragam once

#import <objc/NSObject.h>
#include <string>
#include <vector>
#include <map>
#include <utility>
using namespace std;

@interface OCXUnitTestCase : NSObject
{
	string name;
	string desc;
	map<string, SEL>	nameSelMap;
	map<SEL, string>	selNameMap;
	map<SEL, BOOL>		selStatMap;
}
+(id) caseWithName:(const char*)name
							desc:(const char*)user_info;
+(id) caseWithName:(const char*)name
							desc:(const char*)user_info
						 block:(BOOL(^tcblock)());

-(id) initCaseWithName:(const char*)name
									desc:(const char*)user_info;
-(id) initCaseWithName:(const char*)name
									desc:(const char*)user_info
								 block:(BOOL(^tcblock)());
-(id) setup;
-(id) tearDown;
-(void) upSel:(SEL)sel;
-(void) downSel:(SEL)sel;
-(void) upAllSels;
-(void) downAllSels;
-(void) upSelFromString:(const char*)s;
-(void) downSelFromString:(const char*)s;
-(void) upSelsWithVector:(const vector<SEL>*)v;
-(void) downSelsWithVector:(const vector<SEL>*)v;
-(void) upSelsWithStringVector:(const vector<string>*)v;
-(void) downSelsWitStringVector:(const vector<string>*)v;
@end
