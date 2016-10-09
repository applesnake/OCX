#import "OClist.hh"
#import "OCarray.hh"
#include <stdarg.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OClist
@synthesize p;
-(id) init
{
	[super init];
	p = new std::list<id>;
	return self;
};
-(void) dealloc {
	for(id i : (*p)) {
		[i release];
	}
	p->clear();
	delete p;
	p = nil;
	[super dealloc];
};
+(id) listWithObjects:(id)o, ...{
	OClist* ocl = [[OClist alloc] init];
	[ocl autorelease];
	va_list va;
	va_start(va, o);
	id t = va_arg(va, id);
	//[o retain];
	ocl->p->push_back([[o clone] retain]);
	while(t != nil) {
		ocl->p->push_back([[t clone] retain]);
		t = va_arg(va, id);
	}
	va_end(va);
	return ocl; 
};

+(id) listWithOClist:(OClist*)ocl{
	OClist* l = [[OClist alloc] initWithOClist:ocl];
	return l;
};
+(id) listWithOCarray:(OCarray*)oca{
	OClist* l = [[OClist alloc] initWithOCarray:oca];
	return l;
};
+(id) listWithStdList:(const std::list<id>*) l{
	OClist* nl = [[OClist alloc] initWithStdList:l];
	[nl autorelease];
	[nl retain];
	return nl;
};

+(id) listWithObjectsNoCopy:(id)o, ...{
	OClist* ocl = [[OClist alloc] init];
	[ocl autorelease];
	va_list va;
	va_start(va, o);
	id t = va_arg(va, id);
	ocl->p->push_back([o retain]);
	while(t != nil) {
		ocl->p->push_back([t retain]);
		t = va_arg(va, id);
	}
	va_end(va);
	return ocl; 
};
+(id) listWithOClistNoCopy:(OClist*)ocl{
	OClist* l = [[OClist alloc] initWithOClistNoCopy:ocl];
	return l;
};
+(id) listWithOCarrayNoCopy:(OCarray*)oca{
	OClist* l = [[OClist alloc] initWithOCarrayNoCopy:oca];
	return l;
};
+(id) listWithStdListNoCopy:(const std::list<id>*) l{
	OClist* nl = [[OClist alloc] initWithStdList:l];
	return nl;
};

-(id) initWithObjects:(id)o, ...{
	va_list va;
	va_start(va, o);
	p = new std::list<id>;
	p->push_back([o retain]);
	id t = va_arg(va, id);
	while(t != nil) {
		p->push_back([[t clone] retain]);
		t = va_arg(va, id);
	}
	va_end(va);
	[self autorelease];
	[self retain];
	return self; 
};

