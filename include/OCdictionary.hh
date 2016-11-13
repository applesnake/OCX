#pragma once

#include <map>
using namespace std;
#include <stdarg.h>
#import <objc/NSObject.h>
#import "OCarray.hh"
@class OClist;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"
struct OCMKey{
	id kobj;
	bool operator < (const OCMKey kk) const{
		return [kobj lessThan:kk.kobj];
	};
	OCMKey(id obj) {
		kobj = obj;
	};
	OCMKey(){ kobj = nil;};
	~OCMKey(){ kobj = nil;};
	OCMKey& operator = (const OCMKey& k) {
		kobj = k.kobj;
		return *this;
	};
};
@protocol OCdictKeyProtocol
-(BOOL) lessThan:(id) obj;
@end

@interface OCdictionary : NSObject
{
	map<OCMKey, id>* p;
}
@property (readonly, nonatomic) map<OCMKey,id>* p;
-(id) init;
-(void) dealloc;

+(id) dictWithObjectPairs:(id)k0, ...;
+(id) dictWithObjectPairsNoCopy:(id)k0, ...;

+(id) dictWithKeys:(OCarray*)kary
						values:(OCarray*)vary
							copy:(BOOL)yn;

+(id) dictWithOCdictionary:(OCdictionary*)d;

+(id) dictWithMap:(map<OCMKey,id>*) m;

-(id) initWithObjectsVAKey:(id)k0
										 value:(id)v0
											args:(va_list)args;

-(id) initWithObjectPairs:(id)k0, ...;
-(id) initWithKeys:(OCarray*)kary
						values:(OCarray*)vary
							copy:(BOOL)yn;

-(id) initWithOCdictionary:(OCdictionary*)d;
-(id) initWithMap:(map<OCMKey,id>*) m;

-(int)	keyCount;
-(OCarray*) keys;
-(OCarray*) values;
-(id)		valueForKey:(id)key;
-(void)	removeValueForKey:(id)key;
-(id)		keyForValue:(id)value;
-(void) clearAll;

-(void) each_pair:(void(^)(id k, id v))cb;

@end

#pragma clang diagnostic pop
