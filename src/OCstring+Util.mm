#include <regex>
#include <string>
using namespace std;
#include <stdarg.h>

#import "OCstring+Util.hh"
#import "OCarray.hh"

@implementation OCstring(Util)

-(char) lastChar{
	size_t l = (*p).length();
	if(l == 0) return 0;
	return (*p)[l - 1];
};
-(char) firstChar{
	if((*p).length() == 0) {
		return 0;
	}
	return (*p)[0];
};
-(char) charAtIdx:(int)n{
	size_t l = (*p).length();
	if(l == 0) return 0;
	while(n < 0) {
		n += l;
	}
	while(n >= l) {
		n -= l;
	};
	return (*p)[n];
};
-(int) firstCharIndexOfChar:(char)c
								 withOffset:(size_t)n{
	return p->find(c, n);
};
-(id) trimHeadWithOffset:(size_t)n{
	size_t l = p->length();
	string t;
	if(n > l) return self;
	if(n == l) {
		t = "";
	}else {
		t = p->substr(n, string::npos);
	}
	return [OCstring stringWithCstring:t.c_str()];
};
-(id) trimTailWithOffset:(size_t)n{
	size_t l = p->length();
	if(n >= l) return self;
	string t = p->substr(0, n);
	return [OCstring stringWithCstring:t.c_str()];
};

@end
