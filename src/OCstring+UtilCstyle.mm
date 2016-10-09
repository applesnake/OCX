#import "OCstring+UtilCstyle.hh"
#import "OCarray.hh"

@implementation OCstring(UtilCstyle)

-(id) splitWithCstr:(const char*)sp{
	size_t b = 0;
	size_t e = 0;
	OCarray* words = [[OCarray alloc] init];
	std::string t ;
	std::string& s = (*p);
	do {
		e = s.find_first_of(sp, b);
		if(e == std::string::npos) break;
		if(e == b) {b += 1; e = b; continue;};
		t = std::move(s.substr(b, e - b));
		//sv.push_back(t);
		[words push:[OCstring stringWithCString:t.c_str()]];
		b = e + 1;
	}while(true);
	if(b != (s.length() - 1)) {
		[words push:[OCstring stringWithCString:(s.substr(b, std::string::npos)).c_str()]];
		//sv.push_back(s.substr(b, string::npos));
	}
	return words;
};
-(id) use:(const char*)sp
concatCstr:(const char*)cs, ...{
	va_list va;
	std::string t = [self UTF8String];
	t += sp;
	t += cs;
	va_start(va, cs);
	const char* pcs = nil;
	while((pcs = va_arg(va, const char*)) != nil) {
		t += sp;
		t += pcs;
	}
	va_end(va);
	return [OCstring stringWithCString:t.c_str()];
};
-(int) findCstr:(const char*)cs{
	return p->find(cs, 0);
};
-(int) findCstr:(const char*)cs
		 withOffset:(size_t)n{
	return p->find(cs, n);
};

@end
