#pragma once
#import "OCarray.hh"

@implementation OCarray
@synthesize p;
-(id) init{
	[super init];
	p = new std::vector<id>;
	[self autorelease];
	[self retain];
	return self;
};
-(void) dealloc{
	[self removeAllObjects];
	delete p;
	[super dealloc];
};
-(id) initWithObjects:(id)o, ...{
	va_list va;
	va_start(va, o);
	id t = nil;
	p = new std::vector<id>;
	p->push_back([[o clone] retain]);
	while((t = va_arg(va, id)) != nil) {
		p->push_back([[t clone] retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithOCarray:(OCarray*)oca {
	p = new std::vector<id>;
	for(id t : *(oca.p)) {
		p->push_back([t clone]);
	}
	[self autorelease];
	[self retain];
	
	return self;
};
-(id) initWithStdVector:(const std::vector<id>*) v{
	p = new std::vector<id>;
	for(id t : *v) {
		p->push_back(t);
	}
	
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithObjectsNoCoyp:(id)o,...{
	va_list va;
	va_start(va, o);
	id t = nil;
	p->push_back([o retain]);
	while((t = va_arg(va, id)) != nil) {
		p->push_back([t retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithOCarrayNoCopy:(OCarray*)oca {
	p = new std::vector<id>;
	for(id t : *(oca.p)) {
		p->push_back([t retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
-(id) initWithStdVectorNoCopy:(const std::vector<id>*) v{
	p = new std::vector<id>;
	for(id t : *v) {
		p->push_back([t retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
+(id) arrayWithOCarray:(OCarray*)oca{
	OCarray* oca2 = [[OCarray alloc] initWithOCarray:oca];
	return oca2;
};
+(id) arrayWithObjects:(id)o, ... {
	OCarray* oca = [[OCarray alloc] init];
	va_list va;
	va_start(va, o);
	id t = nil;
	oca->p->push_back([[o clone] retain]);
	while((t = va_arg(va, id)) != nil) {
		oca->p->push_back([[t clone] retain]);
	}
	[oca autorelease];
	[oca retain];
	return oca;
};
+(id) arrayWithStdVector:(const std::vector<id>*)v{
	OCarray* oca2 = [[OCarray alloc] initWithStdVector:v];
	return oca2;
};

-(id) initWithObjectsNoCopy:(id)o, ...{
	va_list va;
	va_start(va, o);
	id t = nil;
	p = new std::vector<id>;
	p->push_back([o retain]);
	while((t = va_arg(va, id)) != nil) {
		p->push_back([t retain]);
	}
	[self autorelease];
	[self retain];
	return self;
};
+(id) arrayWithObjectsNoCopy:(id)o, ... {
	OCarray* oca = [[OCarray alloc] init];
	va_list va;
	va_start(va, o);
	id t = nil;
	oca->p->push_back([o retain]);
	while((t = va_arg(va, id)) != nil) {
		oca->p->push_back([t retain]);
	}
	[oca autorelease];
	[oca retain];
	return oca;
};
+(id) arrayWithOCarrayNoCopy:(OCarray*)oca{
	OCarray* oca2 = [[OCarray alloc] initWithOCarray:oca];
	return oca2;
};
+(id) arrayWithStdVectorNoCopy:(const std::vector<id>*)v{
	OCarray* oca2 = [[OCarray alloc] initWithStdVector:v];
	return oca2;
};

-(size_t) length{
	return p->size();
};
-(id) pop {
	auto itr = --(p->end());
	if(itr == p->end()) return self;
	id t = (*itr);
	if(t) {
		[t release];
	}
	p->pop_back();
	return self;
};
-(id) push:(id)o, ... {
	va_list va;
	va_start(va, o);
	id t = nil;
	p->push_back([o retain]);
	while((t = va_arg(va, id)) != nil) {
		p->push_back([t retain]);
	}
	return self;
};
-(id) objectAtIndex:(int)idx {
	return (*p)[idx];
};
-(int) indexOfObject:(id)obj {
	if(not [obj respondsToSelector:@selector(equalTo:)]) {
		return -1;
	}
	int n = 0;
	for(id t : (*p)) {
		if([obj equalTo:t]) {
			return n;
		}
		n += 1;
	}
	return -1;
};
-(id) setObject:(id) obj
				atIndex:(int) idx{
	int len = p->size();
	if(idx < 0 && len <= 0) {
		return self;
	}
	if(idx < 0 && (idx + (len - 1)) > 0) {
		idx = len + idx - 1;
	}else if(idx < 0 && (idx + (len - 1)) < 0) {
		return self;
	}
	id t = (*p)[idx];
	if(t) {
		[t release];
	}
	(*p)[idx] = [obj retain];
	return self;
};
-(void) removeAllObjects{
	for(id t : (*p)) {
		if(t) {
			[t release];
		}
	}
	p->clear();
};
-(void) forward_each:(void(^)(id obj)) user_cb {
	if(not user_cb) return;
	for(id obj : (*p)) {
		user_cb(obj);
	}
};
-(void) backward_each:(void(^)(id obj)) user_cb {
	if(not user_cb) return;
	int n = (*p).size();
	for(int i = n - 1; i >= 0; --i) {
		user_cb((*p)[i]);
	}
};
-(void) resize:(size_t)new_size {
	size_t cur_size = (*p).size();
	if(new_size > cur_size) {
		std::vector<id>* pvnew = new std::vector<id>;
		pvnew->resize(new_size,nil);
		for(int i = 0;i < cur_size; ++i) {
			(*pvnew)[i] = (*p)[i];
		}
		delete p;
		p= pvnew;
	}else if(new_size < cur_size){
		for(int i = new_size; i < cur_size; ++i) {
			id obj = (*p)[i];
			[obj release];
		}
		(*p).resize(new_size);
	}
};

-(id)			insert:(id)o
afterObjectIndex:(size_t)i{
	p->insert(p->begin() + i + 1, o);
	return self;
};
-(id)			insert:(id)o
beforeObjectIndex:(size_t)i{
	p->insert(p->begin() + i, o);
	return self;
};
-(id)			insert:(id)o
		 afterObject:(id)t{
	auto itr = p->begin();
	for(;itr != p->end(); ++itr) {
		if([(*itr) equalTo:o]) {
			++itr;
			break;
		}
	}
	p->insert(itr, t);
	return self;
};

-(id)			insert:(id)o
		beforeObject:(id)t{
	auto itr = p->begin();
	for(;itr != p->end(); ++itr) {
		if([(*itr) equalTo:o]) {
			break;
		}
	}
	p->insert(itr, t);
	return self;
};


@end

