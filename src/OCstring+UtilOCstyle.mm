#import "OCstring+UtilOCstyle.hh"
#import "OCarray.hh"

@implementation OCstring(UtilOCstyle)

-(id) splitWithOCstr:(OCstring*)ocs{
	size_t b = 0;
	size_t e = 0;
	OCarray* words = [[OCarray alloc] init];
	std::string t ;
	std::string& s = (*p);
	const	char* sp = [ocs UTF8String];
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
-(id) use:(OCstring*)ocs_sp
concatOCstr:(OCstring*)ocs, ...{
	va_list va;
	std::string t = [self UTF8String];
	t += [ocs_sp UTF8String];
	t += [ocs UTF8String];
	va_start(va, ocs);
	id obj = nil;
	const char* sp = [ocs_sp UTF8String];
	while((obj = va_arg(va, OCstring*)) != nil) {
		t += sp;
		t += [obj UTF8String];
	}
	va_end(va);
	return [OCstring stringWithCString:t.c_str()];
};
-(int) findOCstr:(OCstring*)ocs{
	return p->find([ocs UTF8String], 0);
};
-(int) findOCstr:(OCstring*)ocs
		withOffset:(size_t)n{
	return p->find([ocs UTF8String], n);
};

@end
