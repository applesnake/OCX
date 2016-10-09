#pragma once
#import <objc/NSObject.h>
#include <string>

#define S(s) [OCstring stringWithCString:s]

@interface OCstring : NSObject
{
	std::string* p;
}
@property (readonly, atomic) std::string* p;
-(id) init;
-(void) dealloc;
-(id) initWithCString:(const char*)cs;
-(id) initWithOCstring:(OCstring*)ocs;
-(id) initWithStdString:(const std::string*)s;

+(id) stringWithCString:(const char*)cs;
+(id) stringWithOCstring:(OCstring*)ocs;
+(id) stringWithStdString:(const std::string*)s;
-(size_t)	length;
-(BOOL) equalTo:(id)o;
-(BOOL) equalToCstr:(const char*)o;
-(BOOL) lessThan:(id)o;
-(const char*) UTF8String;
-(id) clone;
@end

