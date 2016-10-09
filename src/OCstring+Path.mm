#import "OCstring+Path.hh"
#import "OCstring+ContentUtil.hh"
#import "OCarray.hh"
#include <dirent.h>
#include <stdio.h>
#include <string>
using namespace std;

@implementation OCstring(Path)

-(BOOL)		isValidPath{
	DIR* d = opendir(p->c_str());
	if(d) {
		closedir(d);
		return YES;
	}else {
		FILE* f = fopen(p->c_str(), "r");
		if(f) { fclose(f); return YES;}
	}
	return NO;
};
-(BOOL)		isRelativePath{
	if((*p)[0] != '/') return YES;
	return NO;
};
-(BOOL)		isAbsolutePath{
	if((*p)[0] == '/') return YES;
	return NO;
};
-(id)			filename{
	size_t pos= (*p).find_last_of("/");
	if(pos == string::npos) {
		return [OCstring stringWithCString:p->c_str()];
	}
	else {
		string ss = p->substr(pos+1, string::npos);
		return [OCstring stringWithCString:ss.c_str()];
	}
};
-(id)			typename{
	size_t b = (*p).find_last_of(".");
	if(b != string::npos) {
		string ss = (*p).substr(b+1, string::npos);
		return [OCstring stringWithCString:ss.c_str()];
	}else{
		return [OCstring stringWithCString:""];
	}
};
-(id)			pathComponents{
	BOOL is_abs_path = ((*p)[0] == '/');
	OCarray* a = [[OCarray alloc] init];
	if(is_abs_path) [a push:S("/"),nil];
	[self scanWithString:S(R"([^\/])")
						 withBlock:^(id match){
			[a push:[match retain],nil];
		}];
	return a;
};

-(id)			insertPathComponent:(OCstring*)s
							 afterIndex:(int)idx{
	OCarray* a = [self pathComponents];
	BOOL root = NO;
	string t;
	if((*p)[0] == '/') {
		idx += 1;
	}
	[a insert:s
		 afterObjectIndex:idx];
	
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else {
			t = t + ps + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	return self;
};

-(id)			insertPathComponent:(OCstring*)s
									beforeIndex:(int)idx{
	OCarray* a = [self pathComponents];
	string t;
	if((*p)[0] == '/') {
		idx += 1;
	}
	[a insert:s
		 beforeObjectIndex:idx];
	
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + ps + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};

-(id)			insertPathComponent:(OCstring*)s
							 afterComponent:(OCstring*)ts{
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin();
	for(;itr != a.p->end(); ++itr){
		if([(*itr) equalTo:ts]) {
			break;
		}
	};

	if(itr == a.p->end()) return self;
	++itr;
	a.p->insert(itr, s);
	
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else {
			t = t + [ocs UTF8String] + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};

-(id)			insertPathComponent:(OCstring*)s
							beforeComponent:(OCstring*)ts{
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin();
	for(;itr != a.p->end(); ++itr){
		if([(*itr) equalTo:ts]) {
			break;
		}
	};
	if(itr == a.p->end()) return self;
	a.p->insert(itr, s);
	
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + [ocs UTF8String] + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};

-(id)			appendComponent:(OCstring*)s{
	OCarray* a = [self pathComponents];
	[a push:s,nil];
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + [ocs UTF8String] + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};

-(BOOL)		isDirectory{
	DIR* d = opendir(p->c_str());
	if(d) {
		closedir(d);
		return YES;
	}
	return NO;
};
-(BOOL)		isFile{
	if(not [self isDirectory]) {
		FILE* f = fopen(p->c_str(), "r");
		if(f) {
			fclose(f);
			return YES;
		}
	}
	return NO;
};
-(id)			removeRoot{
	if((*p)[0] == '/') {
		(*p).erase(0, 1);
	}
	return self;
};
-(id)			removePathComponent:(OCstring*)s{
	if(*(s.p) == "/") return self;
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin();
	for(;itr != a.p->end();++itr){
		if([(*itr) equalTo:s]) {
			break;
		}
	}
	a.p->erase(itr);
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}
		else {
			t = t + [ocs UTF8String] + "/";
		};
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};
-(id)			removePathComponentAtIndex:(int)idx{
	if((*(p))[0] == '/') {
		idx += 1;
	}
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin() + idx;
	a.p->erase(itr);
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else {
			t = t + [ocs UTF8String] + "/";
		}
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};

-(id)			removeLastPathComponent{
	OCarray* a = [self pathComponents];
	[a pop];
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + [ocs UTF8String] + "/";
		};
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
	
};


-(id)			replacePathComponent:(OCstring*)s
													with:(OCstring*)ns{
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin();
	if((*p)[0] == '/') {
		++itr;
	}
	const char* ps = [s UTF8String];
	for(;itr != a.p->end(); ++itr) {
		if([(*itr) equalTo:s]) {
			[(*itr) release];
			(*itr) = [ns retain];
		}
	}
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + [ocs UTF8String] + "/";
		};
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};


-(id)			replaceAllPathComponents:(OCstring*)s
															with:(OCstring*)ns{
	OCarray* a = [self pathComponents];
	auto itr = a.p->begin();
	if((*p)[0] == '/') {
		++itr;
	}
	const char* ps = [s UTF8String];
	for(;itr != a.p->end(); ++itr) {
		if([(*itr) equalTo:s]) {
			[(*itr) release];
			(*itr) = [ns retain];
		}
	}
	string t;
	for(OCstring* ocs : *(a.p)){
		const char* ps = [ocs UTF8String];
		if(ps[0] == '/') {
			t = t + ps;
		}else{
			t = t + [ocs UTF8String] + "/";
		};
	}
	if((*p)[p->length()-1] != '/')
		{
			t.erase(t.length() - 1);
		}
	*p = t;
	[a release];
	return self;
};


@end
