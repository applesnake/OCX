#import "OCstring+ContentUtil.hh"
#include <string>
#include <regex>
using namespace std;
#import "OCarray.hh"

@implementation OCstring(ContentUtilOC)
-(id) replace:(OCstring*)ocs0
			withStr:(OCstring*)ocs1
{
	string& s = *p;
	string& s0 = *(ocs0.p);
	string& s1 = *(ocs1.p);
	int b = s.find(s0, 0);
	if(b == string::npos) {
		return nil;
	}
	size_t l = s0.length();
	string ss0 = std::move(s.substr(0, b));
	string ss1 = std::move(s.substr(b + l, string::npos));
	s = ss0 + s1 + ss1;
	return self;
};
-(id) replaceAll:(OCstring*)ocs0
				 withStr:(OCstring*)ocs1
{
	while([self replace:ocs0 withStr:ocs1] != nil) {};
	return self;
};
-(id) stringAfterOffset:(int)i{
	string& s = *p;
	size_t n = s.length();
	if(i > (int)n) {
		return [OCstring stringWithCString:""];
	}
	while(i < 0 && (i = i + n) < 0) {}
	return [OCstring stringWithCString:(s.c_str() + i + 1)];
};
-(id) stringBeforeOffset:(int)i{
	string& s = *p;
	size_t n = s.length();
	if(i > (int)n) {
		return [OCstring stringWithCString:""];
	}
	while(i < 0 && (i = i + n) < 0) {};
	string ss = s.substr(0, i);
	return [OCstring stringWithCString:(ss.c_str())];
};
-(id) upper {
	char* ps = (char*)(p->c_str());
	size_t l = p->length();
	for(int i = 0;i < l; ++i) {
		if(ps[i] >= 'a' and ps[i] <= 'z') {
			ps[i] = ps[i] - 'a' + 'A';
		}
	}
	return self;
};
-(id) lower {
	char* ps = (char*)(p->c_str());
	size_t l = p->length();
	for(int i = 0;i < l; ++i) {
		if(ps[i] >= 'A' and ps[i] <= 'Z') {
			ps[i] = ps[i] - 'A' + 'a';
		}
	}
	return self;
};
-(double) toDouble {
	return strtod(p->c_str(), NULL);
};
-(float) toFloat{
	return strtof(p->c_str(), NULL);
};
-(int) toInt{
	return (int)strtol(p->c_str(), NULL, 10);
};
-(int) toLong{
	return strtol(p->c_str(),NULL, 10);
};
-(BOOL) toBOOL{
	const char* ps = p->c_str();
	if( (ps[0] == 'Y' || ps[0] == 'y') &&
			(ps[1] == 'E' || ps[1] == 'e') &&
			(ps[2] == 'S' || ps[2] == 's')) {
		return YES;
	}else if( (ps[0] == 'N' || ps[0] == 'n') &&
						(ps[1] == 'O' || ps[1] == 'o')) {
		return NO;
	};
};
-(int) compare:(OCstring*)s{
	return (*p) == *(s.p);
};
-(BOOL) hasPrefix:(OCstring*)s{
	int t = p->find(*(s.p), 0);
	if(t == 0) return YES;
	else return NO;
};
-(BOOL) hasSuffix:(OCstring*)s{
	int t = p->find(*(s.p), 0);
	size_t l = p->length();
	size_t l0 = s.p->length();
	if((t + l0) == l) {
		return YES;
	}else return NO;
};
-(BOOL) hasSubstring:(OCstring*)s{
	if(p->find([s UTF8String]) != string::npos) {
		return YES;
	}
	return NO;
};
-(int) lineCount{
	if(p->length() == 0) return 0;
	int n = 1;
	int t = 0;
	while( (t = p->find_first_of('\n', t)) != string::npos) {
		n += 1;
		t = t + 1;
	}
	if((*p)[p->length()-1] == '\n') n -= 1;
	return n;
};
-(id) getLine:(size_t)n{
	if(p->length() == 0) return S("");
	int k = 1;
	int t = 0;
	int b = 0;
	while( (t = p->find_first_of('\n', b)) != string::npos) {
		if(k == (n + 1)) break;
		k += 1;
		b = t + 1;
	}
	if(k == (n + 1)) {
		string ss = p->substr(b, t - b);
		return [OCstring stringWithCString:ss.c_str()];
	}else {
		return S("");
	}
};
-(id) addPrefix:(OCstring*)s{
	p->insert(0, *(s.p));
	return self;
};
-(id) addSuffix:(OCstring*)s{
	p->append(*(s.p));
};
+(regex*) regexWithString:(OCstring*)s{
	return new regex(*(s.p));
};
-(id) matchWithString:(OCstring*)s{
	smatch m;
	//regex c(*(s.p));
	regex* pc = new regex(*(s.p));
	regex_match(*p, m, *pc);
	int n = m.size();
	if(n > 0) {
		OCarray* oca = [[OCarray alloc] init];
		int k = 0;
		for(auto& i : m) {
			if(k == 0) {k += 1; continue;};
			[oca push:[[OCstring stringWithCString:i.str().c_str()] retain], nil];
		}
		delete pc;
		return oca;
	}
	delete pc;
	return nil;
};
-(id) matchWithRegex:(regex*)r{
	smatch m;
	regex_match(*p, m, (*r));
	int n = m.size();
	if(n > 0) {
		OCarray* oca = [[OCarray alloc] init];
		int k = 0;
		for(auto& i : m) {
			if(k == 0) {k += 1; continue;};
			[oca push:[[OCstring stringWithCString:i.str().c_str()] retain], nil];
		}
		return oca;
	}
	return nil;
};
-(id) scanWithString:(OCstring*)s{
	regex r(*(s.p));
	smatch m;
	auto beg = p->cbegin();
	auto end = p->cend();
	OCarray* oca = [[OCarray alloc] init];
	for(;regex_search(beg, end, m, r); beg = m.suffix().first) {
		[oca push:[[OCstring stringWithCString:m.str().c_str()] retain], nil];
	};
	return oca;
};
-(id) scanWithRegex:(regex*)r{
	smatch m;
	auto beg = p->cbegin();
	auto end = p->cend();
	OCarray* oca = [[OCarray alloc] init];
	for(;regex_search(beg, end, m, *r); beg = m.suffix().first) {
		[oca push:[[OCstring stringWithCString:m.str().c_str()] retain], nil];
	};
	return oca;
};
-(void) matchWithString:(OCstring*)s
							withBlock:(void(^)(id match)) blk
{
	smatch m;
	regex c(*(s.p));
	regex_match(*(p), m, c);
	int n = m.size();
	if(n > 0) {
		int k = 0;
		for(auto& i : m) {
			if(k == 0) {k += 1; continue;};
			id obj = [[OCstring stringWithCString:i.str().c_str()] retain];
			blk(obj);
			[obj release];
		}
	}
};

-(void) matchWithRegex:(regex*)r
							withBlock:(void(^)(id match)) blk
{
	smatch m;
	regex_match(*(p), m, *r);
	int n = m.size();
	if(n > 0) {
		int k = 0;
		for(auto& i : m) {
			if(k == 0) {k += 1; continue;};
			id obj = [[OCstring stringWithCString:i.str().c_str()] retain];
			blk(obj);
			[obj release];
		}
	}
};

-(void) scanWithString:(OCstring*)s
					 withBlock:(void(^)(id match)) blk
{
	regex r(*(s.p));
	smatch m;
	auto beg = p->cbegin();
	auto end = p->cend();
	for(;regex_search(beg, end, m, r); beg = m.suffix().first) {
		id obj = [[OCstring stringWithCString:m.str().c_str()] retain];
		blk(obj);
	};
};

-(void) scanWithRegex:(regex*)r
						 withBlock:(void(^)(id match)) blk
{
	smatch m;
	auto beg = p->cbegin();
	auto end = p->cend();
	for(;regex_search(beg, end, m, *r); beg = m.suffix().first) {
		id obj = [[OCstring stringWithCString:m.str().c_str()] retain];
		blk(obj);
	};
};
	
@end