-(id) initWithOClist:(OClist*)ocl{
	p = new std::list<id>;
	for(id o : *(ocl.p)) {
		p->push_back([o clone]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithOCarray:(OCarray*)oca{
	p = new std::list<id>;
	for(id o : *(oca.p)) {
		p->push_back([o clone]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithStdList:(const std::list<id>*) l{
	p = new std::list<id>;
	for(id o : *l) {
		p->push_back([o clone]);
	}
	[self autorelease];
	[self retain];
	return self;
};

-(id) initWithObjectsNoCopy:(id)o, ...{
	va_list va;
	va_start(va, o);
	p = new std::list<id>;
	p->push_back([o retain]);
	id t = va_arg(va, id);
	while(t != nil) {
		p->push_back([t retain]);
		t = va_arg(va, id);
	}
	va_end(va);
	[self autorelease];
	[self retain];
	return self; 
};

-(id) initWithOClistNoCopy:(OClist*)ocl{
	p = new std::list<id>;
	for(id o : *(ocl.p)) {
		p->push_back([o retain]);
	}
	[self autorelease];
	[self retain];
	return self;
	return self;
};
-(id) initWithOCarrayNoCopy:(OCarray*)oca{
	p = new std::list<id>;
	for(id o : *(oca.p)) {
		p->push_back([o retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithStdListNoCopy:(const std::list<id>*) l{
	p = new std::list<id>;
	for(id o : *l) {
		p->push_back([o retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};

-(size_t) length{
	return (size_t)(p->size());
};
-(id) popHead{
	if(p->begin() != p->end()) {
		id t = *(p->begin());
		if(t) [t release];
		p->pop_front();
	}
	return self;
};
-(id) popTail{
	auto itr = p->end();
	--itr;
	if(itr != p->end()){
		id t = *itr;
		if(t) [t release];
		p->pop_back();
	}
	return self;
};
-(id) pushHead:(id)o, ...
{
	p->push_front([o retain]);
	va_list va;
	va_start(va, o);
	id t = nil;
	while((t = va_arg(va, id)) != nil) {
		p->push_front([t retain]);
	}
	va_end(va);
	return self;
};
-(id) pushBack:(id)o, ...
{
	p->push_back([o retain]);
	va_list va;
	va_start(va, o);
	id t = nil;
	while((t = va_arg(va, id)) != nil) {
		p->push_back([t retain]);
	}
	va_end(va);
	return self;
};
-(id) insertObject:(id)o
				afterIndex:(size_t)idx
{
	int len = [self length];
	if(len == 0) {
		for(int i = 0;i < idx - 1; ++i) {
			p->push_back(nil);
		}
		p->push_back([o retain]);
	}
	else if(len > 0){
		if(idx < (len - 1)) {
			auto itr = p->begin();
			for(int i = 0;i < idx + 1; ++i) {
				++itr;
			};
			p->insert(itr, [o retain]);
		}
		else {
			for(int i = 0; i < (idx - len); ++i) {
				p->push_back(nil);
			}
			p->push_back([o retain]);
		}
	}
	return self;
};
-(id) insertObject:(id)o
			 beforeIndex:(size_t)idx
{
	int len = [self length];
	if(len == 0) {
		for(int i = 0;i < idx - 1; ++i) {
			p->push_back(nil);
		}
		p->push_back([o retain]);
	}else if(len > 0) {
		if(idx < (len - 1) ){
			auto itr = p->begin();
			for(int i = 0;i < idx; ++i) {
				++itr;
			};
			p->insert(itr, [o retain]);
		}else{
			// idx >= len
			for(int i = 0; i < (idx - len); ++i) {
				p->push_back(nil);
			}
			p->insert(--(p->end()), [o retain]);
		}
	}
	return self;
};
-(id) objectAtIndex:(size_t)idx{
	int len = [self length];
	if(idx > len) return nil;
	auto itr = p->begin();
	for(int i = 0;i < idx; ++i) {
		++itr;
	};
	return (*itr);
};

-(size_t) indexOfObject:(id)o
{
	[o retain];
	if(not [o respondsToSelector:@selector(equalTo:)]) {
		[o release];
		return -1;
	}
	int n = 0;
	for(id obj : (*p)) {
		if([o equalTo:obj]) {
			[o release];
			return n;
		}
		else
			++n;
	}
	return -1;
};

-(id) removeObjectAtIndex:(size_t)idx
{
	int len = [self length];
	int offset  = idx;
	if((len - offset)  > offset) {
		auto itr = p->begin();
		for(int i = 0;i < offset; ++i) {
			++itr;
		}
		id t = *itr;
		if(t) [t release];
		p->erase(itr);
	}
	else {
		auto itr = --(p->end());
		for(int i = len - 1;i > offset; --i,--itr ){
		};
		id t = *itr;
		if(t) [t release];
		p->erase(itr);
	}
	return self;
};
-(size_t) removeObjectFromIndex:(size_t)b
											withRange:(size_t)r{
	if(r <= 0) return 0;
	int len = p->size();
	if(b > len) return 0;
	r = ((b + r + 1) > len) ? (len - b) : r;
	auto itr = p->begin();
	for(int i = 0;i < b; ++i) {
		++itr;
	}
	for(int i = 0;i < r; ++i) {
		id t = *itr;
		if(t){
			[*itr release];
		}
		p->erase(itr++);
	}
	return r;
};
-(size_t) removeObjectBeforeIndex:(size_t)b
									 afterIndex:(size_t)e{
	if(e < b) return 0;
	int len = p->size();
	e = (e > (len - 1)) ? (len - 1) : e;
	auto itr = p->begin();
	auto itr2 = p->begin();
	for(int i = 0;i < e; ++i) {
		++itr2;
	}
	++itr2;
	int n = 0;
	for(int i = e - b; i < (len - (b + 1)); ++i) {
		if(*itr2) {
			[*itr2 release];
		}
		p->erase(itr2++);
		n += 1;
	}
	for(int i = 0;i < b; ++i) {
		if(*itr) {
			[*itr release];
		}
		p->erase(itr++);
		n += 1;
	}
	return n;
};

-(id) setObject:(id)o
				atIndex:(size_t)idx{
	int len = [self length];
	if(len <= 0) {
		return self;
	}
	auto itr = p->begin();
	for(int i = 0;i < idx; ++i) {
		++itr;
	}
	id t = (*itr);
	if(t) [t release];
	(*itr) = [o retain];
	return self;
};
-(id) removeAllObjects {
	for(id t : (*p)) {
		if(t) [t release];
	}
	p->clear();
	return self;
};

-(id) trimBeforeIndex:(size_t)idx {
	int len = [self length];
	if(len <= 0) return self;
	if(idx > (len-1) )  {
		[self removeAllObjects];
	}else {
		for(int i = 0;i < idx; ++i) {
			id t = [self headObject];
			[self popHead];
		}
	}
	return self;
};
-(id) trimAfterIndex:(size_t)idx {
	int len = [self length];
	if(len <= 0) return self;
	if(idx > (len - 1)) {
		return self;
	}else {
		for(int i = 0;i < (len - idx - 1); ++i) {
			id t = [self tailObject];
			[self popTail];
		}
	}
	return self;
};
-(id) headObject{
	auto t = p->begin();
	if(t != p->end()) return (*t);
	else return nil;
};
-(id) tailObject{
	auto t = --(p->end());
	if(t == p->end()) return nil;
	else return *t;
};

@end
#pragma clang diagnostic pop
