#include "OCstring+Printer.hh"
#include <stdio.h>

@implementation OCstring(Printer)
-(void) puts{
	printf("%s\n", p->c_str());
};
-(void) print{
	printf("%s\n", p->c_str());
};
-(void) putsWithFormat:(const char*) fmt {
	printf(fmt, p->c_str());
};
@end
