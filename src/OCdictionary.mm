#import "OCdictionary.hh"
#include <stdarg.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCdictionary
-(id) init{
	[super init];
	pm = new map<OCMKey,id>;
	return self;
};
-(void) dealloc{
	[self clear];
	delete pm;
	[super dealloc];
};
-(id) initWithObjectPairs:(id)k0, ...{
	va_list va;
	va_start(va, k0);
	id v0 = va_arg(va, id);
	[self initWithObjectsVAKey:k0
											 value:v0
												args:va];
	va_end(va);
	return self;
};
-(id) initWithObjectsVAKey:(id)k0
										 value:(id)v0
											args:(va_list)args
{
	map<OCMKey,id>& m = *pm;
	OCMKey xk;
	xk.kobj = [k0 retain];
	m[xk] = v0;
	id vv = nil;
	OCMKey key;
	key.kobj = va_arg(args, id);
	vv = va_arg(args, id);
	while(key.kobj != nil){
		[key.kobj retain];
		m[key] = [vv retain];
		key.kobj = va_arg(args, id);
		vv = va_arg(args, id);
	};
	[k0 release];
	return self;
};

-(id) initWithKeys:(OCarray*)kary
						values:(OCarray*)vary{
	return self;
};
-(id) initWithOCdictionary:(OCdictionary*)d{
	return self;
};
-(id) initWithMap:(map<OCMKey, id>*) m{
	return self;
};
+(id) dictWithObjectPairs:(id)k0, ... {
	
	va_list va;
	va_start(va, k0);
	id v0 = va_arg(va, id);
	OCdictionary* od = [[OCdictionary alloc] initWithObjectsVAKey:k0
																													value:v0
																													 args:va];
	va_end(va);
	return od;
};
+(id) dictWithKeys:(OCarray*)kary
						values:(OCarray*)vary{
	OCdictionary* od = [[OCdictionary alloc] init];
	[od initWithKeys:kary
			values:vary];
	return od;
};
+(id) dictWithOCdictionary:(OCdictionary*)od{
	OCdictionary* od0 = [[OCdictionary alloc] init];
	[od0 initWithOCdictionary:od];
	return od0;
};
+(id) dictWithMap:(map<OCMKey,id>*) m {
	OCdictionary* od = [[OCdictionary alloc] init];
	[od initWithMap:m];
	return od;
};
-(int) keyCount{
	return pm->size();
};
-(OCarray*)keys{
	OCarray* oary = [[OCarray alloc] init];
	for(auto& pp : (*pm)) {
		id key = pp.first.kobj;
		[oary push:[key retain],nil];
	};
	return oary;
};
-(OCarray*) values{
	OCarray* oary = [[OCarray alloc] init];
	for(auto& pp : (*pm)) {
		id value = pp.second;
		[oary push:[value retain], nil];
	};
	return oary;
};
-(id) valueForKey:(id)key {
	OCMKey kk;
	kk.kobj = [key retain];
	auto i = pm->find(kk);
	if(i != pm->end()) {
		id vv = (*i).second;
		[key release];
		return [vv retain];
	};
	[key release];
	return nil;
};
-(void) removeValueForKey:(id)key{
	OCMKey kk;
	kk.kobj = [key retain];
	auto i = pm->find(kk);
	if(i == pm->end()) return;
	id value = (*i).second;
	id okey = (*i).first.kobj;
	[okey release];
	[key  release];
	pm->erase(i);
	[value release];
};
-(id) keyForValue:(id)value{
	OCarray* oca = [[OCarray alloc] init];
	for(auto& pp :(*pm)) {
		id ko = pp.first.kobj;
		id vo = pp.second;
		if([vo equalTo:value]) {
			[oca push: ko,nil];
		}
	}
	return oca;
};
-(void) clearAll{
	for(auto& pp :(*pm)) {
		[pp.first.kobj release];
		[pp.second release];
	};
	pm->clear();
};
-(void) each_pair:(void(^)(id k, id v)) cb{
	for(auto& pp: (*pm)) {
		cb(pp.first.kobj, pp.second);
	};
};

@end
#pragma clang diagnostic pop
