#import "OClist.hh"
#include <stdarg.h>
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OClist
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
	OClist* l = [[OClist alloc] init];
	[l autorelease];
	return l;
};
+(id) listWithOCarray:(OCarray*)oca{
	OClist* l = [[OClist alloc] init];
	[l autorelease];
	return l;
};
+(id) listWithStdList:(const std::list<id>*) l{
	OClist* nl = [[OClist alloc] init];
	[nl autorelease];
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
	OClist* l = [[OClist alloc] init];
	[l autorelease];
	return l;
};
+(id) listWithOCarrayNoCopy:(OCarray*)oca{
	OClist* l = [[OClist alloc] init];
	return l;
};
+(id) listWithStdListNoCopy:(const std::list<id>*) l{
	OClist* nl = [[OClist alloc] init];
	[nl autorelease];
	return nl;
};

-(id) initWithObjects:(id)o, ...{
	va_list va;
	va_start(va, o);
	p->push_back([o retain]);
	id t = va_arg(va, id);
	while(t != nil) {
		p->push_back([[t clone] retain]);
	}
	va_end(va);
	return self; 
};

-(id) initWithOClist:(OClist*)ocl{
	return self;
};
-(id) initWithOCarray:(OCarray*)oca{
	return self;
};
-(id) initWithStdList:(const std::list<id>*) l{
	return self;
};

-(id) initWithObjectsNoCopy:(id)o, ...{
	va_list va;
	va_start(va, o);
	p->push_back([o retain]);
	id t = va_arg(va, id);
	while(t != nil) {
		p->push_back([t retain]);
	}
	va_end(va);
	return self; 
};

-(id) initWithOClistNoCopy:(OClist*)ocl{
	return self;
};
-(id) initWithOCarrayNoCopy:(OCarray*)oca{
	return self;
};
-(id) initWithStdListNoCopy:(const std::list<id>*) l{
	return self;
};

-(int) length{
	return (int)(p->size());
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
		p->push_front([t retain]);
	}
	va_end(va);
	return self;
};
-(id) insertObject:(id)o
				afterIndex:(int)idx
{
	if(idx < 0) return self;
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
			 beforeIndex:(int)idx
{
	if(idx < 0) return self;
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
-(id) objectAtIndex:(int)idx{
	int len = [self length];
	if(idx > len) return nil;
	if(idx < 0 &&
		 (len + idx) > 0) {
		auto itr = p->begin();
		for(int i = 0;i < (len + idx); ++i) {
			++itr;
		};
		return (*itr);
	}
	else 
		return nil;
};

-(int) indexOfObject:(id)o
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

-(id) removeObjectAtIndex:(int)idx
{
	int len = [self length];
	if(idx < 0 && (idx + len - 1) < 0) {
		return self;
	}
	int offset  = idx < 0 ? (idx + len - 1): idx;
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
		for(int i = len - 1;i > offset; ++i ) {
			--itr;
		}
		id t = *itr;
		if(t) [t release];
		p->erase(itr);
	}
	return self;
};
-(int) removeObjectFromIndex:(int)b
									withRange:(int)r{
	if(b < 0 || r <= 0) return 0;
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
-(int) removeObjectBeforeIndex:(int)b
									 afterIndex:(int)e{
	if(b < 0 || e < 0 || e < b) return 0;
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
				atIndex:(int)idx{
	int len = [self length];
	if(idx < 0 && len <= 0) {
		return self;
	}
	if(idx < 0 && (len + idx) > 0) {
		idx = len + idx;
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

-(id) trimBeforeIndex:(int)idx {
	int len = [self length];
	if(idx < 0 && len <= 0) return self;
	if(idx < 0 && (idx + len - 1) > 0) idx = len + idx - 1;
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
-(id) trimAfterIndex:(int)idx {
	int len = [self length];
	if(idx < 0 && len <= 0) return self;
	if(idx < 0 && (idx + len - 1) > 0) idx = (len + idx - 1);
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
