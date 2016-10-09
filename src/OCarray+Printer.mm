#import "OCarray+Printer.hh"

@implementation OCarray (Printer)
-(void) print{
	for(id obj : (*p)) {
		printf("%s\n", [obj UTF8String]);
	};
};
-(void) printWithSeperator:(const char*)sp {
	for(id obj : (*p)) {
		if(obj){
			printf("%s%s", [obj UTF8String], sp);
		}else {
			printf("nil%s", sp);
		}
	}
};
@end
