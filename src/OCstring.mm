#import "OCstring.hh"

@implementation OCstring
@synthesize p;
-(id) init{
	[super init];
	p = new std::string;
	[self autorelease];
	[self retain];
	return self;
};
-(void) dealloc{
	delete p;
	[super dealloc];
};
+(id) stringWithCstring:(const char*)cs{
	OCstring* ocs = [[OCstring alloc] init];
	*(ocs->p) = cs;
	[ocs autorelease];
	[ocs retain];
	return ocs;
};
+(id) stringWithCString:(const char*)cs{
	OCstring* ocs = [[OCstring alloc] init];
	*(ocs->p) = cs;
	[ocs autorelease];
	[ocs retain];
	return ocs;
};
+(id) stringWithOCstring:(OCstring*) ocs {
	OCstring* ocs2 = [[OCstring alloc] init];
	*(ocs2->p) = *(ocs->p);
	[ocs2 autorelease];
	[ocs2 retain];
	return ocs2;
};
+(id) stringWithStdString:(const std::string*) s{
	OCstring* ocs = [[OCstring alloc] init];
	*(ocs->p) = *s;
	[ocs autorelease];
	[ocs retain];
	return ocs;
};

-(id) initWithCString:(const char*)cs{
	[super init];
	p = new std::string;
	*(p) = cs;
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithOCstring:(OCstring*) ocs {
	[super init];
	p = new std::string;
	*(p) = *(ocs->p);
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithStdString:(const std::string*) s{
	[super init];
	p = new std::string;
	*(p) = *s;
	[self autorelease];
	[self retain];
	return self;
};

-(const char*) UTF8String{
	return p->c_str();
};

-(BOOL) equalTo:(id)o {
	if(not [o respondsToSelector:@selector(UTF8String)]) {
		return NO;
	}else {
		if((*p) == [o UTF8String]) {
			return YES;
		}else
			return NO;
	}
};
-(BOOL) equalToCstr:(const char*)ps {
	if((*p) == ps) {
		return YES;
	}else {
		return NO;
	}
};
-(id) clone{
	return [OCstring stringWithStdString:p];
};
-(size_t) length{
	return (*p).length();
};
-(BOOL) lessThan:(id)obj{
	return ((*p) < (*(((OCstring*)obj)->p))) ? YES : NO;
};

@end
